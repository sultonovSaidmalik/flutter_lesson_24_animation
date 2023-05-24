import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePages1(),
    );
  }
}

class HomePages1 extends StatefulWidget {
  const HomePages1({Key? key}) : super(key: key);

  @override
  State<HomePages1> createState() => _HomePages1State();
}

class _HomePages1State extends State<HomePages1>
    with SingleTickerProviderStateMixin {
  bool isPressed = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "animationswitch",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body:
      Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isPressed = !isPressed;
            });
          },
          child: Container(
            height: 80,
            width: 200,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isPressed ? Colors.red: Colors.green ,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Row(
              children: [
                AnimatedContainer(
                  width: isPressed ? 130 : 0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.bounceOut,
                ),
                const SizedBox(width: 10),
                Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                    color:  Colors.white,
                ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
