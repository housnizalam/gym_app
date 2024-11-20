import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/globals/extensionen/date_time.dart';
import 'package:gym_app/globals/extensionen/navigator.dart';
import 'package:gym_app/globals/extensionen/size_extension.dart';
import 'package:gym_app/globals/widgets/my_container.dart';
import 'package:gym_app/globals/widgets/my_inkwell.dart';
import 'package:gym_app/gui/home_widgets/calender_widget/calender_widgets/day_widget.dart';
import 'package:gym_app/gui/home_widgets/calender_widget/calender_widgets/toda_widget.dart';
import 'package:gym_app/gui/home_widgets/training_widget/main_training_widgets/page_widgets/weakday_widget.dart';

import 'package:gym_app/riverpod/calender_providers.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderWidget extends ConsumerWidget {
  const CalenderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDay = ref.watch(selectedDayProvider);
    final focusedDay = ref.watch(focusNodeProvider);
    final day = ref.watch(calenderSelectedTeainingsDay);
    final now = DateTime.now();
    return Material(
      child: MyContainer(
        height: context.height,
        width: context.width,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  TextButton(
                    onPressed: () {
                      ref.read(focusNodeProvider.notifier).state = now;
                      ref.read(selectedDayProvider.notifier).state = now;
                    },
                    child: Text(selectedDay.formattedDate,
                        style: TextStyle(color: Colors.white, fontSize: 25)),
                  ),
                  TableCalendar(
                    onHeaderLongPressed: (_) {},
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    calendarBuilders: CalendarBuilders(
                      todayBuilder: (context, date, focusedDay) =>
                          TodayWidget(date: date),
                      defaultBuilder: (context, date, events) => DayWidget(
                        date: date,
                      ),
                    ),
                    daysOfWeekHeight: 23,
                    daysOfWeekStyle: DaysOfWeekStyle(
                        weekdayStyle: TextStyle(color: Colors.white),
                        weekendStyle: TextStyle(color: Colors.white)),
                    calendarStyle: const CalendarStyle(),
                    headerStyle: const HeaderStyle(
                      leftChevronIcon:
                          Icon(Icons.chevron_left, color: Colors.white),
                      rightChevronIcon:
                          Icon(Icons.chevron_right, color: Colors.white),
                      titleTextStyle: TextStyle(color: Colors.white),
                      titleCentered: true,
                      formatButtonVisible: false,
                    ),
                    headerVisible: false,
                    firstDay: DateTime.utc(2000, 1, 1),
                    lastDay: DateTime.utc(now.year + 1, 12, 31),
                    focusedDay: focusedDay,
                    pageAnimationEnabled: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  if (day == null)
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Add new Trinring',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                ],
              ),
            ),
            Positioned(
              top: 5,
              left: 5,
              child: MyInkwell(
                height: 30,
                width: 30,
                onTap: () {
                  context.pop();
                },
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
