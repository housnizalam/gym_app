abstract class Muscle {
  final String name;
  final double traningsdensity;
  const Muscle({
    required this.name,
    required this.traningsdensity,
  });
  Muscle copyWith(double? traningsdensity);

  @override
  String toString() {
    return 'Muscle{name: $name, traningsdensity: $traningsdensity}';
  }
}

class UpperChestMuscle extends Muscle {
  UpperChestMuscle({
    required super.traningsdensity,
  }) : super(name: 'Upper chest');
  factory UpperChestMuscle.standard() {
    return UpperChestMuscle(traningsdensity: 30);
  }
  @override
  UpperChestMuscle copyWith(double? traningsdensity) {
    return UpperChestMuscle(
        traningsdensity: traningsdensity ?? this.traningsdensity);
  }
}

class LowerChestMuscle extends Muscle {
  LowerChestMuscle({
    required super.traningsdensity,
  }) : super(name: 'Lower chest');
  factory LowerChestMuscle.standard() {
    return LowerChestMuscle(traningsdensity: 30);
  }
  @override
  LowerChestMuscle copyWith(double? traningsdensity) {
    return LowerChestMuscle(
        traningsdensity: traningsdensity ?? this.traningsdensity);
  }
}

class MiddleChestMuscle extends Muscle {
  MiddleChestMuscle({
    required super.traningsdensity,
  }) : super(name: 'Middle chest');
  factory MiddleChestMuscle.standard() {
    return MiddleChestMuscle(traningsdensity: 30);
  }
  @override
  MiddleChestMuscle copyWith(double? traningsdensity) {
    return MiddleChestMuscle(
        traningsdensity: traningsdensity ?? this.traningsdensity);
  }
}

class LowerBackMuscle extends Muscle {
  LowerBackMuscle({
    required super.traningsdensity,
  }) : super(name: 'Lower back');
  factory LowerBackMuscle.standard() {
    return LowerBackMuscle(traningsdensity: 30);
  }
  @override
  LowerBackMuscle copyWith(double? traningsdensity) {
    return LowerBackMuscle(
        traningsdensity: traningsdensity ?? this.traningsdensity);
  }
}

class UpperBackMuscle extends Muscle {
  UpperBackMuscle({
    required super.traningsdensity,
  }) : super(name: 'Upper back');
  factory UpperBackMuscle.standard() {
    return UpperBackMuscle(traningsdensity: 30);
  }
  @override
  UpperBackMuscle copyWith(double? traningsdensity) {
    return UpperBackMuscle(
        traningsdensity: traningsdensity ?? this.traningsdensity);
  }
}

class MiddleBackMuscle extends Muscle {
  MiddleBackMuscle({
    required super.traningsdensity,
  }) : super(name: 'Middle back');
  factory MiddleBackMuscle.standard() {
    return MiddleBackMuscle(traningsdensity: 30);
  }
  @override
  MiddleBackMuscle copyWith(double? traningsdensity) {
    return MiddleBackMuscle(
        traningsdensity: traningsdensity ?? this.traningsdensity);
  }
}

class Lats extends Muscle {
  Lats({
    required super.traningsdensity,
  }) : super(name: 'Lats');
  factory Lats.standard() {
    return Lats(traningsdensity: 30);
  }
  @override
  Lats copyWith(double? traningsdensity) {
    return Lats(traningsdensity: traningsdensity ?? this.traningsdensity);
  }
}

class FrontShoulderMuscle extends Muscle {
  FrontShoulderMuscle({
    required super.traningsdensity,
  }) : super(name: 'Front shoulder');
  factory FrontShoulderMuscle.standard() {
    return FrontShoulderMuscle(traningsdensity: 30);
  }
  @override
  FrontShoulderMuscle copyWith(double? traningsdensity) {
    return FrontShoulderMuscle(
        traningsdensity: traningsdensity ?? this.traningsdensity);
  }
}

