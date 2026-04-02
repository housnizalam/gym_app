import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/globals/extensionen/list_extension.dart';
import 'package:gym_app/models/appstate.dart';
import 'package:gym_app/models/day.dart';
import 'package:gym_app/models/saved_trainingsday.dart';
import 'package:gym_app/models/trainings/created_trining.dart';
import 'package:gym_app/models/trainings/training.dart';
import 'package:gym_app/storage/hive_main.dart';

class AppStateNotifier extends StateNotifier<AppState> {
AppStateNotifier()
    : super(AppState(
        days: HiveService.loadDays(),
        savedTrainingsdays: HiveService.loadSavedDays(),
        createdTrainings: HiveService.loadCreatedTrainings(), // NEU
      ));

  void addDay(Day day) {
    final newDays = [...state.days, day];
    state = AppState(
      days: newDays,
      savedTrainingsdays: state.savedTrainingsdays,
      user: state.user,
    );
    HiveService.saveDays(newDays); // حفظ تلقائي
  }

  void mergToDays(Day day){
    final index = state.days.indexWhere(
      (element) => element.date.year == day.date.year &&
          element.date.month == day.date.month &&
          element.date.day == day.date.day,
    );
    if (index == -1) {
      addDay(day);
      return;
    }
    final today=state.days[index];
    final mergedDay = Day( 
      date: today.date,
      trainings: [...today.trainings, ...day.trainings],
    );
    replaceDay(mergedDay);
   HiveService.saveDays(state.days); // حفظ تلقائي  
  }

  void replaceDay(Day day) {
    final index = state.days.indexWhere(
      (element) => element.date.year == day.date.year &&
          element.date.month == day.date.month &&
          element.date.day == day.date.day,
    );
    final newDays = [...state.days].replaceAt(index, day);
    state = AppState(
      days: newDays,
      savedTrainingsdays: state.savedTrainingsdays,
      user: state.user,
    );
    HiveService.saveDays(newDays); // حفظ تلقائي
  }

  void addSavedDay(SavedTrainingsday savedTrainingsday) {
    final newSavedDays =<SavedTrainingsday> [...state.savedTrainingsdays ?? [], savedTrainingsday];
    state = AppState(
      days: state.days,
      savedTrainingsdays: newSavedDays,
    );
    HiveService.saveSavedDays(newSavedDays); // حفظ تلقائي
  }

  void deleteSavedDay(SavedTrainingsday savedTrainingsday) {
    final newSavedDays =<SavedTrainingsday> [...state.savedTrainingsdays ?? []]
      ..removeWhere((element) => element.name == savedTrainingsday.name);
    state = AppState(
      days: state.days,
      savedTrainingsdays: newSavedDays,
    );
    HiveService.saveSavedDays(newSavedDays); // حفظ تلقائي
  }

// In AppStateNotifier – addStanderdTraining ersetzen:

/// Fügt ein vom Benutzer erstelltes Training hinzu und speichert es in Hive.
/// Das Training erscheint danach in der Trainingsauswahl-Liste.
void addStanderdTraining(Training training) {
  // Nur CreatedTrining wird gespeichert – kein direktes State-Mutieren
  if (training is! CreatedTrining) return;

  final newList = <CreatedTrining>[
    ...state.createdTrainings,
    training,
  ];
  state = state.copyWith(createdTrainings: newList);
  HiveService.saveCreatedTrainings(newList);
}
}

final appStateProvider =
    StateNotifierProvider<AppStateNotifier, AppState>((ref) {
  return AppStateNotifier();
});

final selectedSavedTraining = StateProvider<SavedTrainingsday?>((ref) => null);
final selectedStandardTrainingsList =
    StateProvider<List<Training>>((ref) => []);