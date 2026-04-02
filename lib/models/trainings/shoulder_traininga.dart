import 'package:gym_app/models/muscle.dart';
import 'package:gym_app/models/sets.dart';
import 'package:gym_app/models/training_images.dart';
import 'package:gym_app/models/trainings/training.dart';

class FacePull extends Training {
  FacePull({
    required super.sets,
    required super.date,
  }) : super(
          image: TrainingImages.facePull,
          bodyWeight: 0,
          targetedMuscles: [
            RearShoulderMuscle(traningsdensity: 0.4),
            UpperBackMuscle(traningsdensity: 0.3),
            SideShoulderMuscle(traningsdensity: 0.15),
            Core(traningsdensity: 0.1),
            BicepsMuscle(traningsdensity: 0.05),
          ],
          name: 'Face Pull',
          mainTargetedMuscle: 'Shoulder',
        );

  factory FacePull.standard() {
    return FacePull(
      sets: const [
        Sets(reps: 0, weight: 20),
        Sets(reps: 0, weight: 20),
        Sets(reps: 0, weight: 20),
      ],
      date: DateTime.now(),
    );
  }
}

class MilitaryPress extends Training {
  MilitaryPress({
    required super.sets,
    required super.date,
  }) : super(
          image: TrainingImages.militaryPress,
          bodyWeight: 0,
          targetedMuscles: [
            FrontShoulderMuscle(traningsdensity: 0.4),
            SideShoulderMuscle(traningsdensity: 0.2),
            UpperBackMuscle(traningsdensity: 0.15),
            TricepMuscle(traningsdensity: 0.15),
            Core(traningsdensity: 0.1),
          ],
          name: 'Military Press',
          mainTargetedMuscle: 'Shoulder',
        );

  factory MilitaryPress.standard() {
    return MilitaryPress(
      sets: const [
        Sets(reps: 0, weight: 20),
        Sets(reps: 0, weight: 20),
        Sets(reps: 0, weight: 20),
      ],
      date: DateTime.now(),
    );
  }
}

class ArnoldPress extends Training {
  ArnoldPress({
    required super.sets,
    required super.date,
  }) : super(
          image: TrainingImages.arnoldPress,
          bodyWeight: 0,
          targetedMuscles: [
            FrontShoulderMuscle(traningsdensity: 0.35),
            SideShoulderMuscle(traningsdensity: 0.25),
            TricepMuscle(traningsdensity: 0.15),
            RearShoulderMuscle(traningsdensity: 0.1),
            UpperBackMuscle(traningsdensity: 0.1),
            Core(traningsdensity: 0.05),
          ],
          name: 'Arnold Press',
          mainTargetedMuscle: 'Shoulder',
        );

  factory ArnoldPress.standard() {
    return ArnoldPress(
      sets: const [
        Sets(reps: 0, weight: 20),
        Sets(reps: 0, weight: 20),
        Sets(reps: 0, weight: 20),
      ],
      date: DateTime.now(),
    );
  }
}

class LateralRaise extends Training {
  LateralRaise({
    required super.sets,
    required super.date,
  }) : super(
          image: TrainingImages.lateralRaise,
          bodyWeight: 0,
          targetedMuscles: [
            SideShoulderMuscle(traningsdensity: 0.7),
            FrontShoulderMuscle(traningsdensity: 0.1),
            RearShoulderMuscle(traningsdensity: 0.1),
            Core(traningsdensity: 0.05),
          ],
          name: 'Lateral Raise',
          mainTargetedMuscle: 'Shoulder',
        );

  factory LateralRaise.standard() {
    return LateralRaise(
      sets: const [
        Sets(reps: 0, weight: 20),
        Sets(reps: 0, weight: 20),
        Sets(reps: 0, weight: 20),
      ],
      date: DateTime.now(),
    );
  }
}

class FrontRaise extends Training {
  FrontRaise({
    required super.sets,
    required super.date,
  }) : super(
          image: TrainingImages.frontRaise,
          bodyWeight: 0,
          targetedMuscles: [
            FrontShoulderMuscle(traningsdensity: 0.7),
            SideShoulderMuscle(traningsdensity: 0.1),
            UpperChestMuscle(traningsdensity: 0.1),
            Core(traningsdensity: 0.1),
          ],
          name: 'Front Raise',
          mainTargetedMuscle: 'Shoulder',
        );

  factory FrontRaise.standard() {
    return FrontRaise(
      sets: const [
        Sets(reps: 0, weight: 20),
        Sets(reps: 0, weight: 20),
        Sets(reps: 0, weight: 20),
      ],
      date: DateTime.now(),
    );
  }
}

class RearDeltFly extends Training {
  RearDeltFly({
    required super.sets,
    required super.date,
  }) : super(
          image: TrainingImages.rearDeltFly,
          bodyWeight: 0,
          targetedMuscles: [
            RearShoulderMuscle(traningsdensity: 0.6),
            UpperBackMuscle(traningsdensity: 0.2),
            SideShoulderMuscle(traningsdensity: 0.1),
            Core(traningsdensity: 0.1),
          ],
          name: 'Rear Delt Fly',
          mainTargetedMuscle: 'Shoulder',
        );

  factory RearDeltFly.standard() {
    return RearDeltFly(
      sets: const [
        Sets(reps: 0, weight: 20),
        Sets(reps: 0, weight: 20),
        Sets(reps: 0, weight: 20),
      ],
      date: DateTime.now(),
    );
  }
}

class UprightRow extends Training {
  UprightRow({
    required super.sets,
    required super.date,
  }) : super(
          image: TrainingImages.uprightRow,
          bodyWeight: 0,
          targetedMuscles: [
            SideShoulderMuscle(traningsdensity: 0.4),
            UpperBackMuscle(traningsdensity: 0.35),
            FrontShoulderMuscle(traningsdensity: 0.15),
            BicepsMuscle(traningsdensity: 0.1),
          ],
          name: 'Upright Row',
          mainTargetedMuscle: 'Shoulder',
        );

  factory UprightRow.standard() {
    return UprightRow(
      sets: const [
        Sets(reps: 0, weight: 20),
        Sets(reps: 0, weight: 20),
        Sets(reps: 0, weight: 20),
      ],
      date: DateTime.now(),
    );
  }
}
