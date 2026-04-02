import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/globals/extensionen/size_extension.dart';
import 'package:gym_app/globals/widgets/my_container.dart';
import 'package:gym_app/globals/widgets/my_inkwell.dart';
import 'package:gym_app/gui/home_widgets/training_widget/main_training_widgets/page_widgets/create_day_widgets/add_training_widget/choose_training_widget/choose_sub_training_widget.dart';
import 'package:gym_app/gui/home_widgets/training_widget/main_training_widgets/page_widgets/create_day_widgets/add_training_widget/choose_training_widget/create_new_training_widget.dart';
import 'package:gym_app/models/appstate.dart';
import 'package:gym_app/riverpod/appstate_provider.dart';

class ChooseTrainingWidget extends ConsumerWidget {
  const ChooseTrainingWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PageController pageController = PageController();

    return SizedBox(
      height: context.height * 0.7,
      child: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          MyContainer(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (String trainingType in AppState.trainingTypes)
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: context.width * 0.3, vertical: 2),
                      child: MyInkwell(
                        height: 50,
                        child: Text(trainingType,
                            style: const TextStyle(color: Colors.white)),
                        onTap: () {
                          // Standard-Trainings der gewählten Kategorie
                          final standardList = ref
                              .read(appStateProvider)
                              .getSelectedStandardTainingList(trainingType);

                          // Vom Benutzer erstellte Trainings der gleichen Kategorie
                          final createdList = ref
                              .read(appStateProvider)
                              .createdTrainings
                              .where(
                                  (t) => t.mainTargetedMuscle == trainingType)
                              .toList();

                          // Beide zusammen in den Provider laden
                          ref
                              .read(selectedStandardTrainingsList.notifier)
                              .state = [
                            ...standardList,
                            ...createdList,
                          ];

                          pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
          ChooseSubTrainingWidget(
            pageController: pageController,
          ),
          CreateNewTrainingWidget(),
        ],
      ),
    );
  }
}
