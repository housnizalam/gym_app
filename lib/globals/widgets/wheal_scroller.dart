import 'package:flutter/material.dart';
import 'package:gym_app/globals/extensionen/size_extension.dart';
import 'package:gym_app/globals/widgets/my_container.dart';
import 'package:gym_app/globals/widgets/my_inkwell.dart';

class WhealScroller extends StatefulWidget {
  const WhealScroller(
      {super.key,
      required this.onValueChange,
      this.firstValue = 0,
      this.lastValue = 10});
  final Function(int value) onValueChange;
  final int firstValue;
  final int lastValue;

  @override
  State<WhealScroller> createState() => _WhealScrollerState();
}

class _WhealScrollerState extends State<WhealScroller> {
  bool isFocused = false;
  int selectedValue = 0;
  @override
  Widget build(BuildContext context) {
    // final int itemCount = widget.lastValue - widget.firstValue;
    final int firstValue = widget.firstValue;
    final int lastValue = widget.lastValue;

    return Material(
      child: GestureDetector(
        onDoubleTap: () {
          setState(() {
            isFocused = !isFocused;
          });
        },
        child: isFocused
            ? MyContainer(
                child: ListWheelScrollView(
                  perspective: 0.003,
                  onSelectedItemChanged: (value) {
                    widget.onValueChange(value);
                    selectedValue = value;
                  },
                  squeeze: 1.2,
                  physics: const FixedExtentScrollPhysics(),
                  itemExtent: context.height * 0.5,
                  diameterRatio: 1.4,
                  children: [
                    for (var i = firstValue; i <= lastValue; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            Expanded(
                                child: Container(
                              decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.blue,
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            )),
                            Expanded(
                              flex: 6,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: MyInkwell(
                                  width: context.width,
                                  child: Center(
                                    child: Text(
                                      i.toString(),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 50),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyInkwell(
                  // onTap: () {
                  //   setState(() {
                  //     isFocused = !isFocused;
                  //   });
                  // },
                  child: Center(
                    child: Text(
                      selectedValue.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 50),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
