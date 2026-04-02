import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/globals/extensionen/navigator.dart';
import 'package:gym_app/globals/extensionen/size_extension.dart';
import 'package:gym_app/globals/widgets/my_container.dart';
import 'package:gym_app/globals/widgets/my_inkwell.dart';
import 'package:gym_app/gui/home_widgets/training_widget/main_training_widgets/page_widgets/creat_day_widgets/add_traininig_widget/add_training_widget.dart';
import 'package:gym_app/gui/home_widgets/training_widget/main_training_widgets/page_widgets/creat_day_widgets/creat_training_widget.dart';
import 'package:gym_app/gui/home_widgets/training_widget/main_training_widgets/page_widgets/select_saved_training_widget.dart';
import 'package:gym_app/riverpod/appstate_provider.dart';
import 'package:gym_app/riverpod/calendar_providers.dart';
import 'package:gym_app/riverpod/temp_day_provider.dart';

class CalenderAddTrainingWidget extends ConsumerWidget {
  const CalenderAddTrainingWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDay = ref.watch(selectedDayProvider);
    final savedTrainingDays =
        ref.watch(appStateProvider.select((value) => value.savedTrainingsdays));
    return MyContainer(
      width: context.width,
      height: context.height * 0.7,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Choose a saved Training',
              style: TextStyle(color: Colors.white),
            ),
            if (savedTrainingDays != null && savedTrainingDays.isNotEmpty)
              for (final savedTrainingDay in savedTrainingDays)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyInkwell(
                    height: 50,
                    width: context.width * 0.5,
                    onTap: () {
                      final newDay =
                          savedTrainingDay.day.copyWith(date: selectedDay);
                      ref.read(appStateProvider.notifier).addDay(newDay);
                      ref.read(calenderSelectedTeainingsDay.notifier).state =
                          newDay;

                      context.pop();
                    },
                    child: Text(
                      savedTrainingDay.name,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
            SizedBox(
              height: context.height * 0.1,
            ),
            TextButton(
              onPressed: () {
                ref.invalidate(creatTempDayProvider);
                context.navigatePushTo(
                    const Material(child: CreatTrainingWidget()));
              },
              child: Text('Create new training',
                  style: const TextStyle(color: Colors.blue, fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
