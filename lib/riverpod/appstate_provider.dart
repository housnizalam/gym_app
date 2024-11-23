import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/globals/extensionen/list_extension.dart';
import 'package:gym_app/models/appstate.dart';
import 'package:gym_app/models/day.dart';
import 'package:gym_app/models/saved_trainingsday.dart';
import 'package:gym_app/models/trainings/training.dart';

class AppStateNotifier extends StateNotifier<AppState> {
  AppStateNotifier() : super(AppState(days: []));

  void addDay(Day day) {
    state = AppState(
        days: [...state.days, day],
        savedTrainingsdays: state.savedTrainingsdays,
        user: state.user);
  }

  void replaceDay(Day day) {
    final index = state.days.indexWhere((element) => element.date == day.date);
    state = AppState(
      days: [...state.days].replaceAt(index, day),
    );
    print('days: ${state.days.length}');
  }

  void addSavedDay(SavedTrainingsday savedTrainingsday) {
    state = AppState(
      days: state.days,
      savedTrainingsdays: [
        ...state.savedTrainingsdays ?? [],
        savedTrainingsday
      ],
    );
  }

  void deleteSavedDay(SavedTrainingsday savedTrainingsday) {
    state = AppState(
      days: state.days,
      savedTrainingsdays: [...state.savedTrainingsdays ?? []]
        ..removeWhere((element) => element.name == savedTrainingsday.name),
    );
  }
}

final appStateProvider =
    StateNotifierProvider<AppStateNotifier, AppState>((ref) {
  return AppStateNotifier();
});

final selectedSavedTraining = StateProvider<SavedTrainingsday?>((ref) => null);

final selectedStandardTrainingsList =
    StateProvider<List<Training>>((ref) => []);
