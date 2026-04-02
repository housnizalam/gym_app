import 'package:gym_app/models/muscle.dart';
import 'package:gym_app/models/sets.dart';
import 'package:gym_app/models/training_images.dart';
import 'package:gym_app/models/trainings/training.dart';

class ReverseCurl extends Training {
  ReverseCurl({
    required super.sets,
    required super.date,
  }) : super(
          image: TrainingImages.reverseCurl,
          bodyWeight: 0,
          targetedMuscles: [
            ForArm(traningsdensity: 0.6),
            BicepsMuscle(traningsdensity: 0.3),
            FrontShoulderMuscle(traningsdensity: 0.05),
          ],
          name: 'Reverse Curl',
          mainTargetedMuscle: 'For Arm',
        );

  factory ReverseCurl.standard() {
    return ReverseCurl(
      sets: const [
        Sets(reps: 0, weight: 10),
        Sets(reps: 0, weight: 10),
        Sets(reps: 0, weight: 10),
      ],
      date: DateTime.now(),
    );
  }
}

class WristCurl extends Training {
  WristCurl({
    required super.sets,
    required super.date,
  }) : super(
          image: TrainingImages.wristCurl,
          bodyWeight: 0,
          targetedMuscles: [
            ForArm(traningsdensity: 0.9),
            BicepsMuscle(traningsdensity: 0.1),
          ],
          name: 'Wrist Curl',
          mainTargetedMuscle: 'For Arm',
        );

  factory WristCurl.standard() {
    return WristCurl(
      sets: const [
        Sets(reps: 0, weight: 10),
        Sets(reps: 0, weight: 10),
        Sets(reps: 0, weight: 10),
      ],
      date: DateTime.now(),
    );
  }
}

class ReverseWristCurl extends Training {
  ReverseWristCurl({
    required super.sets,
    required super.date,
  }) : super(
          image: TrainingImages.reverseWristCurl,
          bodyWeight: 0,
          targetedMuscles: [
            ForArm(traningsdensity: 0.9),
            BicepsMuscle(traningsdensity: 0.1),
          ],
          name: 'Reverse Wrist Curl',
          mainTargetedMuscle: 'For Arm',
        );

  factory ReverseWristCurl.standard() {
    return ReverseWristCurl(
      sets: const [
        Sets(reps: 0, weight: 10),
        Sets(reps: 0, weight: 10),
        Sets(reps: 0, weight: 10),
      ],
      date: DateTime.now(),
    );
  }
}
