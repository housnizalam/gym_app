import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/models/appstate.dart';
import 'package:gym_app/models/saved_trainingsday.dart';
import 'package:gym_app/models/trainings/training.dart';

class AppStateNotifier extends StateNotifier<AppState> {
  AppStateNotifier() : super(AppState(days: []));

  void addTraining(Training training) {}
}

final appStateProvider =
    StateNotifierProvider<AppStateNotifier, AppState>((ref) {
  return AppStateNotifier();
});

final selectedSavedTraining = StateProvider<SavedTrainingsday?>((ref) => null);

final selectedStandardTrainingsList =
    StateProvider<List<Training>>((ref) => []);
