import 'package:gym_app/models/muscle.dart';
import 'package:gym_app/models/sets.dart';
import 'package:gym_app/models/training_images.dart';
import 'package:gym_app/models/trainings/training.dart';

class Deadlift extends Training {
  Deadlift({
    required super.bodyWeight,
    required super.sets,
    required super.date,
  }) : super(
    image: TrainingImages.deadlift,
        
    targetetMuscles: [
          LowerBackMuscle(traningsdensity: 0.25),
          Glutes(traningsdensity: 0.2),
          Hamstring(traningsdensity: 0.2),
          Quads(traningsdensity: 0.15),
          UpperBackMuscle(traningsdensity: 10),
          ForArm(traningsdensity: 0.05),
          Core(traningsdensity: 0.05),
        ], name: 'Deadlift', maintargetetMuscle: 'Legs');

  factory Deadlift.standard() {
    return Deadlift(
      bodyWeight: 80,
      sets: const [
        Sets(reps: 0, weight: 30),
        Sets(reps: 0, weight: 30),
        Sets(reps: 0, weight: 30),
      ],
      date: DateTime.now(),
    );
  }
}

class Squat extends Training {
  Squat({
    required super.bodyWeight,
    required super.sets,
    required super.date,
  }) : super(
    
    image: TrainingImages.squat,
    targetetMuscles: [
          Quads(traningsdensity: 0.35),
          Glutes(traningsdensity: 0.25),
          Hamstring(traningsdensity: 0.15),
          LowerBackMuscle(traningsdensity: 0.1),
          Calves(traningsdensity: 0.1),
          Core(traningsdensity: 0.05),
        ], name: 'Squat', maintargetetMuscle: 'Legs');

  factory Squat.standard() {
    return Squat(
      bodyWeight: 80,
      sets: const [
        Sets(reps: 0, weight: 30),
        Sets(reps: 0, weight: 30),
        Sets(reps: 0, weight: 30),
      ],
      date: DateTime.now(),
    );
  }
}

class LegPress extends Training {
  LegPress({
    required super.sets,
    required super.date,
  }) : super(
    image: TrainingImages.legPress,
            bodyWeight: 0,
            targetetMuscles: [
              Quads(traningsdensity: 0.4),
              Glutes(traningsdensity: 0.25),
              Hamstring(traningsdensity: 0.2),
              Calves(traningsdensity: 0.15),
            ],
            name: 'Leg Press',
            maintargetetMuscle: 'Legs');

  factory LegPress.standard() {
    return LegPress(
      sets: const [
        Sets(reps: 0, weight: 40),
        Sets(reps: 0, weight: 40),
        Sets(reps: 0, weight: 40),
      ],
      date: DateTime.now(),
    );
  }
}

class Lunges extends Training {
  Lunges({
    required super.bodyWeight,
    required super.sets,
    required super.date,
  }) : super(
    image: TrainingImages.lunges,
    targetetMuscles: [
          Quads(traningsdensity: 0.4),
          Glutes(traningsdensity: 0.25),
          Hamstring(traningsdensity: 0.2),
          Calves(traningsdensity: 0.1),
          Core(traningsdensity: 0.05),
        ], name: 'Lunges', maintargetetMuscle: 'Legs');

  factory Lunges.standard() {
    return Lunges(
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
      result += set.reps * (set.weight + bodyWeight * 1.5);
    }
    return result;
  }
}

class FrontLegExtension extends Training {
  FrontLegExtension({
    required super.sets,
    required super.date,
  }) : super(
    image: TrainingImages.frontLegExtension,
            bodyWeight: 0,
            targetetMuscles: [
              Quads(traningsdensity: 0.85),
              Glutes(traningsdensity: 0.15),
            ],
            name: 'Front leg extension',
            maintargetetMuscle: 'Legs');

  factory FrontLegExtension.standard() {
    return FrontLegExtension(
      sets: const [
        Sets(reps: 0, weight: 40),
        Sets(reps: 0, weight: 40),
        Sets(reps: 0, weight: 40),
      ],
      date: DateTime.now(),
    );
  }
}

class BackLegExtension extends Training {
  BackLegExtension({
    required super.sets,
    required super.date,
  }) : super(
    image: TrainingImages.backLegExtension,
            bodyWeight: 0,
            targetetMuscles: [
              Hamstring(traningsdensity: 0.6),
              Glutes(traningsdensity: 0.3),
              LowerBackMuscle(traningsdensity: 0.1),
            ],
            name: 'Back leg extension',
            maintargetetMuscle: 'Legs');

  factory BackLegExtension.standard() {
    return BackLegExtension(
      sets: const [
        Sets(reps: 0, weight: 20),
        Sets(reps: 0, weight: 20),
        Sets(reps: 0, weight: 20),
      ],
      date: DateTime.now(),
    );
  }
}

class CalfRaise extends Training {
  CalfRaise({
    required super.bodyWeight,
    required super.sets,
    required super.date,
  }) : super(
    image: TrainingImages.calfRaise,
    targetetMuscles: [
          Calves(traningsdensity: 0.9),
          Hamstring(traningsdensity: 0.1),
        ], name: 'Calf Raise', maintargetetMuscle: 'Legs');

  factory CalfRaise.standard() {
    return CalfRaise(
      bodyWeight: 80,
      sets: const [
        Sets(reps: 0, weight: 30),
        Sets(reps: 0, weight: 30),
        Sets(reps: 0, weight: 30),
      ],
      date: DateTime.now(),
    );
  }
}
