import 'package:gym_app/models/muscle.dart';
import 'package:gym_app/models/sets.dart';
import 'package:gym_app/models/trainings/training.dart';

class ReverseCurl extends Training {
  ReverseCurl({
    required super.sets,
    required super.date,
  }) : super(
          bodyWeight: 0,
          targetetMuscles: [
            ForArm(traningsdensity: 0.6),
            BicepsMuscle(traningsdensity: 0.3),
            FrontShoulderMuscle(traningsdensity: 0.05),
          ],
          name: 'Reverse Curl',
          maintargetetMuscle: 'For Arm',
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
          bodyWeight: 0,
          targetetMuscles: [
            ForArm(traningsdensity: 0.9),
            BicepsMuscle(traningsdensity: 0.1),
          ],
          name: 'Wrist Curl',
          maintargetetMuscle: 'For Arm',
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
          bodyWeight: 0,
          targetetMuscles: [
            ForArm(traningsdensity: 0.9),
            BicepsMuscle(traningsdensity: 0.1),
          ],
          name: 'Reverse Wrist Curl',
          maintargetetMuscle: 'For Arm',
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
