import 'package:attendance_app/instructor/view/features/authentication/signup_page/widgets/animated_signup_widgets/button_animated_signup.dart';
import 'package:attendance_app/instructor/view/features/authentication/signup_page/widgets/animated_signup_widgets/text_signup_animation.dart';
import 'package:attendance_app/model/student_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'manager/signup_cubit/sign_up_cubit.dart';

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
                key: cubit.signupFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const TextSignUpAnimation(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextFormField(
                            controller: cubit.nameController,
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
                            controller: cubit.emailController,
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
                            controller: cubit.passwordController,
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
                            controller: cubit.phoneNumberController,
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
                                    color: cubit.coursesMenuIsChosen
                                        ? const Color(0xFFBDBDBD)
                                        : const Color(0xFFFF0000),
                                    width: 0.0,
                                  ),
                                ),
                              ),
                            ),
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: cubit.coursesMenuIsChosen
                                  ? Colors.grey.shade400
                                  : const Color(0xFFFF0000),
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
                                    color: cubit.dateMenuIsChosen
                                        ? const Color(0xFFBDBDBD)
                                        : const Color(0xFFFF0000),
                                    width: 0.0,
                                  ),
                                ),
                              ),
                            ),
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: cubit.dateMenuIsChosen
                                  ? Colors.grey.shade400
                                  : const Color(0xFFFF0000),
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
                      child: AnimatedSignUpButton(validate: () {
                        cubit.validateMenus();
                        if (cubit.signupFormKey.currentState!.validate() &&
                            cubit.coursesMenuIsChosen &&
                            cubit.dateMenuIsChosen) {
                          cubit.login(true);
                        } else {
                          cubit.login(false);
                        }
                      }, onTap: () {
                        cubit.signup(
                            studentModel: StudentModel(
                                assignment: 0,
                                finalProject: 0,
                                project1: 0,
                                project2: 0,
                                name: cubit.nameController.text,
                                email: cubit.emailController.text,
                                phoneNo: cubit.phoneNumberController.text,
                                profilePicture: '',
                                attendance: 0,
                                absence: 24,
                                totalGrades: 0,
                                courseName: cubit.coursesDropDownMenuValue,
                                courseDate: cubit.dateDropDownMenuValue),
                            password: cubit.passwordController.text);
                        Navigator.pop(context);
                      }),
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
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
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
