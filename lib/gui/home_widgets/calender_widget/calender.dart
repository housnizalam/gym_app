import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/globals/extensionen/navigator.dart';
import 'package:gym_app/globals/widgets/my_container.dart';
import 'package:gym_app/gui/home_widgets/calender_widget/calender_widgets/day_widget.dart';
import 'package:gym_app/gui/home_widgets/calender_widget/calender_widgets/toda_widget.dart';

import 'package:gym_app/riverpod/calender_providers.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderWidget extends ConsumerWidget {
  const CalenderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(focusNodeProvider);
    final now = DateTime.now();
    return Material(
      child: Scaffold(
        body: MyContainer(
   
          child: Column(
            children: [
              SizedBox(
                height: 8,
              ),
              Expanded(
                  child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      context.pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )),
              Expanded(
                flex: 16,
                child: TableCalendar(
                  onHeaderLongPressed: (_) {
                    ref.read(focusNodeProvider.notifier).state = now;
                  },
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
                  firstDay: DateTime.utc(1980, 1, 1),
                  lastDay: DateTime.utc(now.year + 1, 12, 31),
                  focusedDay: now,
                  pageAnimationEnabled: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
