import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const Home(),
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
        child: Container(
          height: size,
          width: size,
          color: Colors.deepPurpleAccent,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(size > 150) {
            size = 100;
          } else {
            size = 200;
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