import 'package:gym_app/models/sub_training.dart';

abstract class Training {
  final String targetedMuscle;
  final List<SubTraining> subTrainings;
  final DateTime date;
  const Training( {required this.targetedMuscle, required this.subTrainings,required this.date});
}

class ChestTraining extends Training {
  const ChestTraining({required List<ChestSubTraining> subTrainings, required DateTime date})
      : super(subTrainings: subTrainings, targetedMuscle: 'Chest', date: date);
}

class BackTraining extends Training {
  const BackTraining({required List<BackSubTraining> subTrainings, required DateTime date})
      : super(subTrainings: subTrainings, targetedMuscle: 'Back', date: date);
}

class ShoulderTraining extends Training {
  const ShoulderTraining({required List<ShoulderSubTraining> subTrainings, required DateTime date})
      : super(subTrainings: subTrainings, targetedMuscle: 'Shoulder', date: date);
}

class BicepTraining extends Training {
  const BicepTraining({required List<BicepsSubTraining> subTrainings, required DateTime date})
      : super(subTrainings: subTrainings, targetedMuscle: 'Bicep', date: date);
}

class TricepTraining extends Training {
  const TricepTraining({required List<TricepSubTraining> subTrainings, required DateTime date})
      : super(subTrainings: subTrainings, targetedMuscle: 'Tricep', date: date);
}

class ForArmTraining extends Training {
  const ForArmTraining({required List<ForArmSubTraining> subTrainings, required DateTime date})
      : super(subTrainings: subTrainings, targetedMuscle: 'ForArm', date: date);
}

class LegTraining extends Training {
  const LegTraining({required List<LegSubTraining> subTrainings, required DateTime date})
      : super(subTrainings: subTrainings, targetedMuscle: 'Leg', date: date);
}

class AbbsTraining extends Training {
  const AbbsTraining({required List<AbbsSubTraining> subTrainings, required DateTime date})
      : super(subTrainings: subTrainings, targetedMuscle: 'Abbs', date: date);
}
