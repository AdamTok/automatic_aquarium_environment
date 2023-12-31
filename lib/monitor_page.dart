import 'package:flutter/material.dart';
import 'package:d_chart/d_chart.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MonitorPage extends StatefulWidget {
  const MonitorPage({Key? key}) : super(key: key);

  @override
  State<MonitorPage> createState() => _MonitorPageState();
}

class _MonitorPageState extends State<MonitorPage> {
  final user = FirebaseAuth.instance.currentUser!;
  late DatabaseReference _dbref;
  bool isButtonPressedLED = false;
  bool isButtonPressedServo = false;

  @override
  void initState() {
    super.initState();
    _dbref = FirebaseDatabase.instance.ref();
  }

  void logOut() {
    FirebaseAuth.instance.signOut();
  }

  void toggleLED() {
    _dbref
        .child("TAIoT")
        .child("LED")
        .once()
        .then((DatabaseEvent databaseEvent) {
      setState(() {
        var currentStatusLED = databaseEvent.snapshot.value.toString();
        if (currentStatusLED == "off") {
          _dbref.child("TAIoT").update({'LED': 'on'});
          isButtonPressedLED = true;
        } else {
          _dbref.child("TAIoT").update({'LED': 'off'});
          isButtonPressedLED = false;
        }
      });
    });
  }

