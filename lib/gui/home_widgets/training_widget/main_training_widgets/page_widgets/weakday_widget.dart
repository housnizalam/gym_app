import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/globals/extensionen/date_time.dart';
import 'package:gym_app/globals/extensionen/navigator.dart';
import 'package:gym_app/globals/widgets/my_container.dart';
import 'package:gym_app/globals/widgets/training_widget.dart';
import 'package:gym_app/models/saved_trainingsday.dart';
import 'package:gym_app/riverpod/appstate_provider.dart';

class WeakdayWidget extends ConsumerWidget {
  const WeakdayWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final thisWeakDay =
        ref.watch(appStateProvider.select((value) => value.thisWeakDay));
    final now = DateTime.now();
    if (thisWeakDay == null) {
      return MyContainer(
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () => context.pop(),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'You have no Trainings for ${now.todayAsWeakday}',
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      );
    }

    final SavedTrainingsday trainingsday = SavedTrainingsday(
        name: '${now.todayAsWeakday}s Trainings', day: thisWeakDay);
    return TrainingWidget(trainingsday: trainingsday);
  }
}
