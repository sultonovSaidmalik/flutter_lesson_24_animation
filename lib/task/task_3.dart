import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  bool top = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:  Center(
        child: AnimatedAlign(
          alignment: top ? Alignment.bottomCenter : Alignment.topCenter,
          duration: const Duration(seconds: 2),
          curve: Curves.easeInOut,
          onEnd: (){
            top =!top;
            setState(() {});
          },
          child: const Icon(
            Icons.circle,
            size: 100,
            color: Colors.red,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          top =!top;
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