  void toggleServo() {
    _dbref
        .child("TAIoT")
        .child("Servo")
        .once()
        .then((DatabaseEvent databaseEvent) {
      setState(() {
        var currentStatusServo = databaseEvent.snapshot.value.toString();
        if (currentStatusServo == "off") {
          _dbref.child("TAIoT").update({'Servo': 'on'});
          isButtonPressedServo = true;
        } else {
          _dbref.child("TAIoT").update({'Servo': 'off'});
          isButtonPressedServo = false;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color.fromARGB(255, 97, 183, 254), Colors.white],
        ),
      ),
      child: Center(
        child: StreamBuilder(
            stream: _dbref.onValue,
            builder: (context, AsyncSnapshot snap) {
              if (snap.hasData &&
                  !snap.hasError &&
                  snap.data.snapshot.value != null) {
                Map data = snap.data.snapshot.value;
                List item = [];
                data.forEach(
                  (index, data) => item.add({"key": index, ...data}),
                );
                _dbref
                    .child("TAIoT")
                    .child("LED")
                    .once()
                    .then((DatabaseEvent databaseEvent) {
                  setState(() {
                    var isNowLED = databaseEvent.snapshot.value.toString();
                    if (isNowLED == "on") {
                      isButtonPressedLED = true;
                    } else {
                      isButtonPressedLED = false;
                    }
                  });
                });
                _dbref
                    .child("TAIoT")
                    .child("Servo")
                    .once()
                    .then((DatabaseEvent databaseEvent) {
                  setState(() {
                    var isNowServo = databaseEvent.snapshot.value.toString();
                    if (isNowServo == "on") {
                      isButtonPressedServo = true;
                    } else {
                      isButtonPressedServo = false;
                    }
                  });
                });

                return ListView.builder(
                  itemCount: item.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 40,
                            ),
                            IntrinsicHeight(
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 50,
                                  ),
                                  Column(
                                    children: [
                                      const Text(
                                        'Halo',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 60,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        user.email!,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 65,
                                  ),
                                  Container(
                                    height: 40,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 255, 255,
                                          255), // Warna latar belakang abu-abu
                                      borderRadius: BorderRadius.circular(
                                          5), // Mengatur sudut kotak
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color.fromARGB(
                                              255, 142, 142, 142),
                                          offset: Offset(0, 1),
                                          blurRadius: 3, // Bayangan
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: DigitalClock(
                                        digitAnimationStyle: Curves.easeInBack,
                                        is24HourTimeFormat: true,
                                        areaDecoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        hourMinuteDigitTextStyle:
                                            const TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                        showSecondsDigit: false,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(children: [
                              const SizedBox(
                                width: 35,
                              ),
                              Container(
                                  height: 450,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 255, 255,
                                        255), // Warna latar belakang abu-abu
                                    borderRadius: BorderRadius.circular(
                                        20), // Mengatur sudut kotak
                                    boxShadow: const [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(255, 142, 142, 142),
                                        offset: Offset(2, 3),
                                        blurRadius: 3, // Bayangan
                                      ),
                                    ],
                                  ),
                                  padding: const EdgeInsets.only(
                                      right: 10, left: 15, bottom: 35, top: 20),
                                  child: AspectRatio(
                                    aspectRatio: 1 / 1,
                                    child: DChartBarCustom(
                                      showDomainLabel: true,
                                      spaceBetweenItem: 10,
                                      radiusBar: const BorderRadius.all(
                                          Radius.circular(20)),
                                      max: 100,
                                      spaceDomainLabeltoChart: 10,
                                      valueAlign: Alignment.center,
                                      listData:
                                          List.generate(item.length, (index) {
                                        Map dataItem = item[index];
                                        double suhu =
                                            dataItem['Suhu'].toDouble();
                                        String formattedSuhu =
                                            suhu.toStringAsFixed(
                                                2); // Menggunakan 2 digit desimal
                                        return DChartBarDataCustom(
                                          value: double.parse(
                                              formattedSuhu), // Konversi kembali ke double jika diperlukan
                                          label: '$formattedSuhu °C',
                                          color: suhu >= 30.00
                                              ? Colors.red
                                              : (suhu <= 20.00
                                                  ? Colors.blue
                                                  : Colors.green),
                                        );
                                      }),
                                    ),
                                  )),
                              const SizedBox(
                                width: 45,
                              ),
                              Column(
                                children: [
                                  Container(
                                    height: 220,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 255, 255,
                                          255), // Warna latar belakang abu-abu
                                      borderRadius: BorderRadius.circular(
                                          5), // Mengatur sudut kotak
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color.fromARGB(
                                              255, 142, 142, 142),
                                          offset: Offset(0, 3),
                                          blurRadius: 6, // Bayangan
                                        ),
                                      ],
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          "lib/animation/51171.jpg",
                                          width: 130,
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        GestureDetector(
                                          onTap: toggleServo,
                                          child: AnimatedContainer(
                                            duration: const Duration(
                                                milliseconds: 200),
                                            height: 40,
                                            width: 140,
                                            decoration: BoxDecoration(
                                                color: isButtonPressedServo
                                                    ? const Color.fromARGB(
                                                        255, 72, 145, 131)
                                                    : const Color.fromARGB(
                                                        255, 155, 202, 192),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                boxShadow: isButtonPressedServo
                                                    ? []
                                                    : [
                                                        const BoxShadow(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    121,
                                                                    121,
                                                                    121),
                                                            offset:
                                                                Offset(2, 2),
                                                            blurRadius: 2,
                                                            spreadRadius: 1)
                                                      ]),
                                            child: Center(
                                              child: Text(
                                                isButtonPressedServo
                                                    ? "Feeding..."
                                                    : "Feed",
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          // child: Icon(Icons.logout_sharp,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  GestureDetector(
                                    onTap: toggleLED,
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      height: 180,
                                      width: 180,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          border: Border.all(
                                            color: isButtonPressedLED
                                                ? Colors.grey.shade100
                                                : Colors.grey.shade300,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: isButtonPressedLED
                                              ? [
                                                  const BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 255, 252, 48),
                                                      offset: Offset(1, 1),
                                                      blurRadius: 10,
                                                      spreadRadius: 1)
                                                ]
                                              : [
                                                  const BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 68, 68, 68),
                                                      offset: Offset(3, 3),
                                                      blurRadius: 5,
                                                      spreadRadius: 1)
                                                ]),
                                      child: Image.asset(
                                        isButtonPressedLED
                                            ? "lib/animation/pngtree-vector-illustration-of-a-yellow-light-bulb-with-wire-in-the-flat-design-style-vector-png-image_25529226.png"
                                            : "lib/animation/pngtree-grey-light-bulb-with-wire-in-flat-design-vector-concept-vector-png-image_25529224.png",
                                        height: 100,
                                        width: 100,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ]),
                            const SizedBox(
                              height: 40,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  logOut();
                                },
                                style: ElevatedButton.styleFrom(
                                  elevation: 10,
                                  padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width * 0.4,
                                    vertical: 2,
                                  ),
                                  backgroundColor:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  shadowColor:
                                      const Color.fromARGB(255, 142, 142, 142),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.logout_sharp,
                                  color: Colors.red,
                                )),
                          ]),
                    );
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                );
              }
            }),
      ),
    );
  }
}
