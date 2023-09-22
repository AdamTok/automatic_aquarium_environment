import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

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
      backgroundColor: const Color.fromARGB(0, 255, 255, 255),
      body: SafeArea(
          child: Center(
        child: Column(
          children: <Widget>[
            Container(
              width: 220,
              height: 220,
              margin: const EdgeInsets.only(top: 100, right: 15),
              child: Image.asset(
                  "lib/image/WhatsApp Image 2023-09-16 at 14.44.45.jpg"),
            ),
            const SizedBox(
              height: 20,
            ), // ignore: sized_box_for_whitespace
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text(
                  'Make A ',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
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
                  'day for your fish',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              child: SizedBox(
                width: 220,
                height: 40,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    child: const Text(
                      "Mulai",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    )),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Container(
                  width: 250,
                  height: 250,
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Lottie.asset("lib/animation/animation_lmm7e6qh.json"),
                ),
                const SizedBox(
                  child: SizedBox(
                    child: Center(
                      child: TextField(),
                    ),
                  ),
                ),
                // Tombol Mulai
              ],
            ),
          ),
        ));
  }
}
