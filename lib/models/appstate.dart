import 'dart:core';

import 'package:gym_app/globals/extensionen/date_time.dart';
import 'package:gym_app/models/day.dart';
import 'package:gym_app/models/saved_trainingsday.dart';
import 'package:gym_app/models/trainings/back_trainings.dart';
import 'package:gym_app/models/trainings/biceps_training.dart';
import 'package:gym_app/models/trainings/chest_trainings.dart';
import 'package:gym_app/models/trainings/forarm.training.dart';
import 'package:gym_app/models/trainings/leg_trainings.dart';
import 'package:gym_app/models/trainings/shoulder_traininga.dart';
import 'package:gym_app/models/trainings/training.dart';
import 'package:gym_app/models/trainings/triceps_training.dart';
import 'package:gym_app/models/uer.dart';

import 'trainings/core_trainings.dart';

// enum TrainingType {
//   chest(name: 'Chest',subTrainings: []),
//   back(name: 'Back',subTrainings: []),
//   shoulder (name: 'Shoulder',subTrainings: []),
//   biceps (name: 'Biceps',subTrainings: []),
//   triceps (name: 'Triceps',subTrainings: []),
//   forArm (name: 'ForArm',subTrainings: []),
//   leg (name: 'Leg',subTrainings: []),
//   abbs (name: 'Abbs',subTrainings: []),;
//   final String name;
//   final List<SubTraining> subTrainings;
//  const TrainingType({ required this.name, required this.subTrainings});
// }

class AppState {
  static const List<String> trainingTypes = [
    'Chest',
    'Back',
    'Shoulder',
    'Biceps',
    'Triceps',
    'For Arm',
    'Legs',
    'Core',
  ];

  final List<Day> days;
  final List<SavedTrainingsday>? savedTrainingsdays;
  final List<Training>? subTrainings;
  final User? user;
  final List<Training> allStandardTraining;

  AppState({
    required this.days,
    this.user,
    this.subTrainings,
    this.savedTrainingsdays,
  }) : allStandardTraining = [
          ArnoldPress.standard(),
          BackLegExtension.standard(),
          BarbellCurl.standard(),
          BenshPressSubTraining.standard(),
          BentOverRow.standard(),
          BicycleCrunch.standard(),
          CableFly.standard(),
          CalfRaise.standard(),
          ChinUps.standard(),
          CloseGripBenchPress.standard(),
          ConcentrationCurl.standard(),
          Crunch.standard(),
          Deadlift.standard(),
          DeclineBenchPress.standard(),
          Dips.standard(),
          DumbbellCurl.standard(),
          DumbbellFly.standard(),
          FacePull.standard(),
          FrontLegExtension.standard(),
          FrontRaise.standard(),
          HammerCurl.standard(),
          InclineBenchPress.standard(),
          LateralRaise.standard(),
          LatPulldown.standard(),
          LegPress.standard(),
          LegRaise.standard(),
          Lunges.standard(),
          MilitaryPress.standard(),
          MountainClimber.standard(),
          OverheadTricepExtension.standard(),
          PreacherCurl.standard(),
          PullUps.standard(),
          RearDeltFly.standard(),
          ReverseCurl.standard(),
          ReverseWristCurl.standard(),
          RussianTwist.standard(),
          SeatedRow.standard(),
          Shrugs.standard(),
          SkullCrusher.standard(),
          Squat.standard(),
          TBarRow.standard(),
          TricepKickback.standard(),
          TricepPushdown.standard(),
          UprightRow.standard(),
          WristCurl.standard(),
          ZottmanCurl.standard(),
        ];

  List<Training> getSelectedStandardTainingList(String trainingsTyp) =>
      allStandardTraining
          .where((e) => e.maintargetetMuscle == trainingsTyp)
          .toList();

  SavedTrainingsday? get todaysTraining {
    if (days.isEmpty) {
      return null;
    }
    SavedTrainingsday? result;
    for (var day in days) {
      if (day.date.isSameDay(DateTime.now())) {
        result = SavedTrainingsday(name: 'Todays Training', day: day);
      }
    }
    return result;
  }

  Day? get thisWeakDay {
    Day? result;
    for (var day in days) {
      if (day.date.weekday == DateTime.now().weekday) {
        result = day;
      }
    }
    return result;
  }

  DateTime? get firstTrainingDate {
    if (days.isEmpty) {
      return null;
    }
    return days.first.date;
  }

  DateTime? get lastTrainingDate {
    if (days.isEmpty) {
      return null;
    }
    return days.last.date;
  }

  int get allTrainingDaysNumber => days.length;

  int get allTrainingsNumber {
    int result = 0;
    for (var day in days) {
      result += day.trainings.length;
    }
    return result;
  }

  double get trainingAveragePerDay {
    if (allTrainingDaysNumber == 0) {
      return 0;
    }

    return allTrainingsNumber / allTrainingDaysNumber;
  }

  List<Training> get allTrainings {
    List<Training> allTrainings = [];
    for (var day in days) {
      allTrainings.addAll(day.trainings);
    }
    return allTrainings;
  }
  List<Training> getListTrainingFromName(String name) {

    return allTrainings.where((element) => element.name == name).toList();
  }

