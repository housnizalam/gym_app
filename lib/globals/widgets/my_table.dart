import 'package:flutter/material.dart';
import 'package:gym_app/globals/extensionen/size_extension.dart';

class MyTable extends StatelessWidget {
  const MyTable({
    super.key,
    this.padding,
    this.tableWidth,
    this.borderWidth,
    this.borderColor,
    this.title,
    required this.columnNumber,
    required this.tableRowsList,
  });
  final EdgeInsetsGeometry? padding;
  final double? tableWidth;
  final double? borderWidth;
  final Color? borderColor;
  final Widget? title;
  final int columnNumber;
  final List<TableRow> tableRowsList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: Column(
        children: [
          if (title != null)
            Container(
              width: tableWidth ?? context.width * 0.9,
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                      color: borderColor ?? Colors.white,
                      width: borderWidth ?? 3),
                  right: BorderSide(
                      color: borderColor ?? Colors.white,
                      width: borderWidth ?? 3),
                  top: BorderSide(
                      color: borderColor ?? Colors.white,
                      width: borderWidth ?? 3),
                ),
              ),
              child: Center(child: title!),
            ),
          SizedBox(
            width: tableWidth ?? context.width * 0.9,
            child: Table(
              border: TableBorder.all(color: Colors.white, width: 3),
              columnWidths: {
                for (int i = 0; i < columnNumber; i++)
                  i: i == 0 ? const IntrinsicColumnWidth() : const FlexColumnWidth(1),
              },
              children: [
                for (var tableRow in tableRowsList) tableRow,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
