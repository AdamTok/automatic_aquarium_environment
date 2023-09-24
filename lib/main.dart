import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:slide_to_act/slide_to_act.dart';
// import 'package:slider_button/slider_button.dart';
// import 'package:icons_plus/icons_plus.dart';

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
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: SafeArea(
          child: Center(
            child: Column(children: <Widget>[
              Container(
                width: 400,
                height: 400,
                margin: const EdgeInsets.only(top: 100, right: 10),
                child: Image.asset(
                    "lib/image/WhatsApp Image 2023-09-16 at 14.44.45.jpg"),
              ),
              const SizedBox(
                height: 30,
              ), // ignore: sized_box_for_whitespace
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    'Make A ',
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'Great',
                          speed: const Duration(milliseconds: 150),
                        ),
                        TypewriterAnimatedText(
                          'Best',
                          speed: const Duration(milliseconds: 150),
                        ),
                        TypewriterAnimatedText(
                          'Nice',
                          speed: const Duration(milliseconds: 150),
                        ),
                        TypewriterAnimatedText(
                          'Good',
                          speed: const Duration(milliseconds: 150),
                        ),
                      ],
                      isRepeatingAnimation: true,
                      repeatForever: true,
                    ),
                  ),
                  const Text(
                    'Day for your fish',
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 130, vertical: 20),
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Mulai',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              )
            ] // ),
                ),
          ),
        ));
  }
}
