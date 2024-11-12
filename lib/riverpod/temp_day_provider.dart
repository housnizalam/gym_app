import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/models/day.dart';
import 'package:gym_app/models/trainings/training.dart';


class TempDayNotifier extends StateNotifier<Day> {
  TempDayNotifier() : super(Day(date: DateTime.now(), trainings: []));

  void addTraining(Training training) {

      state = Day(
        date: state.date,
        trainings: [
          ...state.trainings,training
        ],
      );
    }
  }


final tempDayProvider = StateNotifierProvider<TempDayNotifier, Day>((ref) {
  return TempDayNotifier();
});

final selectedTrainingsName = StateProvider<Training?>((ref) => null);
