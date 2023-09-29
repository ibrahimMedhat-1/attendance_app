import 'package:flutter/material.dart';

class TextSignUpAnimation extends StatefulWidget {
  const TextSignUpAnimation({super.key});

  @override
  State<TextSignUpAnimation> createState() => _TextSignUpAnimationState();
}

class _TextSignUpAnimationState extends State<TextSignUpAnimation> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    animation = Tween<Offset>(begin: Offset(0, 0.1), end: Offset(0, -0.1)).animate(animationController);
    animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) => child!,
      child: SlideTransition(
        position: animation,
        child: Text(
          'SignUp',
          style: TextStyle(
            shadows: [
              Shadow(
                offset: const Offset(3, 3),
                color: Colors.grey.shade300,
                blurRadius: 10,
              )
            ],
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.width * 0.15,
          ),
        ),
      ),
    );
  }
}
