import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/globals/extensionen/size_extension.dart';
import 'package:gym_app/globals/widgets/my_container.dart';
import 'package:gym_app/globals/widgets/my_inkwell.dart';
import 'package:gym_app/gui/home_widgets/training_widget/main_training_widgets/sub_training_widget/add_traininig_widget/choose_training_widget/choose_sub_training_widget.dart';
import 'package:gym_app/riverpod/appstate_provider.dart';

class ChooseTrainingWidget extends ConsumerWidget {
  const ChooseTrainingWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PageController pageController = PageController();
    final List<String> allChestTrainings = ref
        .watch(appStateProvider.select((value) => value.allChestTrainingNames));
    final List<String> allBackTrainings = ref
        .watch(appStateProvider.select((value) => value.allBackTrainingNames));
    final List<String> allShoulderTrainings = ref.watch(
        appStateProvider.select((value) => value.allShoulderTrainingNames));
    final List<String> allBicepsTrainings = ref.watch(
        appStateProvider.select((value) => value.allBicepsTrainingNames));
    final List<String> allTricepsTrainings = ref.watch(
        appStateProvider.select((value) => value.allTricepsTrainingNames));
    final List<String> allLegsTrainings = ref
        .watch(appStateProvider.select((value) => value.allLegTrainingNames));
    final List<String> allAbsTrainings = ref
        .watch(appStateProvider.select((value) => value.allAbbsTrainingNames));
    final List<String> allForearmTrainings = ref.watch(
        appStateProvider.select((value) => value.allForArmTrainingNames));
    final Map<String, List<String>> MusclesName = {
      'Chest': allChestTrainings,
      'Back': allBackTrainings,
      'Shoulder': allShoulderTrainings,
      'Biceps': allBicepsTrainings,
      'Triceps': allTricepsTrainings,
      'Legs': allLegsTrainings,
      'Abs': allAbsTrainings,
      'Forearm': allForearmTrainings,
    };
    return SizedBox(
      height: context.height * 0.7,
      child: PageView(
        controller: pageController,
        children: [
          MyContainer(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (String key in MusclesName.keys)
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: context.width * 0.3, vertical: 2),
                      child: MyInkwell(
                        height: 50,
                        child: Text(key,
                            style: const TextStyle(color: Colors.white)),
                        onTap: () {
                          ref.read(choosedMuscle.notifier).state =
                              MusclesName[key]??[];
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
          ChooseSubTrainingWidget(),
        ],
      ),
    );
  }
}
