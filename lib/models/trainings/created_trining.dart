
import 'package:gym_app/models/sets.dart';
import 'package:gym_app/models/trainings/training.dart';

class CreatedTrining extends Training{
  CreatedTrining(
   {
    required super.bodyWeight,
    required super.name,
    required super.maintargetetMuscle,
    required super.targetetMuscles,
    required super.sets,
    }
  ):super(
    image: '',
    date: DateTime.now(),
  );

  factory CreatedTrining.standard(){
    return CreatedTrining(
      bodyWeight: 80,
      name: 'Created Training',
      maintargetetMuscle: 'Back',
      targetetMuscles: [],
         sets: const [
        Sets(reps: 0, weight: 0),
        Sets(reps: 0, weight: 0),
        Sets(reps: 0, weight: 0),
      ],
    );
  }
} 