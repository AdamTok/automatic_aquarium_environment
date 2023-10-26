import 'package:flutter/material.dart';
import 'package:d_chart/d_chart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RealTimeChart extends StatelessWidget {
  const RealTimeChart({super.key});

  @override
  Widget build(BuildContext context) {
    List suhu = [
      {'timestamp': 'A', 'suhu': 10},
      {'timestamp': 'B', 'suhu': 2},
      {'timestamp': 'C', 'suhu': 29},
      {'timestamp': 'D', 'suhu': 45},
      {'timestamp': 'E', 'suhu': 67},
    ];
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: AspectRatio(
                aspectRatio: 2 / 1,
                child: DChartBarCustom(
                  showDomainLine: true,
                  showDomainLabel: true,
                  showMeasureLine: true,
                  showMeasureLabel: true,
                  spaceMeasureLinetoChart: 10,
                  spaceDomainLinetoChart: 10,
                  radiusBar: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  max: 100,
                  valueAlign: Alignment.topCenter,
                  listData: List.generate(suhu.length, (index) {
                    Map item = suhu[index];
                    return DChartBarDataCustom(
                        value: item['suhu'].toDouble(),
                        // toDouble kalo datanya berbentuk int
                        label: item['timestamp'],
                        shadowColor: Colors.black,
                        color: item['suhu'] > 30
                            ? Colors.red
                            : (item['suhu'] < 20 ? Colors.blue : Colors.green),
                        showValue: true);
                  }),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: AspectRatio(
                aspectRatio: 2 / 1,
                child: DChartBarCustom(
                  showDomainLine: true,
                  showDomainLabel: true,
                  showMeasureLine: true,
                  showMeasureLabel: true,
                  spaceMeasureLinetoChart: 10,
                  spaceDomainLinetoChart: 10,
                  radiusBar: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  max: 100,
                  valueAlign: Alignment.topCenter,
                  listData: List.generate(suhu.length, (index) {
                    Map item = suhu[index];
                    return DChartBarDataCustom(
                        value: item['suhu'].toDouble(),
                        // toDouble kalo datanya berbentuk int
                        label: item['timestamp'],
                        color: item['suhu'] > 30
                            ? Colors.red
                            : (item['suhu'] < 20 ? Colors.blue : Colors.green),
                        showValue: true);
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
