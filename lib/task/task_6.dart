import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<AlignmentGeometry> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = Tween<Alignment>(
            begin: Alignment.topCenter, end: Alignment.bottomLeft)
        .animate(
            CurvedAnimation(parent: controller, curve: Curves.easeInOutBack))
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          controller.repeat(reverse: true);
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AlignTransition(
          //turns: controller.view,
          alignment: animation,
          child: Icon(
            Icons.cyclone,
            size: 100,
            color: Colors.blue.shade700,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.forward();
        },
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
