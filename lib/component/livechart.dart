// // import 'package:flutter/material.dart';
// // import 'package:d_chart/d_chart.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';

// // class RealTimeChart extends StatelessWidget {
// //   const RealTimeChart({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     List suhu = [
// //       {'timestamp': 'A', 'suhu': 10},
// //       {'timestamp': 'B', 'suhu': 2},
// //       {'timestamp': 'C', 'suhu': 29},
// //       {'timestamp': 'D', 'suhu': 45},
// //       {'timestamp': 'E', 'suhu': 67},
// //     ];
//     return Container(
//       padding: const EdgeInsets.all(20),
//       child: Column(
//         children: [
//           const SizedBox(
//             height: 30,
//           ),
//           Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               color: const Color.fromARGB(255, 255, 255, 255),
//             ),
//             child: Container(
//               padding: const EdgeInsets.all(10),
//               child: AspectRatio(
//                 aspectRatio: 2 / 1,
//                 child: DChartBarCustom(
//                   showDomainLine: true,
//                   showDomainLabel: true,
//                   showMeasureLine: true,
//                   showMeasureLabel: true,
//                   spaceMeasureLinetoChart: 10,
//                   spaceDomainLinetoChart: 10,
//                   radiusBar: const BorderRadius.only(
//                     topLeft: Radius.circular(12),
//                     topRight: Radius.circular(12),
//                   ),
//                   max: 100,
//                   valueAlign: Alignment.topCenter,
//                   listData: List.generate(suhu.length, (index) {
//                     Map item = suhu[index];
//                     return DChartBarDataCustom(
//                         value: item['suhu'].toDouble(),
//                         // toDouble kalo datanya berbentuk int
//                         label: item['timestamp'],
//                         shadowColor: Colors.black,
//                         color: item['suhu'] > 30
//                             ? Colors.red
//                             : (item['suhu'] < 20 ? Colors.blue : Colors.green),
//                         showValue: true);
//                   }),
//                 ),
//               ),
//             ),
//           ),
// //           const SizedBox(
// //             height: 10,
// //           ),
// //           Container(
// //             decoration: BoxDecoration(
// //               borderRadius: BorderRadius.circular(20),
// //               color: const Color.fromARGB(255, 255, 255, 255),
// //             ),
//   child: Container(
//     padding: const EdgeInsets.all(10),
//     child: AspectRatio(
//       aspectRatio: 2 / 1,
//       child: DChartBarCustom(
//         showDomainLine: true,
//         showDomainLabel: true,
//         showMeasureLine: true,
//         showMeasureLabel: true,
//         spaceMeasureLinetoChart: 10,
//         spaceDomainLinetoChart: 10,
//         radiusBar: const BorderRadius.only(
//           topLeft: Radius.circular(12),
//           topRight: Radius.circular(12),
//         ),
//         max: 100,
//         valueAlign: Alignment.topCenter,
//         listData: List.generate(suhu.length, (index) {
//           Map item = suhu[index];
//           return DChartBarDataCustom(
//               value: item['suhu'].toDouble(),
//               // toDouble kalo datanya berbentuk int
//               label: item['timestamp'],
//               color: item['suhu'] > 30
//                   ? Colors.red
//                   : (item['suhu'] < 20 ? Colors.blue : Colors.green),
//               showValue: true);
//         }),
//       ),
//     ),
//   ),
// ),
//       ],
//     ),
//   );
// }
// // }

// import 'dart:async';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'circle_progress.dart';

// class Dashboard extends StatefulWidget {
//   const Dashboard({super.key});

//   @override
//   DashboardState createState() => DashboardState();
// }

// class DashboardState extends State<Dashboard>
//     with SingleTickerProviderStateMixin {
//   bool isLoading = false;

//   final databaseReference = FirebaseDatabase.instance.ref();

//   late AnimationController progressController;
//   late Animation<double> tempAnimation;
//   late Animation<double> humidityAnimation;

//   @override
//   void initState() {
//     super.initState();

//     databaseReference
//         .child('ESP32_Device')
//         .once()
//         .then((DataSnapshot snapshot) {
//           final data = snapshot.value as Map<String, dynamic>?;

//           if (data != null) {
//             double temp =
//                 (data['Temperature'] as Map<String, dynamic>?)?['Data'] ?? 0.0;
//             double humidity =
//                 (data['Humidity'] as Map<String, dynamic>?)?['Data'] ?? 0.0;

//             isLoading = true;
//             dashboardInit(temp, humidity);
//           }
//         } as FutureOr Function(DatabaseEvent value));
//   }

//   dashboardInit(double temp, double humid) {
//     progressController = AnimationController(
//         vsync: this, duration: const Duration(milliseconds: 3000)); //5s

//     tempAnimation =
//         Tween<double>(begin: 0, end: temp).animate(progressController)
//           ..addListener(() {
//             setState(() {});
//           });

//     humidityAnimation =
//         Tween<double>(begin: 0, end: humid).animate(progressController)
//           ..addListener(() {
//             setState(() {});
//           });

