import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/gui/home_widgets/training_widget/main_training_widgets/sub_training_widget/sub_training_widget.dart';

class CreatTrainingWidget extends ConsumerWidget {
  const CreatTrainingWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final todaysTraining= ref.watch(appStateProvider.select((value) => value.todaysTraining));
    return SubTrainingWidget();
  }
}
