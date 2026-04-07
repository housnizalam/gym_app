import 'package:flutter/material.dart';
import 'package:gym_app/globals/extensionen/size_extension.dart';

class DensityTable extends StatelessWidget {
  const DensityTable(
      {super.key, required this.musclDensity, required this.totalDensity});
  final Map<String, double> musclDensity;
  final double totalDensity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.9,
      child: Column(
        children: [
          Container(
            width: context.width * 0.9,
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(color: Colors.white, width: 1),
                right: BorderSide(color: Colors.white, width: 1),
                top: BorderSide(color: Colors.white, width: 1),
              ),
            ),
            child: const Center(
                child: Text(
              'Density table',
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
          ),
          Table(
            border: TableBorder.all(color: Colors.white),
            columnWidths: const {
              0: IntrinsicColumnWidth(),
              1: FlexColumnWidth(),
            },
            children: [
              // الصف الخاص بـ Total density
              TableRow(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Total density',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${totalDensity.toStringAsFixed(1)} Kg',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              // الصفوف الخاصة بـ العضلات والكثافة
              ...musclDensity.entries.map(
                (entry) => TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        entry.key,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${entry.value.toStringAsFixed(1)} Kg',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
