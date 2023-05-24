import 'package:flutter/material.dart';
import 'package:flutter_lesson_24/home_task_2/task_2/widget/text_button.dart';

import 'widget/animated_contenir_widget.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePages2(),
    );
  }
}

class HomePages2 extends StatefulWidget {
  const HomePages2({Key? key}) : super(key: key);

  @override
  State<HomePages2> createState() => _HomePages2State();
}

class _HomePages2State extends State<HomePages2>
    with SingleTickerProviderStateMixin {
  String pages = "first";
  bool isPressed1 = true;

  late AnimationController controller;
  late Animation<AlignmentGeometry> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = Tween<Alignment>(
            begin: Alignment.centerLeft, end: Alignment.centerRight)
        .animate(
            CurvedAnimation(parent: controller, curve: MyCurve()))
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          controller.repeat(reverse: true);
        }
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Curve",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.cyan,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: switch (pages) {
              'first' => CustomWidget(isP: isPressed1),
              'second' => AlignTransition(
                  alignment: animation,
                  child: const SizedBox(
                    height: 80,
                    width: 100,
                    child: ColoredBox(
                      color: Colors.red,
                    ),
                  ),
                ),
              'third' => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AlignTransition(
                      alignment: animation,
                      child: const SizedBox(
                        height: 60,
                        width: 150,
                        child: ColoredBox(
                          color: Colors.red,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    AlignTransition(
                      alignment: animation,
                      child: const SizedBox(
                        height: 60,
                        width: 80,
                        child: ColoredBox(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              _ => const SizedBox.shrink(),
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  CustomButton(
                    onTap: () {
                      pages = "first";
                      isPressed1 = !isPressed1;
                      setState(() {});
                    },
                    text: "Loading ...",
                  ),
                  CustomButton(
                    onTap: () {
                      pages = "second";
                      controller.reset();
                      controller.forward();
                      setState(() {});
                    },
                    text: "Easing ...",
                  ),
                  CustomButton(
                    onTap: () {
                      pages = "third";
                      controller.reset();
                      controller.forward();
                      setState(() {});
                    },
                    text: "Delay ...",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class MyCurve extends Curve {

  @override
  double transformInternal(double t) {
    return 3 * t - 1;
  }

}