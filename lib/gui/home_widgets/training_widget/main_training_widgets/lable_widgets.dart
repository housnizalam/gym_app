import 'package:flutter/material.dart';
import 'package:gym_app/globals/extensionen/date_time.dart';

class WeakdayLable extends StatelessWidget {
  const WeakdayLable({
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

class SelectSavedTrainingsDayLable extends StatelessWidget {
  const SelectSavedTrainingsDayLable({super.key});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
        message: 'Select one of saved Trainings',
        child: FittedBox(child: Text('Select')));
  }
}

class CreateTrainingLable extends StatelessWidget {
  const CreateTrainingLable({super.key});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
        message: 'creat a new Training',
        child: FittedBox(child: Text('Create')));
  }
}
