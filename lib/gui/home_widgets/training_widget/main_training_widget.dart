import 'package:flutter/material.dart';
import 'package:gym_app/globals/widgets/tapbar.dart';
import 'package:gym_app/gui/home_widgets/training_widget/main_training_widgets/label_widgets.dart';

class MainTrainingWidget extends StatelessWidget {
  const MainTrainingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const AmazingTabBarView(
      indikatorWeight: 1,
      labelWidgets: [
        WeakdayLabel(),
        SelectSavedTrainingsDayLabel(),
        CreateTrainingLabel(),
      ],
    );
  }
}
