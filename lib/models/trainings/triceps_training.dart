import 'package:gym_app/models/muscle.dart';
import 'package:gym_app/models/sets.dart';
import 'package:gym_app/models/trainings/training.dart';

class CloseGripBenchPress extends Training {
  CloseGripBenchPress({
    required super.sets,
    required super.date,
  }) : super(
          bodyWeight: 0,
          targetetMuscles: [
            TricepMuscle(traningsdensity: 0.6),
            FrontShoulderMuscle(traningsdensity: 0.2),
            UpperChestMuscle(traningsdensity: 0.1),
            Core(traningsdensity: 0.1),
          ],
          name: 'Close Grip Bench Press',
          maintargetetMuscle: 'Shoulder',
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
            bodyWeight: 0,
            targetetMuscles: [
              TricepMuscle(traningsdensity: 0.6),
              FrontShoulderMuscle(traningsdensity: 0.2),
              UpperChestMuscle(traningsdensity: 0.1),
              Core(traningsdensity: 0.1),
            ],
            name: 'Skull Crusher',
            maintargetetMuscle: 'Triceps');

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
          bodyWeight: 0,
          targetetMuscles: [
            TricepMuscle(traningsdensity: 0.8),
            ForArm(traningsdensity: 0.1),
            FrontShoulderMuscle(traningsdensity: 0.1),
          ],
          name: 'Tricep Pushdown',
          maintargetetMuscle: 'Triceps',
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

class TricepExtension extends Training {
  TricepExtension({
    required super.sets,
    required super.date,
  }) : super(
          bodyWeight: 0,
          targetetMuscles: [
            TricepMuscle(traningsdensity: 0.85),
            FrontShoulderMuscle(traningsdensity: 0.1),
            ForArm(traningsdensity: 0.05),
          ],
          name: 'Tricep Extension',
          maintargetetMuscle: 'Triceps',
        );

  factory TricepExtension.standard() {
    return TricepExtension(
      sets: const [
        Sets(reps: 0, weight: 20),
        Sets(reps: 0, weight: 20),
        Sets(reps: 0, weight: 20),
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
          bodyWeight: 0,
          targetetMuscles: [
            TricepMuscle(traningsdensity: 0.8),
            ForArm(traningsdensity: 0.1),
            FrontShoulderMuscle(traningsdensity: 0.1),
          ],
          name: 'Overhead Tricep Extension',
          maintargetetMuscle: 'Triceps',
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
          bodyWeight: 0,
          targetetMuscles: [
            TricepMuscle(traningsdensity: 0.85),
            RearShoulderMuscle(traningsdensity: 0.1),
            ForArm(traningsdensity: 0.05),
          ],
          name: 'Tricep Kickback',
          maintargetetMuscle: 'Triceps',
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
