import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderWidget extends StatelessWidget {
  const CalenderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return Material(
      child: Scaffold(
        appBar: AppBar(),
        body: TableCalendar(
          calendarBuilders: CalendarBuilders(
            defaultBuilder: (context, date, events) => Container(
              margin: const EdgeInsets.all(4.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                date.day.toString(),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          daysOfWeekStyle: DaysOfWeekStyle(),
          calendarStyle: CalendarStyle(),
          headerStyle: HeaderStyle(
            titleCentered: true,
            formatButtonVisible: false,
          ),
          firstDay: DateTime.utc(1980, 1, 1),
          lastDay: DateTime.utc(now.year + 1, 12, 31),
          focusedDay: now,
        ),
      ),
    );
  }
}
