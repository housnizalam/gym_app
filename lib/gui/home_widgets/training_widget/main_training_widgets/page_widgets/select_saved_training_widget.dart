import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/globals/extensionen/size_extension.dart';
import 'package:gym_app/globals/widgets/my_container.dart';
import 'package:gym_app/globals/widgets/my_inkwell.dart';
import 'package:gym_app/models/saved_trainingsday.dart';
import 'package:gym_app/riverpod/appstate_provider.dart';

class SelectSavedTrainingWidget extends ConsumerStatefulWidget {
  const SelectSavedTrainingWidget({super.key});

  @override
  ConsumerState<SelectSavedTrainingWidget> createState() =>
      _SelectSavedTrainingWidgetState();
}

class _SelectSavedTrainingWidgetState
    extends ConsumerState<SelectSavedTrainingWidget> {
  @override
  Widget build(BuildContext context) {
    final List<SavedTrainingsday>? savedTrainingsDays =
        ref.watch(appStateProvider.select((value) => value.savedTrainingsdays));
    if (savedTrainingsDays == null || savedTrainingsDays.isEmpty) {
      return MyContainer(
        child: Center(
          child: Text(
            'You have no saved Trainings',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }
    return MyContainer(
      height: context.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (var trainingsday in savedTrainingsDays) MyInkwell(),
          ],
        ),
      ),
    );
  }
}
