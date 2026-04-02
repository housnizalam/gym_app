import 'package:gym_app/models/muscle.dart';
import 'package:gym_app/models/sets.dart';
import 'package:gym_app/models/training_images.dart';
import 'package:gym_app/models/trainings/training.dart';

class CloseGripBenchPress extends Training {
  CloseGripBenchPress({
    required super.sets,
    required super.date,
  }) : super(
          image: TrainingImages.closeGripBenchPress,
          bodyWeight: 0,
          targetedMuscles: [
            TricepMuscle(traningsdensity: 0.6),
            FrontShoulderMuscle(traningsdensity: 0.2),
            UpperChestMuscle(traningsdensity: 0.1),
            Core(traningsdensity: 0.1),
          ],
          name: 'Close Grip Bench Press',
          mainTargetedMuscle: 'Shoulder',
        );

  factory CloseGripBenchPress.standard() {
    return CloseGripBenchPress(
      sets: const [
        Sets(reps: 0, weight: 15),
        Sets(reps: 0, weight: 15),
        Sets(reps: 0, weight: 15),
      ],
      date: DateTime.now(),
    );
  }
}

class SkullCrusher extends Training {
  SkullCrusher({
    required super.sets,
    required super.date,
  }) : super(
            image: TrainingImages.skullCrusher,
            bodyWeight: 0,
            targetedMuscles: [
              TricepMuscle(traningsdensity: 0.6),
              FrontShoulderMuscle(traningsdensity: 0.2),
              UpperChestMuscle(traningsdensity: 0.1),
              Core(traningsdensity: 0.1),
            ],
            name: 'Skull Crusher',
            mainTargetedMuscle: 'Triceps');

  factory SkullCrusher.standard() {
    return SkullCrusher(
      sets: const [
        Sets(reps: 0, weight: 7.5),
        Sets(reps: 0, weight: 7.5),
        Sets(reps: 0, weight: 7.5),
      ],
      date: DateTime.now(),
    );
  }
}

class TricepPushdown extends Training {
  TricepPushdown({
    required super.sets,
    required super.date,
  }) : super(
          image: TrainingImages.tricepsPushdown,
          bodyWeight: 0,
          targetedMuscles: [
            TricepMuscle(traningsdensity: 0.8),
            ForArm(traningsdensity: 0.1),
            FrontShoulderMuscle(traningsdensity: 0.1),
          ],
          name: 'Tricep Pushdown',
          mainTargetedMuscle: 'Triceps',
        );

  factory TricepPushdown.standard() {
    return TricepPushdown(
      sets: const [
        Sets(reps: 0, weight: 40),
        Sets(reps: 0, weight: 40),
        Sets(reps: 0, weight: 40),
      ],
      date: DateTime.now(),
    );
  }
}

class OverheadTricepExtension extends Training {
  OverheadTricepExtension({
    required super.sets,
    required super.date,
  }) : super(
          image: TrainingImages.tricepsOverheadExtension,
          bodyWeight: 0,
          targetedMuscles: [
            TricepMuscle(traningsdensity: 0.8),
            ForArm(traningsdensity: 0.1),
            FrontShoulderMuscle(traningsdensity: 0.1),
          ],
          name: 'Overhead Tricep Extension',
          mainTargetedMuscle: 'Triceps',
        );

  factory OverheadTricepExtension.standard() {
    return OverheadTricepExtension(
      sets: const [
        Sets(reps: 0, weight: 20),
        Sets(reps: 0, weight: 20),
        Sets(reps: 0, weight: 20),
      ],
      date: DateTime.now(),
    );
  }
}

class TricepKickback extends Training {
  TricepKickback({
    required super.sets,
    required super.date,
  }) : super(
          image: TrainingImages.kickBack,
          bodyWeight: 0,
          targetedMuscles: [
            TricepMuscle(traningsdensity: 0.85),
            RearShoulderMuscle(traningsdensity: 0.1),
            ForArm(traningsdensity: 0.05),
          ],
          name: 'Tricep Kickback',
          mainTargetedMuscle: 'Triceps',
        );

  factory TricepKickback.standard() {
    return TricepKickback(
      sets: const [
        Sets(reps: 0, weight: 20),
        Sets(reps: 0, weight: 20),
        Sets(reps: 0, weight: 20),
      ],
      date: DateTime.now(),
    );
  }
}
