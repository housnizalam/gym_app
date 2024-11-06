import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/globals/extensionen/date_time.dart';
import 'package:gym_app/globals/widgets/my_inkwell.dart';
import 'package:gym_app/riverpod/calender_providers.dart';

class DayWidget extends ConsumerWidget {
  const DayWidget({super.key, required this.date});
  final DateTime date;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDay = ref.watch(selectedDayProvider);

    return MyInkwell(
      onTap: () {
        print(date.formattedDate);
        ref.read(selectedDayProvider.notifier).state = date;
      },
      opacity: !date.isSameDay(selectedDay) ? 1 : 0.7,
      decoration: !date.isSameDay(selectedDay)
          ? null
          : BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.yellow,
                  blurRadius: 10.0,
                  spreadRadius: 4.0,
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
      child: Text(
        date.day.toString(),
        style: TextStyle(
            color: !date.isSameDay(selectedDay) ? Colors.white : Colors.yellow),
      ),
    );
    // InkWell(
    //   onTap: () {
    //     print(date.formattedDate);
    //     ref.read(selectedDayProvider.notifier).state = date;
    //   },
    //   child: Opacity(
    //     opacity: !date.isSameDay(selectedDay) ? 1 : 0.7,
    //     child: AnimatedContainer(
    //       duration: const Duration(milliseconds: 400),
    //       margin: const EdgeInsets.all(2.0),
    //       alignment: Alignment.center,
    //       decoration: !date.isSameDay(selectedDay)
    //           ? BoxDecoration(

    //               boxShadow: const [
    //                 BoxShadow(
    //                   color: Colors.blue,
    //                   blurRadius: 2.0,
    //                   spreadRadius: 1.0,
    //                   offset: Offset(1.0, 1.0),
    //                 ),
    //               ],
    //               gradient: RadialGradient(
    //                 radius: 0.7,
    //                 colors: [
    //                   Colors.blue[900]!,
    //                   Colors.black,
    //                 ],
    //               ),
    //               borderRadius: BorderRadius.circular(10.0),
    //             )
    //           : BoxDecoration(
    //               boxShadow: const [
    //                 BoxShadow(
    //                   color: Colors.yellow,
    //                   blurRadius: 10.0,
    //                   spreadRadius: 4.0,
    //                   offset: Offset(1.0, 1.0),
    //                 ),
    //               ],
    //               gradient: RadialGradient(
    //                 radius: 1,
    //                 colors: [
    //                   Colors.blue[900]!,
    //                   Colors.black,
    //                 ],
    //               ),
    //               borderRadius: BorderRadius.circular(10.0),
    //             ),
    //       child: Text(
    //         date.day.toString(),
    //         style: TextStyle(
    //             color: !date.isSameDay(selectedDay)
    //                 ? Colors.white
    //                 : Colors.yellow),
    //       ),
    //     ),
    //   ),
    // );
  }
}
