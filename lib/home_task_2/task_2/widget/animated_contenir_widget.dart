import 'package:flutter/material.dart';



class CustomWidget extends StatefulWidget {
  final bool isP;

  const CustomWidget({
    required this.isP,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomWidget> createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<CustomWidget> {
  bool isPressed1 = true;
  bool isPressed2 = true;
  bool isPressed3 = true;

  @override
  void didUpdateWidget(covariant CustomWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    isPressed1 = widget.isP;

  }

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 80,
          height: 80,
          onEnd: () {
            isPressed2 = isPressed1;
            setState(() {});
          },
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius:
            BorderRadius.circular(isPressed1 ? 0 : 100),
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 80,
          height: 80,
          onEnd: () {
            isPressed3 = isPressed2;
            setState(() {});
          },
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius:
            BorderRadius.circular(isPressed2 ? 0 : 100),
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 80,
          height: 80,
          onEnd: () {
            isPressed1 = !isPressed1;
            setState(() {});
          },
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius:
            BorderRadius.circular(isPressed3 ? 0 : 100),
          ),
        ),
      ],
    );
  }
}
