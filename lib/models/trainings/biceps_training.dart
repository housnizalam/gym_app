import 'package:gym_app/models/muscle.dart';
import 'package:gym_app/models/sets.dart';
import 'package:gym_app/models/training_images.dart';
import 'package:gym_app/models/trainings/training.dart';

class BarbellCurl extends Training {
  BarbellCurl({
    required super.sets,
    required super.date,
  }) : super(
    image: TrainingImages.barbellCurl,
          bodyWeight: 0,
          targetetMuscles: [
            BicepsMuscle(traningsdensity: 0.7),
            ForArm(traningsdensity: 0.15),
            Core(traningsdensity: 0.1),
            FrontShoulderMuscle(traningsdensity: 0.05),
          ],
          name: 'Barbell Curl',
          maintargetetMuscle: 'Biceps',
        );

  factory BarbellCurl.standard() {
    return BarbellCurl(
      sets: const [
        Sets(reps: 0, weight: 10),
        Sets(reps: 0, weight: 10),
        Sets(reps: 0, weight: 10),
      ],
      date: DateTime.now(),
    );
  }
}

class DumbbellCurl extends Training {
  DumbbellCurl({
    required super.sets,
    required super.date,
  }) : super(
    image: TrainingImages.dumbbellCurl,
          bodyWeight: 0,
          targetetMuscles: [
            BicepsMuscle(traningsdensity: 0.75),
            ForArm(traningsdensity: 0.1),
            Core(traningsdensity: 0.1),
            FrontShoulderMuscle(traningsdensity: 0.05),
          ],
          name: 'Dumbbell Curl',
          maintargetetMuscle: 'Biceps',
        );

  factory DumbbellCurl.standard() {
    return DumbbellCurl(
      sets: const [
        Sets(reps: 0, weight: 10),
        Sets(reps: 0, weight: 10),
        Sets(reps: 0, weight: 10),
      ],
      date: DateTime.now(),
    );
  }
}

class PreacherCurl extends Training {
  PreacherCurl({
    required super.sets,
    required super.date,
  }) : super(
    image: TrainingImages.preacherCurl,
          bodyWeight: 0,
          targetetMuscles: [
            BicepsMuscle(traningsdensity: 0.85),
            ForArm(traningsdensity: 0.1),
            FrontShoulderMuscle(traningsdensity: 0.05),
          ],
          name: 'Preacher Curl',
          maintargetetMuscle: 'Biceps',
        );

  factory PreacherCurl.standard() {
    return PreacherCurl(
      sets: const [
        Sets(reps: 0, weight: 10),
        Sets(reps: 0, weight: 10),
        Sets(reps: 0, weight: 10),
      ],
      date: DateTime.now(),
    );
  }
}

class HammerCurl extends Training {
  HammerCurl({
    required super.sets,
    required super.date,
  }) : super(
    image: TrainingImages.hammerCurl,
          bodyWeight: 0,
          targetetMuscles: [
            BicepsMuscle(traningsdensity: 0.6),
            ForArm(traningsdensity: 0.35),
            FrontShoulderMuscle(traningsdensity: 0.05),
          ],
          name: 'Hammer Curl',
          maintargetetMuscle: 'Biceps',
        );

  factory HammerCurl.standard() {
    return HammerCurl(
      sets: const [
        Sets(reps: 0, weight: 10),
        Sets(reps: 0, weight: 10),
        Sets(reps: 0, weight: 10),
      ],
      date: DateTime.now(),
    );
  }
}

class ConcentrationCurl extends Training {
  ConcentrationCurl({
    required super.sets,
    required super.date,
  }) : super(
    image: TrainingImages.concentrationCurl,
          bodyWeight: 0,
          targetetMuscles: [
            BicepsMuscle(traningsdensity: 0.9),
            ForArm(traningsdensity: 0.1),
          ],
          name: 'Concentration Curl',
          maintargetetMuscle: 'Biceps',
        );

  factory ConcentrationCurl.standard() {
    return ConcentrationCurl(
      sets: const [
        Sets(reps: 0, weight: 10),
        Sets(reps: 0, weight: 10),
        Sets(reps: 0, weight: 10),
      ],
      date: DateTime.now(),
    );
  }
}

class ZottmanCurl extends Training {
  ZottmanCurl({
    required super.sets,
    required super.date,
  }) : super(
    image: TrainingImages.zottmanCurl,
          bodyWeight: 0,
          targetetMuscles: [
            BicepsMuscle(traningsdensity: 0.6),
            ForArm(traningsdensity: 0.4),
          ],
          name: 'Zottman Curl',
          maintargetetMuscle: 'For Arm',
        );

  factory ZottmanCurl.standard() {
    return ZottmanCurl(
      sets: const [
        Sets(reps: 0, weight: 10),
        Sets(reps: 0, weight: 10),
        Sets(reps: 0, weight: 10),
      ],
      date: DateTime.now(),
    );
  }
}
