import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/globals/extensionen/navigator.dart';
import 'package:gym_app/globals/extensionen/size_extension.dart';
import 'package:gym_app/globals/widgets/my_container.dart';
import 'package:gym_app/globals/widgets/my_inkwell.dart';
import 'package:gym_app/riverpod/appstate_provider.dart';
import 'package:gym_app/riverpod/temp_day_provider.dart';

class ChooseSubTrainingWidget extends ConsumerWidget {
  const ChooseSubTrainingWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trainingsList = ref.watch(choosedMuscle);
    return MyContainer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (String training in trainingsList)
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: context.width * 0.15, vertical: 2),
                child: MyInkwell(
                  height: 50,
                  child: Text(training,
                      style: const TextStyle(color: Colors.white)),
                  onTap: () {
                    print('hallo');
                    ref.read(selectedTrainingsName.notifier).state = training;
                    ref.read(tempDayProvider.notifier).addTraining(training);
                    context.pop();
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
