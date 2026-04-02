import 'package:gym_app/models/muscle.dart';
import 'package:gym_app/models/sets.dart';

class Training {
  final String image;
  final int bodyWeight;
  final String name;
  final String mainTargetedMuscle;
  final List<Sets> sets;
  final List<Muscle> targetedMuscles;
  final DateTime date;
  const Training({
    required this.bodyWeight,
    required this.name,
    required this.mainTargetedMuscle,
    required this.sets,
    required this.targetedMuscles,
    required this.date,
    required this.image,
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
    for (var muscle in targetedMuscles) {
      double muscleDensity = muscle.traningsdensity * totaldensity;

      result.addAll({muscle.name: muscleDensity / 2});
    }
    return result;
  }

  Training copyWith({
    int? bodyWeight,
    String? name,
    String? mainTargetedMuscle,
    List<Sets>? sets,
    List<Muscle>? targetedMuscles,
    DateTime? date,
  }) {
    return Training(
      bodyWeight: bodyWeight ?? this.bodyWeight,
      name: name ?? this.name,
      mainTargetedMuscle: mainTargetedMuscle ?? this.mainTargetedMuscle,
      sets: sets ?? this.sets,
      targetedMuscles: targetedMuscles ?? this.targetedMuscles,
      date: date ?? this.date,
      image: image,
    );
  }

  String get id => name + date.toString();
}


// class ChestSubTraining extends SubTraining {
//   const ChestSubTraining({
//     required super.name,
//     required super.sets,
//     required super.targetedMuscles,
//     required super.date,
//   });
// }



// class BackSubTraining extends SubTraining {
//   const BackSubTraining({
//     required super.name,
//     required super.sets,
//     required super.targetedMuscles,
//     required super.date,
//   });
// }

// class ShoulderSubTraining extends SubTraining {
//   const ShoulderSubTraining({
//     required super.name,
//     required super.sets,
//     required super.targetedMuscles,
//     required super.date,
//   });
// }

// class BicepsSubTraining extends SubTraining {
//   const BicepsSubTraining({
//     required super.name,
//     required super.sets,
//     required super.targetedMuscles,
//     required super.date,
//   });
// }

// class TricepSubTraining extends SubTraining {
//   const TricepSubTraining({
//     required super.name,
//     required super.sets,
//     required super.targetedMuscles,
//     required super.date,
//   });
// }

// class ForArmSubTraining extends SubTraining {
//   const ForArmSubTraining({
//     required super.name,
//     required super.sets,
//     required super.targetedMuscles,
//     required super.date,
//   });
// }

// class LegSubTraining extends SubTraining {
//   const LegSubTraining({
//     required super.name,
//     required super.sets,
//     required super.targetedMuscles,
//     required super.date,
//   });
// }

// class AbbsSubTraining extends SubTraining {
//   const AbbsSubTraining({
//     required super.name,
//     required super.sets,
//     required super.targetedMuscles,
//     required super.date,
//   });
// }
