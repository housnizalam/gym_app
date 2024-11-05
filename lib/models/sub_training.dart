import 'package:gym_app/models/muscle.dart';
import 'package:gym_app/models/sets.dart';

abstract class SubTraining {
  final String name;
  final List<Sets> sets;
  final List<Muscle> targetetMuscles;
  final DateTime date;
  const SubTraining({
    required this.name,
    required this.sets,
    required this.targetetMuscles,
    required this.date,
  });
}

 class ChestSubTraining extends SubTraining {
  const ChestSubTraining({
    required super.name,
    required super.sets,
    required super.targetetMuscles,
    required super.date,
  });
}

 class BackSubTraining extends SubTraining {
  const BackSubTraining({
    required super.name,
    required super.sets,
    required super.targetetMuscles,
    required super.date,
  });
}

 class ShoulderSubTraining extends SubTraining {
  const ShoulderSubTraining({
    required super.name,
    required super.sets,
    required super.targetetMuscles,
    required super.date,
  });
}

 class BicepsSubTraining extends SubTraining {
  const BicepsSubTraining({
    required super.name,
    required super.sets,
    required super.targetetMuscles,
    required super.date,
  });
}

 class TricepSubTraining extends SubTraining {
  const TricepSubTraining({
    required super.name,
    required super.sets,
    required super.targetetMuscles,
    required super.date,
  });
}

 class ForArmSubTraining extends SubTraining {
  const ForArmSubTraining({
    required super.name,
    required super.sets,
    required super.targetetMuscles,
    required super.date,
  });
}

 class LegSubTraining extends SubTraining {
  const LegSubTraining({
    required super.name,
    required super.sets,
    required super.targetetMuscles,
    required super.date,
  });
}

 class AbbsSubTraining extends SubTraining {
  const AbbsSubTraining({
    required super.name,
    required super.sets,
    required super.targetetMuscles,
    required super.date,
  });
}
