import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:smaq/component/livechart.dart';

class MonitorPage extends StatelessWidget {
  MonitorPage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  void logOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "Monitoring",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        "Selamat datang ${user.email!}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
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
                    digitAnimationStyle: Curves.elasticOut,
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
            const RealTimeChart(),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              child: Column(children: [
                Row(children: [
                  const SizedBox(
                    width: 12,
                  ),
                  Flexible(
                    child: Container(
                      height: 30,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(50, 173, 173, 173),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(children: [
                        const SizedBox(width: 10),
                        Expanded(
                            child: Image.asset(
                          "lib/image/5218646.png",
                          height: 50,
                          width: 50,
                        )),
                      ]),
                    ),
                  ),
                  const SizedBox(
                    width: 11,
                  ),
                  Flexible(
                    child: Container(
                      height: 30,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 2,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(50, 173, 173, 173),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(children: [
                        const SizedBox(width: 2),
                        Expanded(
                            child: Image.asset(
                          "lib/image/5218646.png",
                          height: 50,
                          width: 50,
                        )),
                      ]),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      logOut();
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 10,
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.4,
                        vertical: 10,
                      ),
                      backgroundColor: const Color.fromARGB(255, 71, 181, 209),
                      shadowColor: const Color.fromARGB(255, 71, 181, 209),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'LogOut',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ])
              ]),
            )
          ])),
    );
  }
}
