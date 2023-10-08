import 'package:flutter/material.dart';

class DefaultButton extends StatefulWidget {
  final String text;
  final Function() onTap;
  const DefaultButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  State<DefaultButton> createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialButton(
        onPressed: () {
          widget.onTap();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.text,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black),
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.black,
                size: MediaQuery.of(context).size.width * 0.07,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
