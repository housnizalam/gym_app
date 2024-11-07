import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/models/saved_trainingsday.dart';

class TrainingWidget extends ConsumerStatefulWidget {
  const TrainingWidget({super.key, required this.trainingsday});
  final SavedTrainingsday trainingsday;

  @override
  ConsumerState<TrainingWidget> createState() => _TrainingWidgetState();
}

class _TrainingWidgetState extends ConsumerState<TrainingWidget> {
  @override
  Widget build(BuildContext context) {
    final trainingsday = widget.trainingsday;
    return const Placeholder();
  }
}
