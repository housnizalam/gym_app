import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/globals/extensionen/date_time.dart';
import 'package:gym_app/riverpod/calender_providers.dart';

class TodayWidget extends ConsumerWidget {
  const TodayWidget({super.key, required this.date});
  final DateTime date;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDay = ref.watch(selectedDayProvider);
    return InkWell(
      onTap: () {
        ref.read(selectedDayProvider.notifier).state = date;
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        decoration: !date.isSameDay(selectedDay)
            ? BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue,
                    blurRadius: 2.0,
                    spreadRadius: 1.0,
                    offset: Offset(1.0, 1.0),
                  ),
                ],
                gradient: RadialGradient(
                  radius: 0.7,
                  colors: [
                    Colors.blue[900]!,
                    Colors.black,
                  ],
                ),
                borderRadius: BorderRadius.circular(10.0),
              )
            : BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.yellow,
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                    offset: Offset(1.0, 1.0),
                  ),
                ],
                gradient: RadialGradient(
                  radius: 1,
                  colors: [
                    Colors.blue[900]!,
                    Colors.black,
                  ],
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          decoration: !date.isSameDay(selectedDay)
              ? ShapeDecoration(
                  shadows: const [
                    BoxShadow(
                      color: Colors.blue,
                      blurRadius: 2.0,
                      spreadRadius: 1.0,
                      offset: Offset(1.0, 1.0),
                    ),
                  ],
                  gradient: RadialGradient(
                    radius: 0.7,
                    colors: [
                      Colors.blue[900]!,
                      Colors.black,
                    ],
                  ),
                  shape: StarBorder(
                    points: 8,
                  ),
                )
              : ShapeDecoration(
                  shadows: const [
                    BoxShadow(
                      color: Colors.yellow,
                      blurRadius: 2.0,
                      spreadRadius: 2.0,
                      offset: Offset(1.0, 1.0),
                    ),
                  ],
                  gradient: RadialGradient(
                    radius: 1,
                    colors: [
                      Colors.blue[900]!,
                      Colors.black,
                    ],
                  ),
                  shape: StarBorder(
                    points: 8,
                  ),
                ),
          child: Center(
            child: Text(
              date.day.toString(),
              style: TextStyle(
                  color: !date.isSameDay(selectedDay)
                      ? Colors.white
                      : Colors.yellow),
            ),
          ),
        ),
      ),
    );
  }
}
