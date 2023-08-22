import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/login_cubit/login_cubit.dart';
import '../home_page/home_page.dart';
import '../signup_page/animated_signup_widgets/button_animated_login.dart';
import '../signup_page/signup_page.dart';
import 'animated_login_widgets/logo_opacity_animated_login.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        LoginCubit cubit = LoginCubit.get(context);
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: cubit.formKey,
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// logo - text form fields
                    SizedBox(
                      height: MediaQuery.of(context).size.height * cubit.height,
                      width: double.infinity,
                      child: Column(
                        children: [
                          const Expanded(child: LogoOpacity()),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(color: Colors.white),
                            onTap: () {
                              cubit.fitScreen();
                            },
                            decoration: const InputDecoration(
                              hintText: 'Email',
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                            validator: (data) {
                              if (data!.isEmpty) {
                                return 'Please fill the required fields';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            style: const TextStyle(color: Colors.white),
                            obscureText: cubit.obscure,
                            onTap: () {
                              cubit.fitScreen();
                            },
                            decoration: InputDecoration(
                              suffixIcon: TextButton(
                                onPressed: () {
                                  cubit.changeObscure();
                                },
                                child: Icon(cubit.suffixIcon),
                              ),
                              hintText: 'Password',
                              hintStyle: const TextStyle(color: Colors.white),
                            ),
                            validator: (data) {
                              if (data!.isEmpty) {
                                return 'Please fill the required fields';
                              }
                              return null;
                              // return '';
                            },
                          ),
                        ],
                      ),
                    ),

                    /// login - signup
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Spacer(),
                          AnimatedSignUpButton(
                            validate: () {
                              if (cubit.formKey.currentState!.validate()) {
                                cubit.login(true);
                              } else {
                                cubit.login(false);
                              }
                            },
                            onTap: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) => const HomePage()));
                            },
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              const Text(
                                'Don\'t have an account? ',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (builder) => const SignUp()));
                                },
                                child: const Text('SignUp'),
                              ),
                            ],
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