//     progressController.forward();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//         child: isLoading
//             ? Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   CustomPaint(
//                     foregroundPainter:
//                         CircleProgress(tempAnimation.value, true),
//                     child: SizedBox(
//                       width: 200,
//                       height: 200,
//                       child: Center(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             const Text('Temperature'),
//                             Text(
//                               '${tempAnimation.value.toInt()}',
//                               style: const TextStyle(
//                                   fontSize: 50, fontWeight: FontWeight.bold),
//                             ),
//                             const Text(
//                               '°C',
//                               style: TextStyle(
//                                   fontSize: 20, fontWeight: FontWeight.bold),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   CustomPaint(
//                     foregroundPainter:
//                         CircleProgress(humidityAnimation.value, false),
//                     child: SizedBox(
//                       width: 200,
//                       height: 200,
//                       child: Center(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             const Text('Humidity'),
//                             Text(
//                               '${humidityAnimation.value.toInt()}',
//                               style: const TextStyle(
//                                   fontSize: 50, fontWeight: FontWeight.bold),
//                             ),
//                             const Text(
//                               '%',
//                               style: TextStyle(
//                                   fontSize: 20, fontWeight: FontWeight.bold),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               )
//             : const Text(
//                 'Loading...',
//                 style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//               ));
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';

// class SuhuDisplay extends StatelessWidget {
//   final suhuRef = FirebaseDatabase.instance.ref("ESP32_Device/Kelembaban/Data");

//   SuhuDisplay({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: StreamBuilder<DatabaseEvent>(
//         stream: suhuRef.onValue,
//         builder: (context, snapshot) {
//           if (snapshot.hasData && snapshot.data != null) {
//             DatabaseEvent event = snapshot.data!;
//             if (event.snapshot.value != null) {
//               dynamic data = event.snapshot.value;
//               if (data is Map<String, dynamic> && data['suhu'] != null) {
//                 double suhu = data['suhu'].toDouble();
//                 return Text('Suhu saat ini: $suhu °C');
//               } else {
//                 return const Text('Data tidak ditemukan.');
//               }
//             } else {
//               return const Text('Data tidak ditemukan.');
//             }
//           } else {
//             return const Text('Loading...');
//           }
//         },
//       ),
//     );
//   }
// }

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';

// class SuhuDisplay extends StatefulWidget {
//   const SuhuDisplay({Key? key}) : super(key: key);

//   @override
//   State<SuhuDisplay> createState() => _SuhuDisplayState();
// }

// class _SuhuDisplayState extends State<SuhuDisplay> {
//   late DatabaseReference _dbref;

//   @override
//   void initState() {
//     super.initState();
//     Firebase.initializeApp(); // Inisialisasi Firebase
//     _dbref = FirebaseDatabase.instance
//         .ref('ESP32_Device')
//         .child('Kelembaban')
//         .child('Data');
//   }

//   Future<Map<String, dynamic>?> refData() async {
//     DataSnapshot dataSnapshot = (await _dbref.once()) as DataSnapshot;

//     if (dataSnapshot.value != null) {
//       Map<String, dynamic> suhuData =
//           dataSnapshot.value as Map<String, dynamic>;
//       return suhuData;
//     } else {
//       return null; // Data tidak ditemukan
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: FutureBuilder<Map<String, dynamic>?>(
//         future: refData(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const CircularProgressIndicator();
//           } else if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           } else if (snapshot.hasData) {
//             Map<String, dynamic>? suhuData = snapshot.data;
//             if (suhuData != null) {
//               return Text('Kelembaban: ${suhuData['data']}');
//             } else {
//               return const Text('Data tidak ditemukan');
//             }
//           } else {
//             return const Text('Tidak ada data');
//           }
//         },
//       ),
//     );
//   }
// }

import 'package:d_chart/d_chart.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class SuhuDisplay extends StatefulWidget {
  const SuhuDisplay({Key? key}) : super(key: key);

  @override
  State<SuhuDisplay> createState() => _SuhuDisplayState();
}

class _SuhuDisplayState extends State<SuhuDisplay> {
  late DatabaseReference _dbref;
  String databasejson = '';

  @override
  void initState() {
    super.initState();
    _dbref = FirebaseDatabase.instance.ref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Background transparan
        elevation: 0, // Menghilangkan bayangan di bawah AppBar
      ),
      body: Center(
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
                  return Column(children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey[200], // Warna latar belakang abu-abu
                        borderRadius:
                            BorderRadius.circular(50), // Mengatur sudut kotak
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 52, 52, 52),
                            offset: Offset(0, 3),
                            blurRadius: 6, // Bayangan
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(children: <Widget>[
                        const SizedBox(
                          height: 13,
                        ),
                        Text(
                          item[0]['Data'].toString(),
                          style: const TextStyle(fontSize: 50),
                        ),
                        Text(
                          "${item[0]['key']}",
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(item[0]['Timestamp'].toString()),
                      ]),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: 200,
                      width: 120,
                      child: AspectRatio(
                        aspectRatio: 1 / 1,
                        child: DChartBarCustom(
                          showDomainLabel: true,
                          spaceDomainLinetoChart: 10,
                          spaceBetweenItem: 10,
                          radiusBar:
                              const BorderRadius.all(Radius.circular(12)),
                          max: 100,
                          valueAlign: Alignment.topCenter,
                          listData: List.generate(item.length, (index) {
                            Map dataItem = item[index];
                            return DChartBarDataCustom(
                              value: dataItem['Data'].toDouble(),
                              label: dataItem['Timestamp'],
                              color: dataItem['Data'] > 30
                                  ? Colors.red
                                  : (dataItem['Data'] < 20
                                      ? Colors.blue
                                      : Colors.green),
                              showValue: true,
                            );
                          }),
                        ),
                      ),
                    ),
                  ]);
                },
              );
            } else {
              return const Center(child: Text("No data"));
            }
          },
        ),
      ),
    );
  }
}
