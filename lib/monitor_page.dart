import 'package:flutter/material.dart';
import 'package:d_chart/d_chart.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MonitorPage extends StatefulWidget {
  MonitorPage({Key? key}) : super(key: key);
  final user = FirebaseAuth.instance.currentUser!;

  @override
  State<MonitorPage> createState() => _MonitorPageState();
}

class _MonitorPageState extends State<MonitorPage> {
  final user = FirebaseAuth.instance.currentUser!;
  late DatabaseReference _dbref;
  String databasejson = '';
  bool isButtonPressedLED = false;
  bool isButtonPressedServo = false;
  bool ledStatus = false;
  bool servoStatus = false;

  @override
  void initState() {
    super.initState();
    _dbref = FirebaseDatabase.instance.ref();
  }

  void logOut() {
    FirebaseAuth.instance.signOut();
  }

  void ledOn() async {
    await _dbref.child("TAIoT").update({'LED': 'on'});
  }

  void ledOff() async {
    await _dbref.child("TAIoT").update({'LED': 'off'});
  }

  void servoOn() async {
    await _dbref.child("TAIoT").update({'Servo': 'on'});
  }

  void servoOff() async {
    await _dbref.child("TAIoT").update({'Servo': 'off'});
  }

  void pressedButtonLED() {
    setState(() {
      isButtonPressedLED = !isButtonPressedLED;
      if (isButtonPressedLED) {
        ledOn(); // Panggil fungsi untuk menyalakan LED
        ledStatus = true;
      } else {
        ledOff(); // Panggil fungsi untuk mematikan LED
        ledStatus = false;
      }
    });
  }

  void pressedButtonServo() {
    setState(() {
      isButtonPressedServo = !isButtonPressedServo;
      if (isButtonPressedServo) {
        servoOn(); // Panggil fungsi untuk menyalakan LED
        servoStatus = true;
      } else {
        servoOff(); // Panggil fungsi untuk mematikan LED
        servoStatus = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
              return ListView.builder(
                itemCount: item.length,
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 27,
                        width: 300,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent[100],
                            borderRadius: BorderRadius.circular(30)),
                        child: const Center(
                          child: Text(
                            "Halaman Monitoring",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 35,
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
                                      color: Colors.black,
                                      fontSize: 60,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  user.email!,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            const VerticalDivider(
                              color: Colors.black,
                              thickness: 2,
                              width: 10,
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                            Container(
                              height: 50,
                              width: 80,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 255,
                                    255), // Warna latar belakang abu-abu
                                borderRadius: BorderRadius.circular(
                                    5), // Mengatur sudut kotak
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 142, 142, 142),
                                    offset: Offset(0, 1),
                                    blurRadius: 3, // Bayangan
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  DigitalClock(
                                    digitAnimationStyle: Curves.easeInBack,
                                    is24HourTimeFormat: true,
                                    areaDecoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    hourMinuteDigitTextStyle: const TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                    showSecondsDigit: false,
                                  ),
                                ],
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
                                color: Color.fromARGB(255, 142, 142, 142),
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
                              radiusBar:
                                  const BorderRadius.all(Radius.circular(20)),
                              max: 100,
                              spaceDomainLabeltoChart: 10,
                              valueAlign: Alignment.center,
                              listData: List.generate(item.length, (index) {
                                Map dataItem = item[index];
                                return DChartBarDataCustom(
                                  value: dataItem['Suhu'].toDouble(),
                                  // label: dataItem['Timestamp'],
                                  label: dataItem['Timestamp'],
                                  color: dataItem['Suhu'] >= 30
                                      ? Colors.red
                                      : (dataItem['Suhu'] <= 20
                                          ? Colors.blue
                                          : Colors.green),
                                  showValue: true,
                                  // splashColor: Colors.red
                                );
                              }),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 45,
                        ),
                        Column(
                          children: [
                            Container(
                              height: 158,
                              width: 158,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 255,
                                    255), // Warna latar belakang abu-abu
                                borderRadius: BorderRadius.circular(
                                    5), // Mengatur sudut kotak
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 142, 142, 142),
                                    offset: Offset(0, 3),
                                    blurRadius: 6, // Bayangan
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(10),
                              child: Image.asset(
                                "lib/animation/51171.jpg",
                                width: 100,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: pressedButtonServo,
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                height: 40,
                                width: 140,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    border: Border.all(
                                      color: isButtonPressedLED
                                          ? Colors.grey.shade100
                                          : Colors.grey.shade300,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: isButtonPressedServo
                                        ? [
                                            // kosongan gausah shadow
                                          ]
                                        : [
                                            const BoxShadow(
                                                color: Color.fromARGB(
                                                    255, 147, 189, 199),
                                                offset: Offset(3, 3),
                                                blurRadius: 4,
                                                spreadRadius: 1)
                                          ]),
                                child: Center(
                                  child: Text(
                                    isButtonPressedServo ? "Feeding" : "Feed",
                                    style: TextStyle(
                                        color: isButtonPressedServo
                                            ? Colors.green
                                            : Colors.orange,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                              // child: Icon(Icons.logout_sharp,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const SizedBox(
                              width: 150,
                              child: Divider(
                                thickness: 2,
                                color: Colors.black,
                                height: 10,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: pressedButtonLED,
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
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
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: isButtonPressedLED
                                        ? [
                                            const BoxShadow(
                                                color: Color.fromARGB(
                                                    255, 255, 252, 48),
                                                offset: Offset(1, 1),
                                                blurRadius: 1,
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
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
