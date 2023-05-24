import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeTask2(),
    );
  }
}

class HomeTask2 extends StatefulWidget {
  const HomeTask2({Key? key}) : super(key: key);

  @override
  State<HomeTask2> createState() => _HomeTask2State();
}

class _HomeTask2State extends State<HomeTask2>
    with SingleTickerProviderStateMixin {
  late Animation _animation;
  late AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 1200));
    _animation = Tween<double>(
      begin: 300,
      end: 100,
    ).animate(CurvedAnimation(
      parent: _controller, curve: const Interval(0, 1, curve: Curves.elasticIn),),)
      ..addStatusListener((AnimationStatus status) {
        if(status == AnimationStatus.completed){
          _controller.repeat(reverse: true);
        }
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Task 2"),
        centerTitle: true,
      ),
      body: Center(
         child: AnimatedBuilder(
           animation: _animation,
           builder: (context , child) => Container(
             height: 100,
             width: 100,
             margin: EdgeInsets.only(top: _animation.value ),
             child: const Image(image: AssetImage("assets/images/imag_bool.jpg"),),
           ),
         ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.forward();
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
