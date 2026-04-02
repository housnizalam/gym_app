import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/globals/extensionen/date_time.dart';
import 'package:gym_app/globals/extensionen/navigator.dart';
import 'package:gym_app/globals/extensionen/size_extension.dart';
import 'package:gym_app/globals/widgets/density_table.dart';
import 'package:gym_app/globals/widgets/my_container.dart';
import 'package:gym_app/globals/widgets/my_inkwell.dart';
import 'package:gym_app/globals/widgets/my_table.dart';
import 'package:gym_app/gui/home_widgets/calendar_widget/calendar_widgets/calendar_add_training_widget.dart';
import 'package:gym_app/gui/home_widgets/calendar_widget/calendar_widgets/day_widget.dart';
import 'package:gym_app/riverpod/appstate_provider.dart';

import 'package:gym_app/riverpod/calendar_providers.dart';
import 'package:gym_app/riverpod/temp_day_provider.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderWidget extends ConsumerStatefulWidget {
  const CalenderWidget({super.key});

  @override
  ConsumerState<CalenderWidget> createState() => _CalenderWidgetState();
}

class _CalenderWidgetState extends ConsumerState<CalenderWidget> {
  @override
  Widget build(BuildContext context) {
    ref.watch(createTempDayProvider);
    final selectedDay = ref.watch(selectedDayProvider);
    final focusedDay = ref.watch(focusNodeProvider);
    final day = ref.watch(calenderSelectedTeainingsDay);
    ref.watch(appStateProvider);
    ScrollController controller = ScrollController();

    final now = DateTime.now();
    return Material(
      child: MyContainer(
        height: context.height,
        width: context.width,
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: controller,
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
                    // onPageChanged: (date) {
                    //   ref.read(focusNodeProvider.notifier).state = date;
                    //   ref.read(selectedDayProvider.notifier).state = date;
                    // },
                    onHeaderLongPressed: (_) {},
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    calendarBuilders: CalendarBuilders(
                      todayBuilder: (context, date, focusedDay) => DayWidget(
                        date: date,
                        controller: controller,
                      ),
                      defaultBuilder: (context, date, events) => DayWidget(
                        controller: controller,
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
                      onPressed: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return CalenderAddTrainingWidget();
                          },
                        );
                      },
                      child: Text(
                        'Add new Trinring',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  if (day != null)
                    MyTable(
                        title: Text('Trainings table',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        columnNumber: 3,
                        tableRowsList: [
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Name',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    'Sets',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    'Density',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          for (var training in day.trainings)
                            TableRow(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    training.name,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                      training.sets.length.toString(),
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                      '${training.totaldensity.toString()} kg',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            )
                        ]),
                  if (day != null)
                    SizedBox(
                      height: 15,
                    ),
                  if (day != null)
                    DensityTable(
                        musclDensity: day.totalMuscleDensityMap,
                        totalDensity: day.totalDensity)
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
                  ref.read(selectedDayProvider.notifier).state = now;
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
