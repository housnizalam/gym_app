import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/models/day.dart';
import 'package:gym_app/models/trainings/chest_trainings.dart';
import 'package:gym_app/models/trainings/training.dart';

class TempDayNotifier extends StateNotifier<Day> {
  TempDayNotifier() : super(Day(date: DateTime.now(), trainings: []));

  void addTraining(Training training) {
    state = Day(
      date: state.date,
      trainings: [...state.trainings, training],
    );
  }

  void saveTraining(Training training) {
    int index =
        state.trainings.indexWhere((element) => element.id == training.id);
    state = Day(
      date: state.date,
      trainings: [...state.trainings]
        ..removeWhere((element) => element.id == training.id)
        ..insert(index, training),
    );
  }
}

final tempDayProvider = StateNotifierProvider<TempDayNotifier, Day>((ref) {
  return TempDayNotifier();
});

final selectedTraining =
    StateProvider<Training>((ref) => BenshPressSubTraining.standard());
