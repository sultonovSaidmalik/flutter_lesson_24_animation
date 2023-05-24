import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function() onTap;
  final String text;

  const CustomButton({
    required this.onTap,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        minimumSize: Size(
          MediaQuery.of(context).size.width,
          50),
      ),
      child:  Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.blue,
        ),
      ),
    );
  }
}
