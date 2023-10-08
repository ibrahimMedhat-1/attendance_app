import 'package:attendance_app/authentication/signup_page/widgets/animated_signup_widgets/text_signup_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../model/instructor_model.dart';
import 'manager/signup_cubit/sign_up_cubit.dart';

class InstructorSignUpPage extends StatelessWidget {
  const InstructorSignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {},
      builder: (context, state) {
        SignUpCubit cubit = SignUpCubit.get(context);
        return Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
              child: Form(
                key: cubit.signupFormKeyInst,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const TextSignUpAnimation(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            controller: cubit.nameControllerInstrictor,
                            keyboardType: TextInputType.name,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            decoration: const InputDecoration(
                                hintText: 'Name',
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                )),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ' Please fill all the required fields';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: cubit.emailControllerInstructor,
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            decoration: const InputDecoration(
                                hintText: 'Email',
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                )),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ' Please fill all the required fields';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: cubit.passwordControllerInstructor,
                            keyboardType: TextInputType.visiblePassword,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            obscureText: cubit.obscure,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      cubit.changeObscure();
                                    },
                                    icon: Icon(cubit.suffixIcon)),
                                hintText: 'Password',
                                hintStyle: const TextStyle(
                                  color: Colors.white,
                                )),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ' Please fill all the required fields';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        cubit.instructorSignup(
                            password: cubit.passwordControllerInstructor.text,
                            instructorModel: InstructorModel(
                                email: cubit.emailControllerInstructor.text,
                                name: cubit.nameControllerInstrictor.text));
                        Navigator.pop(context);
                      },
                      child: const Text("SignUp"),
                    ),
                    Row(
                      children: [
                        const Text(
                          'Already have an account ?',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'LogIn',
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.teal,
                                  ),
                            ))
                      ],
                    )
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
