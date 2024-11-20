import 'package:flutter/material.dart';

class DensityTable extends StatelessWidget {
  const DensityTable(
      {super.key, required this.musclDensity, required this.totalDensity});
  final Map<String, double> musclDensity;
  final double totalDensity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 8.0, bottom: 20.0, right: 8.0, top: 08.0),
      child: Table(
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
                padding: EdgeInsets.all(8.0),
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
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    entry.key,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
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
    );
  }
}
