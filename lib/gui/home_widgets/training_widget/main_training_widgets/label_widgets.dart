import 'package:flutter/material.dart';
import 'package:gym_app/globals/extensionen/date_time.dart';

class WeakdayLabel extends StatelessWidget {
  const WeakdayLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return Container(
      child: Tooltip(
          message: '${now.todayAsWeakday}s Trainings',
          child: FittedBox(child: Text('${now.todayAsWeakday}s'))),
    );
  }
}

class SelectSavedTrainingsDayLabel extends StatelessWidget {
  const SelectSavedTrainingsDayLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
        message: 'Select one of saved Trainings',
        child: FittedBox(child: Text('Select')));
  }
}

class CreateTrainingLabel extends StatelessWidget {
  const CreateTrainingLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
        message: 'Create a new training',
        child: FittedBox(child: Text('Create')));
  }
}
