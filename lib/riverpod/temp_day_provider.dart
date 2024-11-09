import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/models/day.dart';
import 'package:gym_app/models/sub_training.dart';
import 'package:gym_app/models/training.dart';

class TempDayNotifier extends StateNotifier<Day> {
  TempDayNotifier() : super(Day(date: DateTime.now(), trainings: []));

  void addTraining(String trainingName) {
    print('hallo2');
    if (trainingName == 'BenshPress') {
      print('hallo3');
      final addedtraining = BenshPressSubTraining.standard();
      state = Day(
        date: state.date,
        trainings: [
          ...state.trainings,
          ChestTraining(subTrainings: [addedtraining], date: DateTime.now())
        ],
      );
      print(state.allChestSubTraining);
    }
  }
}

final tempDayProvider = StateNotifierProvider<TempDayNotifier, Day>((ref) {
  return TempDayNotifier();
});

final selectedTrainingsName = StateProvider<String>((ref) => '');
