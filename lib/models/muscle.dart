abstract class Muscle {
  String name;
  double traningsdensity;
  double recoveryDuration;
  DateTime? lastTrained;
  Muscle({
    required this.name,
    required this.traningsdensity,
    required this.recoveryDuration,
     this.lastTrained,
  });
}

class ChestMuscle extends Muscle {
  ChestMuscle({
    required super.traningsdensity,
    required super.recoveryDuration,
     super.lastTrained,
  }) : super(name: 'Chest');
}

class BackMuscle extends Muscle {
  BackMuscle({
    required super.traningsdensity,
    required super.recoveryDuration,
     super.lastTrained,
  }) : super(name: 'Back');
}

class ShoulderMuscle extends Muscle {
  ShoulderMuscle({
    required super.traningsdensity,
    required super.recoveryDuration,
     super.lastTrained,
  }) : super(name: 'Shoulder');
}

class BicepMuscle extends Muscle {
  BicepMuscle({
    required super.traningsdensity,
    required super.recoveryDuration,
     super.lastTrained,
  }) : super(name: 'Bicep');
}

class TricepMuscle extends Muscle {
  TricepMuscle({
    required super.traningsdensity,
    required super.recoveryDuration,
     super.lastTrained,
  }) : super(name: 'Tricep');
}

class FrontLegMuscle extends Muscle {
  FrontLegMuscle({
    required super.traningsdensity,
    required super.recoveryDuration,
     super.lastTrained,
  }) : super(name: 'FrontLeg');
}

class BackLegMuscle extends Muscle {
  BackLegMuscle({
    required super.traningsdensity,
    required super.recoveryDuration,
     super.lastTrained,
  }) : super(name: 'BackLeg');
}

class CalfMuscle extends Muscle {
  CalfMuscle({
    required super.traningsdensity,
    required super.recoveryDuration,
     super.lastTrained,
  }) : super(name: 'Calf');
}

class AbsMuscle extends Muscle {
  AbsMuscle({
    required super.traningsdensity,
    required super.recoveryDuration,
     super.lastTrained,
  }) : super(name: 'Abs');
}

class HipsMuscle extends Muscle {
  HipsMuscle({
    required super.traningsdensity,
    required super.recoveryDuration,
     super.lastTrained,
  }) : super(name: 'Hips');
}
