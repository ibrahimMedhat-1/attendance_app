import 'package:attendance_app/instructor/view/signup_page/animated_signup_widgets/button_animated_login.dart';
import 'package:attendance_app/instructor/view_model/signup_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'animated_signup_widgets/text_signup_animation.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

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
                key: cubit.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const TextSignUpAnimation(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextFormField(
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
                          TextFormField(
                            keyboardType: TextInputType.phone,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            decoration: const InputDecoration(
                                hintText: 'Phone Number',
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
                          DropdownButton<String>(
                            value: cubit.coursesDropDownMenuValue,
                            items: cubit.courses,
                            dropdownColor: Colors.black,
                            underline: Container(
                              height: 1.0,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: cubit.coursesMenuIsChosen ? const Color(0xFFBDBDBD) : const Color(0xFFFF0000),
                                    width: 0.0,
                                  ),
                                ),
                              ),
                            ),
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: cubit.coursesMenuIsChosen ? Colors.grey.shade400 : const Color(0xFFFF0000),
                            ),
                            style: const TextStyle(color: Colors.white),
                            onChanged: (value) {
                              cubit.changeCoursesMenu();
                              cubit.changeCoursesDropDownMenuValue(value!);
                            },
                            hint: const Text(
                              'Choose your course',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          DropdownButton<String>(
                            value: cubit.dateDropDownMenuValue,
                            items: cubit.dates,
                            dropdownColor: Colors.black,
                            underline: Container(
                              height: 1.0,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: cubit.dateMenuIsChosen ? const Color(0xFFBDBDBD) : const Color(0xFFFF0000),
                                    width: 0.0,
                                  ),
                                ),
                              ),
                            ),
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: cubit.dateMenuIsChosen ? Colors.grey.shade400 : const Color(0xFFFF0000),
                            ),
                            style: const TextStyle(color: Colors.white),
                            onChanged: (value) {
                              cubit.changeDateMenu();
                              cubit.changeDateDropDownMenuValue(value!);
                            },
                            hint: const Text(
                              'Choose your date',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: double.infinity,
                      child: AnimatedSignUpButton(
                          validate: () {
                            cubit.validateMenus();
                            if (cubit.formKey.currentState!.validate() && cubit.coursesMenuIsChosen && cubit.dateMenuIsChosen) {
                              cubit.login(true);
                            } else {
                              cubit.login(false);
                            }
                          },
                          onTap: () {}),
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
