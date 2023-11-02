// import 'dart:math';

// import 'package:flutter/material.dart';

// class CircleProgress extends CustomPainter {
//   double value;
//   bool isTemp;

//   CircleProgress(this.value, this.isTemp);

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return true;
//   }

//   @override
//   void paint(Canvas canvas, Size size) {
//     int maximumValue =
//         isTemp ? 50 : 100; // Temp's max is 50, Humidity's max is 100

//     Paint outerCircle = Paint()
//       ..strokeWidth = 14
//       ..color = Colors.grey
//       ..style = PaintingStyle.stroke;

//     Paint tempArc = Paint()
//       ..strokeWidth = 14
//       ..color = Colors.red
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round;

//     Paint humidityArc = Paint()
//       ..strokeWidth = 14
//       ..color = Colors.blue
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round;

//     Offset center = Offset(size.width / 2, size.height / 2);
//     double radius = min(size.width / 2, size.height / 2) - 14;
//     canvas.drawCircle(center, radius, outerCircle);

//     double angle = 2 * pi * (value / maximumValue);

//     canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
//         angle, false, isTemp ? tempArc : humidityArc);
//   }
// }


import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class SuhuDisplay extends StatefulWidget {
  const SuhuDisplay({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SuhuDisplay> createState() => _SuhuDisplayState();
}

class _SuhuDisplayState extends State<SuhuDisplay> {
  late DatabaseReference _dbref;
  String databasejson = '';
  var newAge;

  @override
  void initState() {
    super.initState();
    _dbref = FirebaseDatabase.instance.ref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildText('Age is $databasejson'),
            buildText('New Age is: $newAge'),
            StreamBuilder(
              stream: _dbref.onValue,
              builder: (context, AsyncSnapshot snap) {
                if (snap.hasData &&
                    !snap.hasError &&
                    snap.data.snapshot.value != null) {
                  Map data = snap.data.snapshot.value;
                  List item = [];
                  data.forEach(
                      (index, data) => item.add({"key": index, ...data}));
                  return Expanded(
                    child: ListView.builder(
                      itemCount: item.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text("Customer: ${item[index]['key']}"),
                          subtitle:
                              Text('Age: ${item[index]['age'].toString()}'),
                          isThreeLine: true,
                        );
                      },
                    ),
                  );
                } else {
                  return const Center(child: Text("No data"));
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Text buildText(String s) {
    return Text(
      s,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  void ageChange() {
    /*
       var subscription = FirebaseDatabase.instance
      .reference()
      .child('messages')
      .Xxx
      .listen((event) {
        // process event
      });

      where Xxx is one of
      onvalue
      onChildAdded
      onChildRemoved
      onChildChanged

      To end the subscription you can use
      subscription.cancel();
    */
    _dbref
        .child('customer1')
        .child('age')
        .onValue
        .listen((DatabaseEvent event) {
      Object? data = event.snapshot.value;
      print('weight data: $data');
      setState(() {
        newAge = data;
      });
    });
  }
}
