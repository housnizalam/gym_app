import 'package:gym_app/models/muscle.dart';
import 'package:gym_app/models/sets.dart';

class Training {
  final int bodyWeight;
  final String name;
  final String maintargetetMuscle;
  final List<Sets> sets;
  final List<Muscle> targetetMuscles;
  final DateTime date;
  const Training({
    required this.bodyWeight,
    required this.name,
    required this.maintargetetMuscle,
    required this.sets,
    required this.targetetMuscles,
    required this.date,
  });

  double get totaldensity {
    double result = 0;
    for (var set in sets) {
      result += set.reps * (set.weight + bodyWeight);
    }
    return result;
  }

  Map<String, double> get musclsDensity {
    Map<String, double> result = {};
    for (var muscle in targetetMuscles) {
      double muscleDensity = muscle.traningsdensity * totaldensity;
  
      result.addAll({muscle.name: muscleDensity/2});
    }
    return result;
  }
}


// class ChestSubTraining extends SubTraining {
//   const ChestSubTraining({
//     required super.name,
//     required super.sets,
//     required super.targetetMuscles,
//     required super.date,
//   });
// }



// class BackSubTraining extends SubTraining {
//   const BackSubTraining({
//     required super.name,
//     required super.sets,
//     required super.targetetMuscles,
//     required super.date,
//   });
// }

// class ShoulderSubTraining extends SubTraining {
//   const ShoulderSubTraining({
//     required super.name,
//     required super.sets,
//     required super.targetetMuscles,
//     required super.date,
//   });
// }

// class BicepsSubTraining extends SubTraining {
//   const BicepsSubTraining({
//     required super.name,
//     required super.sets,
//     required super.targetetMuscles,
//     required super.date,
//   });
// }

// class TricepSubTraining extends SubTraining {
//   const TricepSubTraining({
//     required super.name,
//     required super.sets,
//     required super.targetetMuscles,
//     required super.date,
//   });
// }

// class ForArmSubTraining extends SubTraining {
//   const ForArmSubTraining({
//     required super.name,
//     required super.sets,
//     required super.targetetMuscles,
//     required super.date,
//   });
// }

// class LegSubTraining extends SubTraining {
//   const LegSubTraining({
//     required super.name,
//     required super.sets,
//     required super.targetetMuscles,
//     required super.date,
//   });
// }

// class AbbsSubTraining extends SubTraining {
//   const AbbsSubTraining({
//     required super.name,
//     required super.sets,
//     required super.targetetMuscles,
//     required super.date,
//   });
// }
