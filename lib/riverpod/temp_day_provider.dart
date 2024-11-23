import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/models/day.dart';
import 'package:gym_app/models/trainings/chest_trainings.dart';
import 'package:gym_app/models/trainings/training.dart';
import 'package:gym_app/riverpod/appstate_provider.dart';

class TempDayNotifier extends StateNotifier<Day> {
  TempDayNotifier([Day? day]) : super(Day(date: DateTime.now(), trainings:day?.trainings?? []));

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

  void removeTraining(Training training) {
    state = Day(
      date: state.date,
      trainings: [...state.trainings]..remove(training),
    );
  }

  void replaceAll(Day day){
    state=day;
  }
}

final creatTempDayProvider = StateNotifierProvider<TempDayNotifier, Day>((ref) {
  return TempDayNotifier();
});

final weakdayTempDayProvider =
    StateNotifierProvider<TempDayNotifier, Day>((ref) {
      final day=ref.watch(appStateProvider).thisWeakDay;
  return TempDayNotifier(day);
});

final selectedTraining =
    StateProvider<Training>((ref) => BenshPressSubTraining.standard());
