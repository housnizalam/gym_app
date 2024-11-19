import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/globals/extensionen/date_time.dart';
import 'package:gym_app/globals/extensionen/navigator.dart';
import 'package:gym_app/globals/widgets/my_container.dart';
import 'package:gym_app/globals/widgets/my_inkwell.dart';
import 'package:gym_app/gui/home_widgets/training_widget/main_training_widgets/page_widgets/weak_day_widget/add_weak_day_widget.dart';
import 'package:gym_app/riverpod/appstate_provider.dart';

class WeakdayWidget extends ConsumerWidget {
  const WeakdayWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final thisWeakDay = ref.watch(appStateProvider).thisWeakDay;
    final now = DateTime.now();
    return Stack(
      children: [
        if (thisWeakDay == null)
          MyContainer(
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(35.0),
                    child: Text(
                      'You have no Trainings for ${now.todayAsWeakday}',
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        if (thisWeakDay != null) EditWeakDayWidget(),
        Positioned(
          left: 5,
          top: 5,
          child: MyInkwell(
            height: 30,
            width: 30,
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onTap: () {
              context.pop();
            },
          ),
        )
      ],
    );
    // final SavedTrainingsday trainingsday = SavedTrainingsday(
    //     name: '${now.todayAsWeakday}s Trainings', day: thisWeakDay);
    // ref.read(selectedSavedTraining.notifier).state = trainingsday;

    //
  }
}
