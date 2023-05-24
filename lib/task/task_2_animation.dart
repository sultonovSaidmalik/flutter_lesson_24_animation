import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double size = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 700),
          curve: Curves.bounceIn,
          height: size,
          width: size,
          color: Colors.deepPurpleAccent,
          onEnd: (){
            if(size > 150) {
              size = 100;
            } else {
              size = 300;
            }
            setState(() {});
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(size > 150) {
            size = 100;
          } else {
            size = 300;
          }
          setState(() {});
        },
        child: const Icon(
          Icons.change_circle_rounded,
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}