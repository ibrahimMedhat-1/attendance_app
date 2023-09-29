import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/signup_cubit/sign_up_cubit.dart';

class AnimatedSignUpButton extends StatefulWidget {
  final Function() onTap;
  final Function() validate;

  const AnimatedSignUpButton({
    super.key,
    required this.validate,
    required this.onTap,
  });

  @override
  State<AnimatedSignUpButton> createState() => _AnimatedSignUpButtonState();
}

class _AnimatedSignUpButtonState extends State<AnimatedSignUpButton> with TickerProviderStateMixin {
  late AnimationController animationController;
  late AnimationController animationControllerError;
  late Animation<Offset> animation;
  late Animation<double> animationOpacity;
  late Animation<Offset> animationError;
  int animationRepeat = 0;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );
    animationControllerError = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    animationController.addListener(() {
      setState(() {
        if (animationRepeat > 2) {
          animationControllerError.stop();
        }
      });
    });
    animationControllerError.addListener(() {
      setState(() {});
    });
    animation = Tween<Offset>(begin: const Offset(0, 0), end: const Offset(1, 0)).animate(animationController);
    animationOpacity = Tween<double>(begin: 1, end: 0).animate(animationController);
    animationError =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0.1, 0)).animate(animationControllerError);
  }

  @override
  void dispose() {
    animationController.dispose();
    animationControllerError.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {},
      builder: (context, state) {
        SignUpCubit signUpCubitCubit = SignUpCubit.get(context);
        return InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            animationRepeat = 0;
            widget.validate();
            if (signUpCubitCubit.loggedIn == true) {
              setState(() {
                animationController.forward();
              });
              animationController.addStatusListener((status) {
                if (status == AnimationStatus.completed) {
                  widget.onTap();
                }
              });
            } else if (signUpCubitCubit.loggedIn == false) {
              setState(() {
                animationControllerError.forward();
                animationControllerError.addStatusListener((status) {
                  if (status == AnimationStatus.completed) {
                    if (animationRepeat < 3) {
                      animationControllerError.reverse().then((value) {
                        animationRepeat++;
                      });
                    }
                  } else if (status == AnimationStatus.dismissed) {
                    if (animationRepeat < 3) {
                      animationControllerError.forward().then((value) {
                        animationRepeat++;
                      });
                    }
                  }
                });
                animationControllerError.reset();
              });
            }
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width / 2,
                padding: const EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  color: Theme.of(context).secondaryHeaderColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: AnimatedBuilder(
                  animation: signUpCubitCubit.loggedIn ? animationController : animationControllerError,
                  builder: (BuildContext context, Widget? child) => child!,
                  child: SlideTransition(
                    position: signUpCubitCubit.loggedIn ? animation : animationError,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        Icons.arrow_forward,
                        size: MediaQuery.of(context).size.width * 0.07,
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 0),
                opacity: animationOpacity.value,
                child: const Text(
                  'SignUp',
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
