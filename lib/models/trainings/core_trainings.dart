import 'package:gym_app/models/muscle.dart';
import 'package:gym_app/models/sets.dart';
import 'package:gym_app/models/training_images.dart';
import 'package:gym_app/models/trainings/training.dart';

class Crunch extends Training {
  Crunch({
    required super.bodyWeight,
    required super.sets,
    required super.date,
  }) : super(
          image: TrainingImages.crunch,
          targetedMuscles: [
            Core(traningsdensity: 0.75),
            LowerBackMuscle(traningsdensity: 0.15),
            Glutes(traningsdensity: 0.1)
          ],
          name: 'Crunch',
          mainTargetedMuscle: 'Core',
        );

  factory Crunch.standard() {
    return Crunch(
      bodyWeight: 80,
      sets: const [
        Sets(reps: 0, weight: 0),
        Sets(reps: 0, weight: 0),
        Sets(reps: 0, weight: 0),
      ],
      date: DateTime.now(),
    );
  }

  @override
  double get totaldensity {
    double result = 0;
    for (var set in sets) {
      result += set.reps * (set.weight + bodyWeight * 0.25);
    }
    return result;
  }
}

class LegRaise extends Training {
  LegRaise({
    required super.bodyWeight,
    required super.sets,
    required super.date,
  }) : super(
          image: TrainingImages.legRaise,
          targetedMuscles: [
            Core(traningsdensity: 0.6),
            Glutes(traningsdensity: 0.2),
            Quads(traningsdensity: 0.1),
            LowerBackMuscle(traningsdensity: 0.1),
          ],
          name: 'Leg Raise',
          mainTargetedMuscle: 'Core',
        );

  factory LegRaise.standard() {
    return LegRaise(
      bodyWeight: 80,
      sets: const [
        Sets(reps: 0, weight: 0),
        Sets(reps: 0, weight: 0),
        Sets(reps: 0, weight: 0),
      ],
      date: DateTime.now(),
    );
  }
  @override
  double get totaldensity {
    double result = 0;
    for (var set in sets) {
      result += set.reps * (set.weight + bodyWeight * 0.25);
    }
    return result;
  }
}

class RussianTwist extends Training {
  RussianTwist({
    required super.bodyWeight,
    required super.sets,
    required super.date,
  }) : super(
          image: TrainingImages.russianTwist,
          targetedMuscles: [
            Core(traningsdensity: 0.8),
            Glutes(traningsdensity: 0.1),
            LowerBackMuscle(traningsdensity: 0.1),
          ],
          name: 'Russian Twist',
          mainTargetedMuscle: 'Core',
        );
  factory RussianTwist.standard() {
    return RussianTwist(
      bodyWeight: 80,
      sets: const [
        Sets(reps: 0, weight: 0),
        Sets(reps: 0, weight: 0),
        Sets(reps: 0, weight: 0),
      ],
      date: DateTime.now(),
    );
  }
  @override
  double get totaldensity {
    double result = 0;
    for (var set in sets) {
      result += set.reps * (set.weight + bodyWeight * 0.25);
    }
    return result;
  }
}

class BicycleCrunch extends Training {
  BicycleCrunch({
    required super.bodyWeight,
    required super.sets,
    required super.date,
  }) : super(
            image: TrainingImages.bicycleCrunch,
            targetedMuscles: [
              Core(traningsdensity: 0.75),
              LowerBackMuscle(traningsdensity: 0.1),
              Glutes(traningsdensity: 0.15),
            ],
            name: 'Bicycle Crunch',
            mainTargetedMuscle: 'Core');

  factory BicycleCrunch.standard() {
    return BicycleCrunch(
      bodyWeight: 80,
      sets: const [
        Sets(reps: 0, weight: 0),
        Sets(reps: 0, weight: 0),
        Sets(reps: 0, weight: 0),
      ],
      date: DateTime.now(),
    );
  }

  @override
  double get totaldensity {
    double result = 0;
    for (var set in sets) {
      result += set.reps * (set.weight + bodyWeight * 0.25);
    }
    return result;
  }
}

class MountainClimber extends Training {
  MountainClimber({
    required super.bodyWeight,
    required super.sets,
    required super.date,
  }) : super(
          image: TrainingImages.mountainClimber,
          targetedMuscles: [
            Core(traningsdensity: 0.6),
            Glutes(traningsdensity: 0.2),
            LowerBackMuscle(traningsdensity: 0.1),
            FrontShoulderMuscle(traningsdensity: 0.05),
            MiddleChestMuscle(traningsdensity: 0.05),
          ],
          name: 'Mountain Climber',
          mainTargetedMuscle: 'Core',
        );

  factory MountainClimber.standard() {
    return MountainClimber(
      bodyWeight: 80,
      sets: const [
        Sets(reps: 0, weight: 0),
        Sets(reps: 0, weight: 0),
        Sets(reps: 0, weight: 0),
      ],
      date: DateTime.now(),
    );
  }

  @override
  double get totaldensity {
    double result = 0;
    for (var set in sets) {
      result += set.reps * (set.weight + bodyWeight * 0.5);
    }
    return result;
  }
}
