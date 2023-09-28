import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

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
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
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
              )
            ] // ),
                ),
          ),
        ));
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
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SafeArea(
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        width: 250,
                        height: 250,
                        margin: const EdgeInsets.only(top: 100, right: 10),
                        child: Image.asset(
                          "lib/image/WhatsApp Image 2023-09-16 at 14.44.45.jpg",
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                          child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 240, 240, 240),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Masukkan E-mail anda'),
                              ),
                            ),
                          ),
                        ),
                      )),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                          child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 240, 240, 240),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Masukkan Password anda'),
                              ),
                            ),
                          ),
                        ),
                      )),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignupPage()));
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 10,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 157, vertical: 20),
                            backgroundColor:
                                const Color.fromARGB(255, 71, 181, 209),
                            shadowColor:
                                const Color.fromARGB(255, 71, 181, 209),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 150,
                      ),
                      // SizedBox(
                      //   child: Container(
                      //     height: 63,
                      //     decoration: const BoxDecoration(
                      //       color: Colors.blueAccent,
                      //       borderRadius: BorderRadius.only(
                      //         topLeft: Radius.circular(12),
                      //         topRight: Radius.circular(12),
                      //       ),
                      //     ),
                      //     child: const Align(
                      //       alignment: Alignment.center,
                      //       child: Text(
                      //         'Made and Developed by Adam Darmawansa for Tugas Akhir',
                      //         style: TextStyle(
                      //           color: Colors
                      //               .white, // Ubah warna teks sesuai kebutuhan
                      //           fontSize:
                      //               10, // Sesuaikan ukuran font sesuai kebutuhan
                      //           fontWeight: FontWeight
                      //               .w400, // Sesuaikan gaya font sesuai kebutuhan
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ), // Tombol Mulai
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      child:
                          Lottie.asset("lib/animation/animation_lmm7e6qh.json"),
                    ),
                    SizedBox(
                        child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 240, 240, 240),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Nama lengkap anda'),
                            ),
                          ),
                        ),
                      ),
                    )),
                    const SizedBox(
                      height: 18,
                    ),
                    SizedBox(
                        child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 240, 240, 240),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Masukkan E-mail anda'),
                            ),
                          ),
                        ),
                      ),
                    )),
                    const SizedBox(
                      height: 18,
                    ),
                    SizedBox(
                        child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 240, 240, 240),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Masukkan password anda'),
                            ),
                          ),
                        ),
                      ),
                    )),
                    const SizedBox(
                      height: 18,
                    ),
                    SizedBox(
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MonitorPage()));
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 10,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 157, vertical: 20),
                              backgroundColor:
                                  const Color.fromARGB(255, 71, 181, 209),
                              shadowColor:
                                  const Color.fromARGB(255, 71, 181, 209),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ))),
                    const SizedBox(
                      height: 50,
                    ),
                    // SizedBox(
                    //   child: Container(
                    //     height: 63,
                    //     decoration: const BoxDecoration(
                    //       color: Colors.blueAccent,
                    //       borderRadius: BorderRadius.only(
                    //         topLeft: Radius.circular(12),
                    //         topRight: Radius.circular(12),
                    //       ),
                    //     ),
                    //     child: const Align(
                    //       alignment: Alignment.center,
                    //       child: Text(
                    //         'Made and Developed by Adam Darmawansa for Tugas Akhir',
                    //         style: TextStyle(
                    //           color: Colors
                    //               .white, // Ubah warna teks sesuai kebutuhan
                    //           fontSize:
                    //               10, // Sesuaikan ukuran font sesuai kebutuhan
                    //           fontWeight: FontWeight
                    //               .w400, // Sesuaikan gaya font sesuai kebutuhan
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class MonitorPage extends StatefulWidget {
  const MonitorPage({super.key});

  @override
  State<MonitorPage> createState() => _MonitorPageState();
}

class _MonitorPageState extends State<MonitorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
          child: Column(children: [
        SizedBox(
          child: Container(
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: const Align(
              alignment: Alignment.center,
              child: Text(
                "Halaman Monitoring",
                style: TextStyle(
                  color: Colors.white, // Ubah warna teks sesuai kebutuhan
                  fontSize: 28, // Sesuaikan ukuran font sesuai kebutuhan
                  fontWeight:
                      FontWeight.bold, // Sesuaikan gaya font sesuai kebutuhan
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          child: Column(
            children: [
              DigitalClock(
                digitAnimationStyle: Curves.easeInCubic,
                is24HourTimeFormat: false,
                areaDecoration: BoxDecoration(
                    color: const Color.fromARGB(125, 255, 255, 255),
                    borderRadius: BorderRadius.circular(12)),
                hourMinuteDigitTextStyle: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
                secondDigitTextStyle: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
                amPmDigitTextStyle: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              const Text(
                'Klik timer untuk setting alarm',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 450,
        ),
        SizedBox(
          child: Column(children: [
            Row(children: [
              const SizedBox(
                width: 12,
              ),
              Flexible(
                child: Container(
                  height: 180,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(50, 173, 173, 173),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(children: [
                    const SizedBox(width: 10),
                    Expanded(child: Image.asset("lib/image/5218646.png")),
                  ]),
                ),
              ),
              const SizedBox(
                width: 11,
              ),
              Flexible(
                child: Container(
                  height: 180,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 2,
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(50, 173, 173, 173),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(children: [
                    const SizedBox(width: 2),
                    Expanded(child: Image.asset("lib/image/5218646.png")),
                  ]),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
            ])
          ]),
        )
      ])),
    );
  }
}
