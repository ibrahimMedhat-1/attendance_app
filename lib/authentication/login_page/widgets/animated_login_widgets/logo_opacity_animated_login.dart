import 'package:flutter/cupertino.dart';

class LogoOpacity extends StatefulWidget {
  const LogoOpacity({super.key});

  @override
  State<LogoOpacity> createState() => _LogoOpacityState();
}

class _LogoOpacityState extends State<LogoOpacity> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500 * 2),
    );
    animation = Tween<double>(begin: 0, end: 1).animate(animationController);
    animationController.forward();
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500 * 2),
      opacity: animation.value,
      child: Image.asset('assets/logos/AlphaCodeLogo.png'),
    );
  }
}
