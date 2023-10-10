import 'package:attendance_app/instructor/layout/layout.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'authentication/login_page/manager/login_cubit/login_cubit.dart';
import 'authentication/signup_page/manager/signup_cubit/sign_up_cubit.dart';
import 'firebase_options.dart';
import 'instructor/layout/manger/layout_cubit/layout_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
        BlocProvider<SignUpCubit>(create: (context) => SignUpCubit()),
        BlocProvider<LayoutCubit>(create: (context) => LayoutCubit()),
      ],
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (MediaQuery.of(context).viewInsets.bottom > 0) {
            LoginCubit.get(context).fitScreen();
          } else {
            LoginCubit.get(context).reFitScreen();
          }
          return GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: MaterialApp(
              title: 'Attendance',
              debugShowCheckedModeBanner: false,
              darkTheme: ThemeData(
                appBarTheme: const AppBarTheme(
                  color: Colors.black,
                  iconTheme: IconThemeData(
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                textTheme: TextTheme(
                    bodyMedium: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                )),
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
                scaffoldBackgroundColor: Colors.black,
                useMaterial3: true,
              ),
              themeMode: ThemeMode.dark,
              home: const InstructorLayOut(),
            ),
          );
        },
      ),
    );
  }
}
