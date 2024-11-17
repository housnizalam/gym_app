import 'package:gym_app/globals/extensionen/map_extension.dart';
import 'package:gym_app/models/muscle.dart';
import 'package:gym_app/models/trainings/training.dart';

class Day {
  final DateTime date;
  final List<Training> trainings;
  const Day({required this.date, required this.trainings});

  //#############################################################All#############################################################
  double get totalDensity {
    double result = 0;
    for (var training in trainings) {
      result += training.totaldensity;
    }
    return result;
  }

  Map<String, double> get totalMuscleDensityMap {
    Map<String, double> result = {};
    for (var training in trainings) {
      for (var muscleDensity in training.musclsDensity.keys) {
        if (result.containsKey(muscleDensity)) {
          result[muscleDensity] =
              result[muscleDensity]! + training.musclsDensity[muscleDensity]!;
        } else {
          result
              .addAll({muscleDensity: training.musclsDensity[muscleDensity]!});
        }
      }
    }
    return result.sortByValue();
  }

// get all Sub Trainings
  //   List<SubTraining> get allSubTrainings {
  //   List<SubTraining> allSubTrainings = [];
  //   for (var training in trainings) {
  //     allSubTrainings.addAll(training.subTrainings);
  //   }
  //   return allSubTrainings;
  // }

  //#############################################################Chest#############################################################

  // get all chest trainings
  // List<ChestSubTraining> get allChestSubTraining {
  //   List<ChestSubTraining> allChestSubTraining = [];
  //   for (var training in trainings) {
  //     allChestSubTraining
  //         .addAll(training.subTrainings.whereType<ChestSubTraining>());
  //   }
  //   return allChestSubTraining;
  // }

  // get Chest Density
  // int get chestDensity {
  //   double chestDensity = 0;
  //   for (var training in allSubTrainings) {
  //     for (var targetedMuscle in training.targetetMuscles) {
  //       if (targetedMuscle.name == 'Chest') {
  //         double trainingDensity = 0;
  //         for (var set in training.sets) {
  //           trainingDensity += set.reps * set.weight;
  //         }
  //         chestDensity += targetedMuscle.traningsdensity * trainingDensity;
  //       }
  //     }
  //   }
  //   return chestDensity.toInt();
  // }

  //#############################################################Back#############################################################
  // get all back trainings
  //   List<BackSubTraining> get allBackSubTraining {
  //   List<BackSubTraining> allBackSubTraining = [];
  //   for (var training in trainings) {
  //     allBackSubTraining
  //         .addAll(training.subTrainings.whereType<BackSubTraining>());
  //   }
  //   return allBackSubTraining;
  // }

  // get Back Density

  // int get backDensity {
  //   double backDensity = 0;
  //   for (var training in allSubTrainings) {
  //     for (var targetedMuscle in training.targetetMuscles) {
  //       if (targetedMuscle.name == 'Back') {
  //         double trainingDensity = 0;
  //         for (var set in training.sets) {
  //           trainingDensity += set.reps * set.weight;
  //         }
  //         backDensity += targetedMuscle.traningsdensity * trainingDensity;
  //       }
  //     }
  //   }
  //   return backDensity.toInt();
  // }

