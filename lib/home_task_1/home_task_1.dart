import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeTask1(),
    );
  }
}


class HomeTask1 extends StatefulWidget {
  const HomeTask1({Key? key}) : super(key: key);

  @override
  State<HomeTask1> createState() => _HomeTask1State();
}

class _HomeTask1State extends State<HomeTask1>
    with SingleTickerProviderStateMixin {
  late AnimationController _container;
  late Animation _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _container =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 700));
    _animation = Tween<Size>(begin: const Size(100, 100), end: const Size(150, 150))
        .animate(CurvedAnimation(parent: _container, curve: Curves.bounceIn));

    _container.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _container.repeat();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _container.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Task 1"),
        centerTitle: true,
      ),
      body: Center(
          child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) => SizedBox(
          height: _animation.value.height,
          width: _animation.value.width,
          child: const Image(
            image: AssetImage("assets/images/imag_folov.jpg"),
          ),
        ),
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _container.forward();
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
