import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/globals/extensionen/date_time.dart';
import 'package:gym_app/globals/widgets/my_inkwell.dart';
import 'package:gym_app/riverpod/appstate_provider.dart';
import 'package:gym_app/riverpod/calendar_providers.dart';

class DayWidget extends ConsumerWidget {
  const DayWidget({super.key, required this.date, required this.controller});
  final DateTime date;
  final ScrollController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDay = ref.watch(selectedDayProvider);

    final days = ref.watch(appStateProvider.select(
      (value) => value.days,
    ));
    bool isExist = false;
    for (var day in days) {
      if (day.date.isSameDay(date)) isExist = true;
    }
    final day = isExist
        ? days.firstWhere(
            (element) => element.date.isSameDay(date),
          )
        : null;

    return Stack(
      children: [
        MyInkwell(
          onTap: () {
            ref.read(selectedDayProvider.notifier).state = date;
            ref.read(focusNodeProvider.notifier).state = date;
            ref.read(calenderSelectedTeainingsDay.notifier).state = day;
            if (day != null && controller.initialScrollOffset == 0) {
              controller.animateTo(300,
                  duration: Duration(milliseconds: 300), curve: Curves.easeOut);
              print('scroller');
            }
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
                color: !date.isSameDay(selectedDay)
                    ? Colors.white
                    : Colors.yellow),
          ),
        ),
        if (isExist)
          const Positioned(
              bottom: 5,
              left: 8,
              child: Icon(
                Icons.check,
                color: Colors.yellow,
                size: 12,
              ))
      ],
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