  double get bestDensityDay{
    double result = 0;
    for (var day in days) {
      if (day.totalDensity > result) {
        result = day.totalDensity;
      }
    }
    return result;
  }
// get allTrainings
//   List<Training> get allTrainings {
//     List<Training> allTrainings = [];
//     for (var day in days) {
//       allTrainings.addAll(day.trainings);
//     }
//     return allTrainings;
//   }

// //#############################################################Chest#############################################################
//   // get all Chest Trainings
//   List<ChestTraining> get allChestTrainings =>
//       allTrainings.whereType<ChestTraining>().toList();
//   // get all Chest Sub Trainings
//   List<ChestSubTraining> get allChestSubTrainings {
//     List<ChestSubTraining> allChestSubTrainings = [];
//     for (var training in allChestTrainings) {
//       allChestSubTrainings
//           .addAll(training.subTrainings.whereType<ChestSubTraining>());
//     }
//     return allChestSubTrainings;
//   }

//   //#############################################################Back#############################################################
//   // get all Back Trainings
//   List<BackTraining> get allBackTrainings =>
//       allTrainings.whereType<BackTraining>().toList();
//   // get all Back Sub Trainings
//   List<BackSubTraining> get allBackSubTrainings {
//     List<BackSubTraining> allBackSubTrainings = [];
//     for (var training in allBackTrainings) {
//       allBackSubTrainings
//           .addAll(training.subTrainings.whereType<BackSubTraining>());
//     }
//     return allBackSubTrainings;
//   }

//   //#############################################################Shoulder#############################################################

//   // get all Shoulder Trainings
//   List<ShoulderTraining> get allShoulderTrainings =>
//       allTrainings.whereType<ShoulderTraining>().toList();

//   // get all Shoulder Sub Trainings

//   List<ShoulderSubTraining> get allShoulderSubTrainings {
//     List<ShoulderSubTraining> allShoulderSubTrainings = [];
//     for (var training in allShoulderTrainings) {
//       allShoulderSubTrainings
//           .addAll(training.subTrainings.whereType<ShoulderSubTraining>());
//     }
//     return allShoulderSubTrainings;
//   }

//   //#############################################################Biceps#############################################################

//   // get all Biceps Trainings
//   List<BicepTraining> get allBicepTrainings =>
//       allTrainings.whereType<BicepTraining>().toList();

//   // get all Biceps Sub Trainings
//   List<BicepsSubTraining> get allBicepsSubTrainings {
//     List<BicepsSubTraining> allBicepsSubTrainings = [];
//     for (var training in allBicepTrainings) {
//       allBicepsSubTrainings
//           .addAll(training.subTrainings.whereType<BicepsSubTraining>());
//     }
//     return allBicepsSubTrainings;
//   }

//   //#############################################################Triceps#############################################################

//   // get all Triceps Trainings

//   List<TricepTraining> get allTricepTrainings =>
//       allTrainings.whereType<TricepTraining>().toList();

//   // get all Triceps Sub Trainings

//   List<TricepSubTraining> get allTricepsSubTrainings {
//     List<TricepSubTraining> allTricepsSubTrainings = [];
//     for (var training in allTricepTrainings) {
//       allTricepsSubTrainings
//           .addAll(training.subTrainings.whereType<TricepSubTraining>());
//     }
//     return allTricepsSubTrainings;
//   }

//   //#############################################################ForArm#############################################################

//   // get all ForArm Trainings

//   List<ForArmTraining> get allForArmTrainings =>
//       allTrainings.whereType<ForArmTraining>().toList();

//   // get all ForArm Sub Trainings

//   List<ForArmSubTraining> get allForArmSubTrainings {
//     List<ForArmSubTraining> allForArmSubTrainings = [];
//     for (var training in allForArmTrainings) {
//       allForArmSubTrainings
//           .addAll(training.subTrainings.whereType<ForArmSubTraining>());
//     }
//     return allForArmSubTrainings;
//   }

//   //#############################################################Leg#############################################################

//   // get all Leg Trainings

//   List<LegTraining> get allLegTrainings =>
//       allTrainings.whereType<LegTraining>().toList();

//   // get all Leg Sub Trainings

//   List<LegSubTraining> get allLegSubTrainings {
//     List<LegSubTraining> allLegSubTrainings = [];
//     for (var training in allLegTrainings) {
//       allLegSubTrainings
//           .addAll(training.subTrainings.whereType<LegSubTraining>());
//     }
//     return allLegSubTrainings;
//   }

//   //#############################################################Abbs#############################################################

//   // get all Apps Trainings

//   List<AbbsTraining> get allAppsTrainings =>
//       allTrainings.whereType<AbbsTraining>().toList();

//   // get all Apps Sub Trainings

//   List<AbbsSubTraining> get allAppsSubTrainings {
//     List<AbbsSubTraining> allAppsSubTrainings = [];
//     for (var training in allAppsTrainings) {
//       allAppsSubTrainings
//           .addAll(training.subTrainings.whereType<AbbsSubTraining>());
//     }
//     return allAppsSubTrainings;
//   }

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
