import 'package:gym_app/models/day.dart';
import 'package:gym_app/models/muscle.dart';
import 'package:gym_app/models/saved_trainingsday.dart';
import 'package:gym_app/models/sets.dart';
import 'package:gym_app/models/trainings/back_trainings.dart';
import 'package:gym_app/models/trainings/biceps_training.dart';
import 'package:gym_app/models/trainings/chest_trainings.dart';
import 'package:gym_app/models/trainings/core_trainings.dart';
import 'package:gym_app/models/trainings/created_trining.dart';
import 'package:gym_app/models/trainings/forarm.training.dart';
import 'package:gym_app/models/trainings/leg_trainings.dart';
import 'package:gym_app/models/trainings/shoulder_traininga.dart';
import 'package:gym_app/models/trainings/training.dart';
import 'package:gym_app/models/trainings/triceps_training.dart';

// ==================== SETS ====================
Map<String, dynamic> setsToJson(Sets sets) => {
      'reps': sets.reps,
      'weight': sets.weight,
    };

Sets setsFromJson(Map<String, dynamic> json) => Sets(
      reps: json['reps'],
      weight: json['weight'].toDouble(),
    );

// ==================== MUSCLE ====================
Map<String, dynamic> muscleToJson(Muscle muscle) => {
      'name': muscle.name,
      'density': muscle.traningsdensity,
    };

Muscle muscleFromJson(Map<String, dynamic> json) {
  final String name = json['name'];
  final double density = json['density'].toDouble();
  switch (name) {
    case 'Upper chest':
      return UpperChestMuscle(traningsdensity: density);
    case 'Lower chest':
      return LowerChestMuscle(traningsdensity: density);
    case 'Middle chest':
      return MiddleChestMuscle(traningsdensity: density);
    case 'Upper back':
      return UpperBackMuscle(traningsdensity: density);
    case 'Lower back':
      return LowerBackMuscle(traningsdensity: density);
    case 'Middle back':
      return MiddleBackMuscle(traningsdensity: density);
    case 'Lats':
      return Lats(traningsdensity: density);
    case 'Front shoulder':
      return FrontShoulderMuscle(traningsdensity: density);
    case 'Side shoulder':
      return SideShoulderMuscle(traningsdensity: density);
    case 'Rear shoulder':
      return RearShoulderMuscle(traningsdensity: density);
    case 'Bicep':
      return BicepsMuscle(traningsdensity: density);
    case 'Tricep':
      return TricepMuscle(traningsdensity: density);
    case 'Glutes':
      return Glutes(traningsdensity: density);
    case 'Hamstring':
      return Hamstring(traningsdensity: density);
    case 'Quads':
      return Quads(traningsdensity: density);
    case 'Calves':
      return Calves(traningsdensity: density);
    case 'Core':
      return Core(traningsdensity: density);
    case 'ForArm':
      return ForArm(traningsdensity: density);
    default:
      return Core(traningsdensity: density);
  }
}

// ==================== TRAINING ====================
Map<String, dynamic> trainingToJson(Training training) => {
      'type': training.runtimeType.toString(),
      'name': training.name,
      'bodyWeight': training.bodyWeight,
      'maintargetetMuscle': training.maintargetetMuscle,
      'sets': training.sets.map(setsToJson).toList(),
      'targetedMuscles': training.targetetMuscles.map(muscleToJson).toList(),
      'date': training.date.toIso8601String(),
      // بيانات إضافية للـ CreatedTrining
      if (training is CreatedTrining) 'isDumbbell': training.isDumbbell,
      if (training is CreatedTrining)
        'bodyWeightPercent': training.bodyWeightPercent,
    };

