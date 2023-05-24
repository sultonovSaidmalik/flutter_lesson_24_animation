/// 1
// 3

// import 'package:flutter/material.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(useMaterial3: true),
//       home: const Home(),
//     );
//   }
// }
//
// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   double size = 100;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: AnimatedContainer(
//           duration: const Duration(milliseconds: 500),
//           height: size,
//           width: size,
//           color: Colors.deepPurpleAccent,
//           curve: Curves.fastEaseInToSlowEaseOut,
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           if (size > 150) {
//             size = 100;
//           } else {
//             size = 300;
//           }
//           setState(() {});
//         },
//         child: const Icon(
//           Icons.change_circle_rounded,
//           color: Colors.deepPurple,
//         ),
//       ),
//     );
//   }
// }

/// 2

// import 'package:flutter/material.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(useMaterial3: true),
//       home: Home(),
//     );
//   }
// }
//
// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   double size = 100;
//   var color = Colors.deepPurpleAccent;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: AnimatedContainer(
//           duration: const Duration(seconds: 5),
//           height: size,
//           width: size,
//           color: color,
//           curve: Curves.easeInOutBack,
//           onEnd: () {
//             if (color != Colors.tealAccent) {
//               color = Colors.tealAccent;
//               setState(() {});
//             }
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           if (size > 150) {
//             size = 100;
//           } else {
//             size = 300;
//           }
//           setState(() {});
//         },
//         child: const Icon(
//           Icons.change_circle_rounded,
//           color: Colors.deepPurple,
//         ),
//       ),
//     );
//   }
// }

/// 3
// import 'package:flutter/material.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(useMaterial3: true),
//       home: const Home(),
//     );
//   }
// }
//
// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Stack(
//         children: [
//           Positioned(
//             left: 150,
//             top: 300,
//             child: Icon(
//               Icons.motorcycle,
//               color: Colors.black,
//               size: 100,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

/// 4
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(useMaterial3: true),
//       home: const Home(),
//     );
//   }
// }
//
// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//
//   double ballX = 0;
//   double ballY = 0;
//   double height = 0;
//   double width = 0;
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     height = MediaQuery.of(context).size.height;
//     width = MediaQuery.of(context).size.width;
//     ballX = width / 2 - 35;
//     ballY = 100;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       body: Stack(
//         children: [
//           SafeArea(
//             bottom: false,
//             child: Transform.scale(
//               scale: 1.1,
//               child: Image.asset(
//                 "assets/images/hockey_area.png",
//                 height: height,
//                 width: width,
//                 fit: BoxFit.cover,
//                 alignment: const Alignment(0, 0.7),
//               ),
//             ),
//           ),
//           AnimatedPositioned(
//             left: ballX,
//             bottom: ballY,
//             duration: const Duration(seconds: 1),
//             child: const Icon(
//               CupertinoIcons.circle_filled,
//               color: Colors.black,
//               shadows: [
//                 Shadow(
//                     color: Colors.blueGrey,
//                     offset: Offset(10, 10),
//                     blurRadius: 10
//                 ),
//                 Shadow(
//                     color: Colors.blueGrey,
//                     offset: Offset(-10, 10),
//                     blurRadius: 10
//                 ),
//                 Shadow(
//                     color: Colors.blueGrey,
//                     offset: Offset(10, -10),
//                     blurRadius: 10
//                 ),
//                 Shadow(
//                     color: Colors.blueGrey,
//                     offset: Offset(-10, -10),
//                     blurRadius: 10
//                 )
//
//               ],
//               size: 70,
//             ),
//             onEnd: () {
//               if(ballY < height) {
//                 if(ballX < width / 2) {
//                   if(ballX == width / 2 - 35) {
//                     ballX += width / 2 - 35;
//                     ballY += width / 2 - 35;
//                   } else {
//                     ballX += width - 70;
//                     ballY += width / 2 - 35;
//                   }
//                 } else {
//                   ballX -= width - 70;
//                   ballY += width / 2 - 35;
//                 }
//                 setState(() {});
//               }
//             },
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.red,
//         onPressed: () {
//           if(ballY < height) {
//             if(ballX < width / 2) {
//               if(ballX == width / 2 - 35) {
//                 ballX += width / 2 - 35;
//                 ballY += width / 2 - 35;
//               } else {
//                 ballX += width - 70;
//                 ballY += width / 2 - 35;
//               }
//             } else {
//               ballX -= width - 70;
//               ballY += width / 2 - 35;
//             }
//             setState(() {});
//           }
//         },
//         child: const Icon(Icons.play_arrow_rounded, color: Colors.white,),
//       ),
//     );
//   }
// }