  //#############################################################Shoulder#############################################################
  // get all shoulder trainings
//    List<ShoulderSubTraining> get allShoulderSubTraining {
//     List<ShoulderSubTraining> allShoulderSubTraining = [];
//     for (var training in trainings) {
//       allShoulderSubTraining
//           .addAll(training.subTrainings.whereType<ShoulderSubTraining>());
//     }
//     return allShoulderSubTraining;
//   }

//   // get Shoulder Density

//   int get shoulderDensity {
//     double shoulderDensity = 0;
//     for (var training in allSubTrainings) {
//       for (var targetedMuscle in training.targetetMuscles) {
//         if (targetedMuscle.name == 'Shoulder') {
//           double trainingDensity = 0;
//           for (var set in training.sets) {
//             trainingDensity += set.reps * set.weight;
//           }
//           shoulderDensity += targetedMuscle.traningsdensity * trainingDensity;
//         }
//       }
//     }
//     return shoulderDensity.toInt();
//   }

//   //#############################################################Biceps#############################################################
//   // get all biceps trainings
//   List<BicepsSubTraining> get allBicepsSubTraining {
//     List<BicepsSubTraining> allBicepsSubTraining = [];
//     for (var training in trainings) {
//       allBicepsSubTraining
//           .addAll(training.subTrainings.whereType<BicepsSubTraining>());
//     }
//     return allBicepsSubTraining;
//   }

//   // get all biceps Density
//   int get bicepsDensity {
//     double bicepsDensity = 0;
//     for (var training in allSubTrainings) {
//       for (var targetedMuscle in training.targetetMuscles) {
//         if (targetedMuscle.name == 'Biceps') {
//           double trainingDensity = 0;
//           for (var set in training.sets) {
//             trainingDensity += set.reps * set.weight;
//           }
//           bicepsDensity += targetedMuscle.traningsdensity * trainingDensity;
//         }
//       }
//     }
//     return bicepsDensity.toInt();
//   }

//   //#############################################################Triceps#############################################################
//   // get all triceps trainings
//     List<TricepSubTraining> get allTricepSubTraining {
//     List<TricepSubTraining> allTricepSubTraining = [];
//     for (var training in trainings) {
//       allTricepSubTraining
//           .addAll(training.subTrainings.whereType<TricepSubTraining>());
//     }
//     return allTricepSubTraining;
//   }

//   // get all triceps Density

//   int get tricepsDensity {
//     double tricepsDensity = 0;
//     for (var training in allSubTrainings) {
//       for (var targetedMuscle in training.targetetMuscles) {
//         if (targetedMuscle.name == 'Triceps') {
//           double trainingDensity = 0;
//           for (var set in training.sets) {
//             trainingDensity += set.reps * set.weight;
//           }
//           tricepsDensity += targetedMuscle.traningsdensity * trainingDensity;
//         }
//       }
//     }
//     return tricepsDensity.toInt();
//   }

//   //#############################################################ForArm#############################################################
//   // get all forArm trainings

//     List<ForArmSubTraining> get allForArmSubTraining {
//     List<ForArmSubTraining> allForArmSubTraining = [];
//     for (var training in trainings) {
//       allForArmSubTraining
//           .addAll(training.subTrainings.whereType<ForArmSubTraining>());
//     }
//     return allForArmSubTraining;
//   }

//   // get all forArm Density
//   int get forArmDensity {
//     double forArmDensity = 0;
//     for (var training in allSubTrainings) {
//       for (var targetedMuscle in training.targetetMuscles) {
//         if (targetedMuscle.name == 'ForArm') {
//           double trainingDensity = 0;
//           for (var set in training.sets) {
//             trainingDensity += set.reps * set.weight;
//           }
//           forArmDensity += targetedMuscle.traningsdensity * trainingDensity;
//         }
//       }
//     }
//     return forArmDensity.toInt();
//   }

//   //#############################################################Leg#############################################################
// // get all leg trainings
//    List<LegSubTraining> get allLegSubTraining {
//     List<LegSubTraining> allLegSubTraining = [];
//     for (var training in trainings) {
//       allLegSubTraining
//           .addAll(training.subTrainings.whereType<LegSubTraining>());
//     }
//     return allLegSubTraining;
//   }

// // get all leg Density
//   int get legDensity {
//     double legDensity = 0;
//     for (var training in allSubTrainings) {
//       for (var targetedMuscle in training.targetetMuscles) {
//         if (targetedMuscle.name == 'Leg') {
//           double trainingDensity = 0;
//           for (var set in training.sets) {
//             trainingDensity += set.reps * set.weight;
//           }
//           legDensity += targetedMuscle.traningsdensity * trainingDensity;
//         }
//       }
//     }
//     return legDensity.toInt();
//   }

//   //#############################################################Abbs#############################################################
//   // get all abbs trainings
//     List<AbbsSubTraining> get allAbbsSubTraining {
//     List<AbbsSubTraining> allAbbsSubTraining = [];
//     for (var training in trainings) {
//       allAbbsSubTraining
//           .addAll(training.subTrainings.whereType<AbbsSubTraining>());
//     }
//     return allAbbsSubTraining;
//   }
//   // get all abbs Density
//   int get abbsDensity {
//     double abbsDensity = 0;
//     for (var training in allSubTrainings) {
//       for (var targetedMuscle in training.targetetMuscles) {
//         if (targetedMuscle.name == 'Abbs') {
//           double trainingDensity = 0;
//           for (var set in training.sets) {
//             trainingDensity += set.reps * set.weight;
//           }
//           abbsDensity += targetedMuscle.traningsdensity * trainingDensity;
//         }
//       }
//     }
//     return abbsDensity.toInt();
//   }
}
