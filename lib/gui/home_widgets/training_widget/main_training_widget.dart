import 'package:flutter/material.dart';
import 'package:gym_app/globals/widgets/tapbar.dart';
import 'package:gym_app/gui/home_widgets/training_widget/main_training_widgets/lable_widgets.dart';
import 'package:gym_app/gui/home_widgets/training_widget/main_training_widgets/page_widgets/creat_training_widget.dart';
import 'package:gym_app/gui/home_widgets/training_widget/main_training_widgets/page_widgets/select_saved_training_widget.dart';
import 'package:gym_app/gui/home_widgets/training_widget/main_training_widgets/page_widgets/weakday_widget.dart';

class MainTrainingWidget extends StatelessWidget {
  const MainTrainingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const AmazingTabBarView(
      
      indikatorWeight: 1,
      labelWidgets: [
        WeakdayLable(),
        SelectSavedTrainingsDayLable(),
        CreateTrainingLable(),
      ],
      pageWidgets: [
        WeakdayWidget(),
        SelectSavedTrainingWidget(),
        CreatTrainingWidget(),
      ],
    );
  }
}
