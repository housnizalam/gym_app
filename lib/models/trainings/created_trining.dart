import 'package:gym_app/models/sets.dart';
import 'package:gym_app/models/trainings/training.dart';

class CreatedTrining extends Training {
  final bool isDumbbell;
  final double bodyWeightPercent;
  CreatedTrining({
    required this.isDumbbell,
    required super.bodyWeight,
    required super.name,
    required super.mainTargetedMuscle,
    required super.targetedMuscles,
    required super.sets,
    this.bodyWeightPercent = 0,
  }) : super(
          image: '',
          date: DateTime.now(),
        );

  factory CreatedTrining.standard() {
    return CreatedTrining(
      isDumbbell: true,
      bodyWeight: 80,
      name: 'Created Training',
      mainTargetedMuscle: 'Back',
      targetedMuscles: [],
      sets: const [
        Sets(reps: 0, weight: 0),
        Sets(reps: 0, weight: 0),
        Sets(reps: 0, weight: 0),
      ],
    );
  }

  @override
  double get totaldensity {
    double result = 0;
    for (var set in sets) {
      result += set.reps * (set.weight + bodyWeight * bodyWeightPercent);
    }
    if (isDumbbell) {
      result = result * 2;
    }
    return result;
  }

  @override
  String toString() {
    return 'CreatedTrining{isDumbbell: $isDumbbell, bodyWeightPercent: $bodyWeightPercent, bodyWeight: $bodyWeight, name: $name, mainTargetedMuscle: $mainTargetedMuscle, targetedMuscles: $targetedMuscles, sets: ${sets.length}}';
  }
}
