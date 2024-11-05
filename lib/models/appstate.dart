import 'dart:core';

import 'package:gym_app/models/day.dart';
import 'package:gym_app/models/sub_training.dart';
import 'package:gym_app/models/training.dart';
import 'package:gym_app/models/uer.dart';

class AppState {
  final List<Day> days;
  final User? user;
  const AppState({required this.days,this.user});

// get allTrainings
  List<Training> get allTrainings {
    List<Training> allTrainings = [];
    for (var day in days) {
      allTrainings.addAll(day.trainings);
    }
    return allTrainings;
  }

//#############################################################Chest#############################################################
  // get all Chest Trainings
  List<ChestTraining> get allChestTrainings =>
      allTrainings.whereType<ChestTraining>().toList();
  // get all Chest Sub Trainings
  List<ChestSubTraining> get allChestSubTrainings {
    List<ChestSubTraining> allChestSubTrainings = [];
    for (var training in allChestTrainings) {
      allChestSubTrainings
          .addAll(training.subTrainings.whereType<ChestSubTraining>());
    }
    return allChestSubTrainings;
  }

  //#############################################################Back#############################################################
  // get all Back Trainings
  List<BackTraining> get allBackTrainings =>
      allTrainings.whereType<BackTraining>().toList();
  // get all Back Sub Trainings
  List<BackSubTraining> get allBackSubTrainings {
    List<BackSubTraining> allBackSubTrainings = [];
    for (var training in allBackTrainings) {
      allBackSubTrainings
          .addAll(training.subTrainings.whereType<BackSubTraining>());
    }
    return allBackSubTrainings;
  }

  //#############################################################Shoulder#############################################################

  // get all Shoulder Trainings
  List<ShoulderTraining> get allShoulderTrainings =>
      allTrainings.whereType<ShoulderTraining>().toList();

  // get all Shoulder Sub Trainings

  List<ShoulderSubTraining> get allShoulderSubTrainings {
    List<ShoulderSubTraining> allShoulderSubTrainings = [];
    for (var training in allShoulderTrainings) {
      allShoulderSubTrainings
          .addAll(training.subTrainings.whereType<ShoulderSubTraining>());
    }
    return allShoulderSubTrainings;
  }

  //#############################################################Biceps#############################################################

  // get all Biceps Trainings
  List<BicepTraining> get allBicepTrainings =>
      allTrainings.whereType<BicepTraining>().toList();

  // get all Biceps Sub Trainings
  List<BicepsSubTraining> get allBicepsSubTrainings {
    List<BicepsSubTraining> allBicepsSubTrainings = [];
    for (var training in allBicepTrainings) {
      allBicepsSubTrainings
          .addAll(training.subTrainings.whereType<BicepsSubTraining>());
    }
    return allBicepsSubTrainings;
  }

  //#############################################################Triceps#############################################################

  // get all Triceps Trainings

  List<TricepTraining> get allTricepTrainings =>
      allTrainings.whereType<TricepTraining>().toList();

  // get all Triceps Sub Trainings

  List<TricepSubTraining> get allTricepsSubTrainings {
    List<TricepSubTraining> allTricepsSubTrainings = [];
    for (var training in allTricepTrainings) {
      allTricepsSubTrainings
          .addAll(training.subTrainings.whereType<TricepSubTraining>());
    }
    return allTricepsSubTrainings;
  }

  //#############################################################ForArm#############################################################

  // get all ForArm Trainings

  List<ForArmTraining> get allForArmTrainings =>
      allTrainings.whereType<ForArmTraining>().toList();

  // get all ForArm Sub Trainings

  List<ForArmSubTraining> get allForArmSubTrainings {
    List<ForArmSubTraining> allForArmSubTrainings = [];
    for (var training in allForArmTrainings) {
      allForArmSubTrainings
          .addAll(training.subTrainings.whereType<ForArmSubTraining>());
    }
    return allForArmSubTrainings;
  }

  //#############################################################Leg#############################################################

  // get all Leg Trainings

  List<LegTraining> get allLegTrainings =>
      allTrainings.whereType<LegTraining>().toList();

  // get all Leg Sub Trainings

  List<LegSubTraining> get allLegSubTrainings {
    List<LegSubTraining> allLegSubTrainings = [];
    for (var training in allLegTrainings) {
      allLegSubTrainings
          .addAll(training.subTrainings.whereType<LegSubTraining>());
    }
    return allLegSubTrainings;
  }

  //#############################################################Abbs#############################################################

  // get all Apps Trainings

  List<AbbsTraining> get allAppsTrainings =>
      allTrainings.whereType<AbbsTraining>().toList();

  // get all Apps Sub Trainings

  List<AbbsSubTraining> get allAppsSubTrainings {
    List<AbbsSubTraining> allAppsSubTrainings = [];
    for (var training in allAppsTrainings) {
      allAppsSubTrainings
          .addAll(training.subTrainings.whereType<AbbsSubTraining>());
    }
    return allAppsSubTrainings;
  }

//#############################################################Day#############################################################
  Day? selectedDay(DateTime date) {
    for (var day in days) {
      if (day.date.year == date.year &&
          day.date.month == date.month &&
          day.date.day == date.day) {
        return day;
      }
    }
    return null;
  }

  AppState copyWith({List<Day>? days}) {
    return AppState(days: days ?? this.days);
  }
}
