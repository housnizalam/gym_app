import 'package:gym_app/models/muscle.dart';
import 'package:gym_app/models/sets.dart';
import 'package:gym_app/models/training_images.dart';
import 'package:gym_app/models/trainings/training.dart';

class PullUps extends Training {
  PullUps({
    required super.sets,
    required super.date,
    required super.bodyWeight,
  }) : super(
          image: TrainingImages.pullUps,
          targetetMuscles: [
            Lats(traningsdensity: 0.45),
            BicepsMuscle(traningsdensity: 0.2),
            MiddleBackMuscle(traningsdensity: 0.15),
            RearShoulderMuscle(traningsdensity: 0.1),
            ForArm(traningsdensity: 0.1),
          ],
          name: 'Pull Ups',
          maintargetetMuscle: 'Back',
        );

  factory PullUps.standard() {
    return PullUps(
      bodyWeight: 80,
      sets: const [
        Sets(reps: 0, weight: 0),
        Sets(reps: 0, weight: 0),
        Sets(reps: 0, weight: 0),
      ],
      date: DateTime.now(),
    );
  }
}

class ChinUps extends Training {
  ChinUps({
    required super.bodyWeight,
    required super.sets,
    required super.date,
  }) : super(
          image: TrainingImages.chinUps,
          targetetMuscles: [
            Lats(traningsdensity: 0.35),
            BicepsMuscle(traningsdensity: 0.3),
            MiddleBackMuscle(traningsdensity: 0.15),
            ForArm(traningsdensity: 0.1),
            Core(traningsdensity: 0.1)
          ],
          name: 'Chin Ups',
          maintargetetMuscle: 'Back',
        );

  factory ChinUps.standard() {
    return ChinUps(
      bodyWeight: 80,
      sets: const [
        Sets(reps: 0, weight: 0),
        Sets(reps: 0, weight: 0),
        Sets(reps: 0, weight: 0),
      ],
      date: DateTime.now(),
    );
  }
}

class LatPulldown extends Training {
  LatPulldown({
    required super.sets,
    required super.date,
  }) : super(
          image: TrainingImages.latPulldown,
          bodyWeight: 0,
          targetetMuscles: [
            Lats(traningsdensity: 0.5),
            MiddleBackMuscle(traningsdensity: 0.2),
            BicepsMuscle(traningsdensity: 0.15),
            RearShoulderMuscle(traningsdensity: 0.1),
            ForArm(traningsdensity: 0.05),
          ],
          name: 'Lat Pulldown',
          maintargetetMuscle: 'Back',
        );

  factory LatPulldown.standard() {
    return LatPulldown(
      sets: const [
        Sets(reps: 0, weight: 40),
        Sets(reps: 0, weight: 40),
        Sets(reps: 0, weight: 40),
      ],
      date: DateTime.now(),
    );
  }
}

class SeatedRow extends Training {
  SeatedRow({
    required super.sets,
    required super.date,
  }) : super(
          image: TrainingImages.seatedRow,
          bodyWeight: 0,
          targetetMuscles: [
            Lats(traningsdensity: 0.3),
            MiddleBackMuscle(traningsdensity: 0.25),
            BicepsMuscle(traningsdensity: 0.15),
            RearShoulderMuscle(traningsdensity: 0.15),
            ForArm(traningsdensity: 0.1),
            Core(traningsdensity: 0.05),
          ],
          name: 'Seated Row',
          maintargetetMuscle: 'Back',
        );

  factory SeatedRow.standard() {
    return SeatedRow(
      sets: const [
        Sets(reps: 0, weight: 40),
        Sets(reps: 0, weight: 40),
        Sets(reps: 0, weight: 40),
      ],
      date: DateTime.now(),
    );
  }
}

class BentOverRow extends Training {
  BentOverRow({
    required super.sets,
    required super.date,
  }) : super(
          image: TrainingImages.bentOverRow,
          bodyWeight: 0,
          targetetMuscles: [
            Lats(traningsdensity: 0.35),
            MiddleBackMuscle(traningsdensity: 0.25),
            BicepsMuscle(traningsdensity: 0.15),
            RearShoulderMuscle(traningsdensity: 0.15),
            ForArm(traningsdensity: 0.05),
            Core(traningsdensity: 0.05),
          ],
          name: 'Bent Over Row',
          maintargetetMuscle: 'Back',
        );

  factory BentOverRow.standard() {
    return BentOverRow(
      sets: const [
        Sets(reps: 0, weight: 20),
        Sets(reps: 0, weight: 20),
        Sets(reps: 0, weight: 20),
      ],
      date: DateTime.now(),
    );
  }
}

class TBarRow extends Training {
  TBarRow({
    required super.sets,
    required super.date,
  }) : super(
          image: TrainingImages.tBarRow,
          bodyWeight: 0,
          targetetMuscles: [
            Lats(traningsdensity: 0.4),
            MiddleBackMuscle(traningsdensity: 0.25),
            RearShoulderMuscle(traningsdensity: 0.15),
            BicepsMuscle(traningsdensity: 0.1),
            ForArm(traningsdensity: 0.05),
            Core(traningsdensity: 0.05),
          ],
          name: 'T Bar Row',
          maintargetetMuscle: 'Back',
        );

  factory TBarRow.standard() {
    return TBarRow(
      sets: const [
        Sets(reps: 0, weight: 20),
        Sets(reps: 0, weight: 20),
        Sets(reps: 0, weight: 20),
      ],
      date: DateTime.now(),
    );
  }
}

class Shrugs extends Training {
  Shrugs({
    required super.sets,
    required super.date,
  }) : super(
          image: TrainingImages.shrugs,
          bodyWeight: 0,
          targetetMuscles: [
            UpperBackMuscle(traningsdensity: 0.7),
            RearShoulderMuscle(traningsdensity: 0.2),
            ForArm(traningsdensity: 0.1),
          ],
          name: 'Shrugs',
          maintargetetMuscle: 'Back',
        );

  factory Shrugs.standard() {
    return Shrugs(
      sets: const [
        Sets(reps: 0, weight: 20),
        Sets(reps: 0, weight: 20),
        Sets(reps: 0, weight: 20),
      ],
      date: DateTime.now(),
    );
  }
}
