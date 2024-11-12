abstract class Muscle {
  String name;
  double traningsdensity;
  Muscle({
    required this.name,
    required this.traningsdensity,

  });
}

class UpperChestMuscle extends Muscle {
  UpperChestMuscle({
    required super.traningsdensity,

  }) : super(name: 'Upper chest');
}

class LowerChestMuscle extends Muscle {
  LowerChestMuscle({
    required super.traningsdensity,

  }) : super(name: 'Lower chest');
}

class MiddleChestMuscle extends Muscle {
  MiddleChestMuscle({
    required super.traningsdensity,

  }) : super(name: 'Middle chest');
}

class LowerBackMuscle extends Muscle {
  LowerBackMuscle({
    required super.traningsdensity,

  }) : super(name: 'Lower back');
}

class UpperBackMuscle extends Muscle {
  UpperBackMuscle({
    required super.traningsdensity,

  }) : super(name: 'Upper back');
}

class MiddleBackMuscle extends Muscle {
  MiddleBackMuscle({
    required super.traningsdensity,

  }) : super(name: 'Middle back');
}

class Lats extends Muscle {
  Lats({
    required super.traningsdensity,

  }) : super(name: 'Lats');
}


class FrontShoulderMuscle extends Muscle {
  FrontShoulderMuscle({
    required super.traningsdensity,

  }) : super(name: 'Front shoulder');
}

class SideShoulderMuscle extends Muscle {
  SideShoulderMuscle({
    required super.traningsdensity,

  }) : super(name: 'Side shoulder');
}

class RearShoulderMuscle extends Muscle {
  RearShoulderMuscle({
    required super.traningsdensity,

  }) : super(name: 'Rear shoulder');
}

class BicepsMuscle extends Muscle {
  BicepsMuscle({
    required super.traningsdensity,

  }) : super(name: 'Bicep');
}

class TricepMuscle extends Muscle {
  TricepMuscle({
    required super.traningsdensity,

  }) : super(name: 'Tricep');
}

class Glutes extends Muscle {
  Glutes({
    required super.traningsdensity,

  }) : super(name: 'Glutes');
}

class Hamstring extends Muscle {
  Hamstring({
    required super.traningsdensity,
  
  }) : super(name: 'Hamstring');
}

class Quads extends Muscle {
  Quads({
    required super.traningsdensity,
  
  }) : super(name: 'Quads');
}

class Calves extends Muscle {
  Calves({
    required super.traningsdensity,

  }) : super(name: 'Calves');
}


class AbsMuscle extends Muscle {
  AbsMuscle({
    required super.traningsdensity,

  }) : super(name: 'Abs');
}

class Core extends Muscle {
  Core({
    required super.traningsdensity,

  }) : super(name: 'Core');
}

class ForArm extends Muscle {
  ForArm({
    required super.traningsdensity,

  }) : super(name: 'ForArm');
}
