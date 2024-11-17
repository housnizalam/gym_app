import 'package:gym_app/models/muscle.dart';
import 'package:gym_app/models/sets.dart';
import 'package:gym_app/models/training_images.dart';
import 'package:gym_app/models/trainings/training.dart';

class BenshPressSubTraining extends Training {
  BenshPressSubTraining({
    required super.sets,
    required super.date,
  }) : super(
          image: TrainingImages.benchPress,
          bodyWeight: 0,
          targetetMuscles: [
            UpperChestMuscle(traningsdensity: 0.5),
            LowerChestMuscle(traningsdensity: 0.15),
            TricepMuscle(traningsdensity: 0.15),
            FrontShoulderMuscle(traningsdensity: 0.2),
          ],
          name: 'Bench Press',
          maintargetetMuscle: 'Chest',
        );

  factory BenshPressSubTraining.standard() {
    return BenshPressSubTraining(
      sets: const [
        Sets(reps: 0, weight: 30),
        Sets(reps: 0, weight: 30),
        Sets(reps: 0, weight: 30),
      ],
      date: DateTime.now(),
    );
  }
}

class InclineBenchPress extends Training {
  InclineBenchPress({
    required super.sets,
    required super.date,
  }) : super(
          image: TrainingImages.inclineBenchPress,
          bodyWeight: 0,
          targetetMuscles: [
            UpperChestMuscle(traningsdensity: 0.5),
            LowerChestMuscle(traningsdensity: 0.15),
            TricepMuscle(traningsdensity: 015),
            FrontShoulderMuscle(traningsdensity: 0.2)
          ],
          name: 'Incline Bench Press',
          maintargetetMuscle: 'Chest',
        );

  factory InclineBenchPress.standard() {
    return InclineBenchPress(
      sets: const [
        Sets(reps: 0, weight: 20),
        Sets(reps: 0, weight: 20),
        Sets(reps: 0, weight: 20),
      ],
      date: DateTime.now(),
    );
  }
}

class DeclineBenchPress extends Training {
  DeclineBenchPress({
    required super.sets,
    required super.date,
  }) : super(
          image: TrainingImages.declineBenchPress,
          bodyWeight: 0,
          targetetMuscles: [
            LowerChestMuscle(traningsdensity: 0.5),
            MiddleBackMuscle(traningsdensity: 0.25),
            TricepMuscle(traningsdensity: 0.15),
            FrontShoulderMuscle(traningsdensity: 0.1)
          ],
          name: 'Decline Bench Press',
          maintargetetMuscle: 'Chest',
        );

  factory DeclineBenchPress.standard() {
    return DeclineBenchPress(
      sets: const [
        Sets(reps: 0, weight: 20),
        Sets(reps: 0, weight: 20),
        Sets(reps: 0, weight: 20),
      ],
      date: DateTime.now(),
    );
  }
}

class DumbbellFly extends Training {
  DumbbellFly({
    required super.sets,
    required super.date,
  }) : super(
          image: TrainingImages.dumbbellFly,
          bodyWeight: 0,
          targetetMuscles: [
            MiddleBackMuscle(traningsdensity: 0.6),
            UpperBackMuscle(traningsdensity: 0.25),
            FrontShoulderMuscle(traningsdensity: 0.15),
          ],
          name: 'Dumbbell Fly',
          maintargetetMuscle: 'Chest',
        );

  factory DumbbellFly.standard() {
    return DumbbellFly(
      sets: const [
        Sets(reps: 0, weight: 10),
        Sets(reps: 0, weight: 10),
        Sets(reps: 0, weight: 10),
      ],
      date: DateTime.now(),
    );
  }
}

class CableFly extends Training {
  CableFly({
    required super.sets,
    required super.date,
  }) : super(
          image: TrainingImages.cableFly,
          bodyWeight: 0,
          targetetMuscles: [
            MiddleBackMuscle(traningsdensity: 0.5),
            UpperBackMuscle(traningsdensity: 0.25),
            LowerBackMuscle(traningsdensity: 0.15),
            FrontShoulderMuscle(traningsdensity: 0.15),
          ],
          name: 'Cable Fly',
          maintargetetMuscle: 'Chest',
        );

  factory CableFly.standard() {
    return CableFly(
      sets: const [
        Sets(reps: 0, weight: 20),
        Sets(reps: 0, weight: 20),
        Sets(reps: 0, weight: 20),
      ],
      date: DateTime.now(),
    );
  }
}

class Dips extends Training {
  Dips({
    required super.sets,
    required super.date,
  }) : super(
          image: TrainingImages.dips,
          bodyWeight: 80,
          targetetMuscles: [
            LowerChestMuscle(traningsdensity: 0.5),
            TricepMuscle(traningsdensity: 0.3),
            FrontShoulderMuscle(traningsdensity: 0.2),
          ],
          name: 'Dips',
          maintargetetMuscle: 'Chest',
        );

  factory Dips.standard() {
    return Dips(
      sets: const [
        Sets(reps: 0, weight: 0),
        Sets(reps: 0, weight: 0),
        Sets(reps: 0, weight: 0),
      ],
      date: DateTime.now(),
    );
  }
}
