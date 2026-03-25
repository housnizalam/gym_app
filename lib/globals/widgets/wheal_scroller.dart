import 'package:flutter/material.dart';

class WhealScroller extends StatefulWidget {
  const WhealScroller({
    super.key,
    required this.onValueChange,
    this.firstValue = 0,
    this.lastValue = 10,
    this.height = 150,
    this.width = 120,
    this.startValue = 0,
  });
  final Function(int value) onValueChange;
  final int firstValue;
  final int lastValue;
  final double height;
  final double width;
  final int startValue;

  @override
  State<WhealScroller> createState() => _WhealScrollerState();
}

class _WhealScrollerState extends State<WhealScroller> {
  late FixedExtentScrollController scrollController;

  int selectedValue = 0;
  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    // Den scrollController mit dem initialen Wert initialisieren
    scrollController =
        FixedExtentScrollController(initialItem: widget.startValue);
    selectedValue = widget.startValue; // Anfangswert setzen
  }

  @override
  Widget build(BuildContext context) {
    final int firstValue = widget.firstValue;
    final int lastValue = widget.lastValue;
    int startValue = widget.startValue;

    return GestureDetector(
      onDoubleTap: () {
        setState(() {
          isFocused = !isFocused;
          scrollController =
              FixedExtentScrollController(initialItem: startValue);
        });
      },
      child: isFocused
          ? Container(
              height: widget.height,
              width: widget.width,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(8),
                  bottom: Radius.circular(8),
                ),
                gradient: RadialGradient(
                  radius: 0.7,
                  colors: [
                    Colors.blue[900]!,
                    Colors.black,
                  ],
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.blue,
                    blurRadius: 2.0,
                    spreadRadius: 2.0,
                    offset: Offset(1.0, 1.0),
                  ),
                ],
              ),
              child: ListWheelScrollView(
                controller: scrollController,
                perspective: 0.003,
                onSelectedItemChanged: (value) {
                  widget.onValueChange(value);
                  setState(() {
                    selectedValue = value;
                  });
                },
                squeeze: 1.5,
                physics: const FixedExtentScrollPhysics(),
                itemExtent: widget.height * 0.7,
                diameterRatio: 1.4,
                children: [
                  for (var i = firstValue; i <= lastValue; i++)
                    Center(
                      child: FittedBox(
                        child: Text(
                          i.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                ],
              ),
            )
          : Container(
              height: widget.height * 0.6,
              width: widget.width,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  selectedValue.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
    );
  }
}
