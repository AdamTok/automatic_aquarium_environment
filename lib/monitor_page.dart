import 'package:flutter/material.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

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
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Monitoring",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    "Anda bisa mengawasi kondisi akuarium kalian disini..",
                    style: TextStyle(
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
