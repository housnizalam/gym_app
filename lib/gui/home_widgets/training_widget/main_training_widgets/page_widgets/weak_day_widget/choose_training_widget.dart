
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/globals/extensionen/size_extension.dart';
import 'package:gym_app/globals/widgets/my_container.dart';
import 'package:gym_app/globals/widgets/my_inkwell.dart';
import 'package:gym_app/gui/home_widgets/training_widget/main_training_widgets/page_widgets/weak_day_widget/choose_sub_training.dart';
import 'package:gym_app/models/appstate.dart';
import 'package:gym_app/riverpod/appstate_provider.dart';

class ChooseWeakdayTrainingWidget extends ConsumerWidget {
  const ChooseWeakdayTrainingWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PageController pageController = PageController();

    return SizedBox(
      height: context.height * 0.7,
      child: PageView(
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
                          ref
                              .read(selectedStandardTrainingsList.notifier)
                              .state = ref.watch(appStateProvider)
                                  .getSelectedStandardTainingList(trainingType);
                          pageController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
          const ChooseSubTrainingWeakdayWidget(),
        ],
      ),
    );
  }
}
