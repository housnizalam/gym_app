import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/globals/extensionen/navigator.dart';
import 'package:gym_app/globals/extensionen/size_extension.dart';
import 'package:gym_app/globals/widgets/my_container.dart';
import 'package:gym_app/globals/widgets/my_inkwell.dart';
import 'package:gym_app/gui/home_widgets/training_widget/main_training_widgets/page_widgets/select_saved_training_widget.dart';
import 'package:gym_app/gui/home_widgets/training_widget/main_training_widgets/sub_training_widget/add_traininig_widget/add_training_widget.dart';
import 'package:gym_app/gui/home_widgets/training_widget/main_training_widgets/sub_training_widget/edit_training_widget/edit_training_widget.dart';
import 'package:gym_app/riverpod/temp_day_provider.dart';

class SubTrainingWidget extends ConsumerStatefulWidget {
  const SubTrainingWidget({super.key});
  @override
  ConsumerState<SubTrainingWidget> createState() => _TrainingWidgetState();
}

class _TrainingWidgetState extends ConsumerState<SubTrainingWidget> {
  @override
  Widget build(BuildContext context) {
    final trainingsDay = ref.watch(tempDayProvider).trainings;
    if (trainingsDay.isNotEmpty)
      print('SubTrainingWidget ${trainingsDay.first.name}');
    return MyContainer(
      height: context.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Create new Training',
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            AddTrainingWidget(),
            for (var training in trainingsDay)
              Padding(
                padding: EdgeInsets.only(
                    top: 8.0, right: context.width * 0.4, left: 8),
                child: MyInkwell(
                    onTap: () => context
                        .navigatePushTo(EditTrainingWidget(training: training)),
                    height: 50,
                    child: Hero(
                      tag: training.name,
                      child: Text(
                        training.name,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )),
              ),
          ],
        ),
      ),
    );
  }
}