class SideShoulderMuscle extends Muscle {
  SideShoulderMuscle({
    required super.traningsdensity,
  }) : super(name: 'Side shoulder');
  factory SideShoulderMuscle.standard() {
    return SideShoulderMuscle(traningsdensity: 30);
  }
  @override
  SideShoulderMuscle copyWith(double? traningsdensity) {
    return SideShoulderMuscle(
        traningsdensity: traningsdensity ?? this.traningsdensity);
  }
}

class RearShoulderMuscle extends Muscle {
  RearShoulderMuscle({
    required super.traningsdensity,
  }) : super(name: 'Rear shoulder');
  factory RearShoulderMuscle.standard() {
    return RearShoulderMuscle(traningsdensity: 30);
  }
  @override
  RearShoulderMuscle copyWith(double? traningsdensity) {
    return RearShoulderMuscle(
        traningsdensity: traningsdensity ?? this.traningsdensity);
  }
}

class BicepsMuscle extends Muscle {
  BicepsMuscle({
    required super.traningsdensity,
  }) : super(name: 'Bicep');
  factory BicepsMuscle.standard() {
    return BicepsMuscle(traningsdensity: 30);
  }
  @override
  BicepsMuscle copyWith(double? traningsdensity) {
    return BicepsMuscle(
        traningsdensity: traningsdensity ?? this.traningsdensity);
  }
}

class TricepMuscle extends Muscle {
  TricepMuscle({
    required super.traningsdensity,
  }) : super(name: 'Tricep');
  factory TricepMuscle.standard() {
    return TricepMuscle(traningsdensity: 30);
  }
  @override
  TricepMuscle copyWith(double? traningsdensity) {
    return TricepMuscle(
        traningsdensity: traningsdensity ?? this.traningsdensity);
  }
}

class Glutes extends Muscle {
  Glutes({
    required super.traningsdensity,
  }) : super(name: 'Glutes');
  factory Glutes.standard() {
    return Glutes(traningsdensity: 30);
  }
  @override
  Glutes copyWith(double? traningsdensity) {
    return Glutes(traningsdensity: traningsdensity ?? this.traningsdensity);
  }
}

class Hamstring extends Muscle {
  Hamstring({
    required super.traningsdensity,
  }) : super(name: 'Hamstring');
  factory Hamstring.standard() {
    return Hamstring(traningsdensity: 30);
  }
  @override
  Hamstring copyWith(double? traningsdensity) {
    return Hamstring(
        traningsdensity: traningsdensity ?? this.traningsdensity);
  }
}

class Quads extends Muscle {
  Quads({
    required super.traningsdensity,
  }) : super(name: 'Quads');
  factory Quads.standard() {
    return Quads(traningsdensity: 30);
  }
  @override
  Quads copyWith(double? traningsdensity) {
    return Quads(traningsdensity: traningsdensity ?? this.traningsdensity);
  }
}

class Calves extends Muscle {
  Calves({
    required super.traningsdensity,
  }) : super(name: 'Calves');
  factory Calves.standard() {
    return Calves(traningsdensity: 30);
  }
  @override
  Calves copyWith(double? traningsdensity) {
    return Calves(traningsdensity: traningsdensity ?? this.traningsdensity);
  }
}

class AbsMuscle extends Muscle {
  AbsMuscle({
    required super.traningsdensity,
  }) : super(name: 'Abs');
  factory AbsMuscle.standard() {
    return AbsMuscle(traningsdensity: 30);
  }
  @override
  AbsMuscle copyWith(double? traningsdensity) {
    return AbsMuscle(traningsdensity: traningsdensity ?? this.traningsdensity);
  }
}

class Core extends Muscle {
  Core({
    required super.traningsdensity,
  }) : super(name: 'Core');
  factory Core.standard() {
    return Core(traningsdensity: 30);
  }
  @override
  Core copyWith(double? traningsdensity) {
    return Core(traningsdensity: traningsdensity ?? this.traningsdensity);
  }
}

class ForArm extends Muscle {
  ForArm({
    required super.traningsdensity,
  }) : super(name: 'ForArm');
  factory ForArm.standard() {
    return ForArm(traningsdensity: 30);
  }
  @override
  ForArm copyWith(double? traningsdensity) {
    return ForArm(traningsdensity: traningsdensity ?? this.traningsdensity);
  }
}
