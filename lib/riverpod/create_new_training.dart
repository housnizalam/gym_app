import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/models/muscle.dart';
import 'package:gym_app/riverpod/appstate_provider.dart';

final mainTargetedMuscleNameProvider = Provider<String>((ref) {
  final trainings = ref.watch(selectedStandardTrainingsList);
  if (trainings.isEmpty) {
    return '';
  }
  return trainings.first.mainTargetedMuscle;
});

final targetedMuscleListProvider = StateProvider<List<Muscle>>(
  (ref) {
    return [
      UpperChestMuscle.standard(),
      LowerChestMuscle.standard(),
      MiddleChestMuscle.standard(),
      UpperBackMuscle.standard(),
      LowerBackMuscle.standard(),
      MiddleBackMuscle.standard(),
      Lats.standard(),
      FrontShoulderMuscle.standard(),
      SideShoulderMuscle.standard(),
      RearShoulderMuscle.standard(),
      BicepsMuscle.standard(),
      TricepMuscle.standard(),
      Glutes.standard(),
      Hamstring.standard(),
      Quads.standard(),
      Calves.standard(),
      Core.standard(),
      ForArm.standard(),
    ];
  },
);
