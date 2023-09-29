import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Color.fromARGB(255, 150, 208, 255)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  width: 400,
                  height: 400,
                  margin: const EdgeInsets.only(top: 100, right: 10),
                  child: Image.asset(
                    "lib/image/WhatsApp Image 2023-09-16 at 14.44.45-modified.png",
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text(
                      'Make ',
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold),
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
                            'Good',
                            speed: const Duration(milliseconds: 150),
                          ),
                          TypewriterAnimatedText(
                            'Nice',
                            speed: const Duration(milliseconds: 150),
                          ),
                        ],
                        repeatForever: true, // Ubah sesuai kebutuhan
                      ),
                    ),
                    const Text(
                      'Day for your fish',
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 130, vertical: 20),
                      backgroundColor: const Color.fromARGB(255, 71, 181, 209),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
