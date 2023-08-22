import 'package:attendance_app/instructor/view/login_page/login_page.dart';
import 'package:attendance_app/instructor/view_model/login_cubit/login_cubit.dart';
import 'package:attendance_app/instructor/view_model/signup_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    const MyApp(),
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
      ],
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {},
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              LoginCubit.get(context).reFitScreen();
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: MaterialApp(
              title: 'Attendance',
              debugShowCheckedModeBanner: false,
              darkTheme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
                scaffoldBackgroundColor: Colors.black,
                useMaterial3: true,
              ),
              themeMode: ThemeMode.dark,
              home: const LogIn(),
            ),
          );
        },
      ),
    );
  }
}
