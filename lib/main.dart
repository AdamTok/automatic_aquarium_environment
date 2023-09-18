import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Image.asset(
              'lib/image/WhatsApp Image 2023-09-16 at 14.44.45.jpg',
              height: 300,
              width: 300,
            ),
            const Spacer(),
            Lottie.asset(
              'lib/animation/animation_lmm7e6qh.json',
              height: 500,
              width: 500,
            ),
          ],
        ),
      )),
    );
  }
}