Training trainingFromJson(Map<String, dynamic> json) {
  final String type = json['type'];
  final List<Sets> sets =
      (json['sets'] as List).map((s) => setsFromJson(s)).toList();
  final DateTime date = DateTime.parse(json['date']);
  final int bodyWeight = json['bodyWeight'];
  final List<Muscle> muscles =
      (json['targetedMuscles'] as List).map((m) => muscleFromJson(m)).toList();

  switch (type) {
    // Chest
    case 'BenshPressSubTraining':
      return BenshPressSubTraining(sets: sets, date: date);
    case 'InclineBenchPress':
      return InclineBenchPress(sets: sets, date: date);
    case 'DeclineBenchPress':
      return DeclineBenchPress(sets: sets, date: date);
    case 'DumbbellFly':
      return DumbbellFly(sets: sets, date: date);
    case 'CableFly':
      return CableFly(sets: sets, date: date);
    case 'Dips':
      return Dips(sets: sets, date: date);
    // Back
    case 'PullUps':
      return PullUps(sets: sets, date: date, bodyWeight: bodyWeight);
    case 'ChinUps':
      return ChinUps(sets: sets, date: date, bodyWeight: bodyWeight);
    case 'LatPulldown':
      return LatPulldown(sets: sets, date: date);
    case 'SeatedRow':
      return SeatedRow(sets: sets, date: date);
    case 'BentOverRow':
      return BentOverRow(sets: sets, date: date);
    case 'TBarRow':
      return TBarRow(sets: sets, date: date);
    case 'Shrugs':
      return Shrugs(sets: sets, date: date);
    // Shoulder
    case 'FacePull':
      return FacePull(sets: sets, date: date);
    case 'MilitaryPress':
      return MilitaryPress(sets: sets, date: date);
    case 'ArnoldPress':
      return ArnoldPress(sets: sets, date: date);
    case 'LateralRaise':
      return LateralRaise(sets: sets, date: date);
    case 'FrontRaise':
      return FrontRaise(sets: sets, date: date);
    case 'RearDeltFly':
      return RearDeltFly(sets: sets, date: date);
    case 'UprightRow':
      return UprightRow(sets: sets, date: date);
    // Biceps
    case 'BarbellCurl':
      return BarbellCurl(sets: sets, date: date);
    case 'DumbbellCurl':
      return DumbbellCurl(sets: sets, date: date);
    case 'PreacherCurl':
      return PreacherCurl(sets: sets, date: date);
    case 'HammerCurl':
      return HammerCurl(sets: sets, date: date);
    case 'ConcentrationCurl':
      return ConcentrationCurl(sets: sets, date: date);
    case 'ZottmanCurl':
      return ZottmanCurl(sets: sets, date: date);
    // Triceps
    case 'CloseGripBenchPress':
      return CloseGripBenchPress(sets: sets, date: date);
    case 'SkullCrusher':
      return SkullCrusher(sets: sets, date: date);
    case 'TricepPushdown':
      return TricepPushdown(sets: sets, date: date);
    case 'OverheadTricepExtension':
      return OverheadTricepExtension(sets: sets, date: date);
    case 'TricepKickback':
      return TricepKickback(sets: sets, date: date);
    // Legs
    case 'Deadlift':
      return Deadlift(sets: sets, date: date, bodyWeight: bodyWeight);
    case 'Squat':
      return Squat(sets: sets, date: date, bodyWeight: bodyWeight);
    case 'LegPress':
      return LegPress(sets: sets, date: date);
    case 'Lunges':
      return Lunges(sets: sets, date: date, bodyWeight: bodyWeight);
    case 'FrontLegExtension':
      return FrontLegExtension(sets: sets, date: date);
    case 'BackLegExtension':
      return BackLegExtension(sets: sets, date: date);
    case 'CalfRaise':
      return CalfRaise(sets: sets, date: date, bodyWeight: bodyWeight);
    // Core
    case 'Crunch':
      return Crunch(sets: sets, date: date, bodyWeight: bodyWeight);
    case 'LegRaise':
      return LegRaise(sets: sets, date: date, bodyWeight: bodyWeight);
    case 'RussianTwist':
      return RussianTwist(sets: sets, date: date, bodyWeight: bodyWeight);
    case 'BicycleCrunch':
      return BicycleCrunch(sets: sets, date: date, bodyWeight: bodyWeight);
    case 'MountainClimber':
      return MountainClimber(sets: sets, date: date, bodyWeight: bodyWeight);
    // ForArm
    case 'ReverseCurl':
      return ReverseCurl(sets: sets, date: date);
    case 'WristCurl':
      return WristCurl(sets: sets, date: date);
    case 'ReverseWristCurl':
      return ReverseWristCurl(sets: sets, date: date);
    // Created
    case 'CreatedTrining':
      return CreatedTrining(
        isDumbbell: json['isDumbbell'] ?? false,
        bodyWeight: bodyWeight,
        name: json['name'],
        maintargetetMuscle: json['maintargetetMuscle'],
        targetetMuscles: muscles,
        sets: sets,
        bodyWeightPercent: json['bodyWeightPercent']?.toDouble() ?? 0,
      );
    default:
      return Training(
        bodyWeight: bodyWeight,
        name: json['name'],
        maintargetetMuscle: json['maintargetetMuscle'],
        sets: sets,
        targetetMuscles: muscles,
        date: date,
        image: '',
      );
  }
}

// ==================== DAY ====================
Map<String, dynamic> dayToJson(Day day) => {
      'date': day.date.toIso8601String(),
      'trainings': day.trainings.map(trainingToJson).toList(),
    };

Day dayFromJson(Map<String, dynamic> json) => Day(
      date: DateTime.parse(json['date']),
      trainings:
          (json['trainings'] as List).map((t) => trainingFromJson(t)).toList(),
    );

// ==================== SAVED DAY ====================
Map<String, dynamic> savedDayToJson(SavedTrainingsday savedDay) => {
      'name': savedDay.name,
      'day': dayToJson(savedDay.day),
    };

SavedTrainingsday savedDayFromJson(Map<String, dynamic> json) =>
    SavedTrainingsday(
      name: json['name'],
      day: dayFromJson(json['day']),
    );
// Am Ende der Datei hinzufügen:

// ==================== CREATED TRINING ====================

Map<String, dynamic> createdTriningToJson(CreatedTrining t) => {
      'name': t.name,
      'bodyWeight': t.bodyWeight,
      'maintargetetMuscle': t.maintargetetMuscle,
      'isDumbbell': t.isDumbbell,
      'bodyWeightPercent': t.bodyWeightPercent,
      'sets': t.sets.map(setsToJson).toList(),
      'targetedMuscles': t.targetetMuscles.map(muscleToJson).toList(),
    };

CreatedTrining createdTriningFromJson(Map<String, dynamic> json) =>
    CreatedTrining(
      name: json['name'],
      bodyWeight: json['bodyWeight'],
      maintargetetMuscle: json['maintargetetMuscle'],
      isDumbbell: json['isDumbbell'] ?? false,
      bodyWeightPercent: (json['bodyWeightPercent'] as num?)?.toDouble() ?? 0,
      sets: (json['sets'] as List).map((s) => setsFromJson(s)).toList(),
      targetetMuscles:
          (json['targetedMuscles'] as List).map((m) => muscleFromJson(m)).toList(),
    );