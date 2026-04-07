import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/globals/extensionen/navigator.dart';
import 'package:gym_app/globals/extensionen/size_extension.dart';
import 'package:gym_app/globals/widgets/my_container.dart';
import 'package:gym_app/globals/widgets/my_inkwell.dart';
import 'package:gym_app/models/saved_trainingsday.dart';
import 'package:gym_app/riverpod/appstate_provider.dart';
import 'package:gym_app/riverpod/temp_day_provider.dart';

class SelectSavedTrainingWidget extends ConsumerStatefulWidget {
  const SelectSavedTrainingWidget({super.key, required this.controller});
  final TabController controller;

  @override
  ConsumerState<SelectSavedTrainingWidget> createState() =>
      _SelectSavedTrainingWidgetState();
}

class _SelectSavedTrainingWidgetState
    extends ConsumerState<SelectSavedTrainingWidget> {
  @override
  Widget build(BuildContext context) {
    final List<SavedTrainingsday>? savedTrainingsDays =
        ref.watch(appStateProvider.select((value) => value.savedTrainingsdays));
    return Stack(
      children: [
        if (savedTrainingsDays == null || savedTrainingsDays.isEmpty)
          const MyContainer(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    'You have no saved Trainings',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        if (savedTrainingsDays != null && savedTrainingsDays.isNotEmpty)
          MyContainer(
            width: context.width,
            height: context.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: context.height * 0.02,
                  ),
                  const Text(
                    'Select a saved Training',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: context.height * 0.02,
                  ),
                  for (var trainingsday in savedTrainingsDays)
                    Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        MyInkwell(
                          height: context.height * 0.1,
                          width: context.width * 0.6,
                          child: Text(trainingsday.name,
                              style: const TextStyle(color: Colors.white)),
                          onTap: () {
                            ref
                                .read(createTempDayProvider.notifier)
                                .replaceAll(trainingsday.day);
                            widget.controller.animateTo(2);
                            // context.animateToAsPush(page: CreateTrainingWidget());
                          },
                        ),
                        const Expanded(
                          child: SizedBox(),
                        ),
                        InkWell(
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 30,
                          ),
                          onTap: () {
                            ref
                                .read(appStateProvider.notifier)
                                .deleteSavedDay(trainingsday);
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                ],
              ),
            ),
          ),
        Positioned(
          left: 5,
          top: 5,
          child: MyInkwell(
            height: 30,
            width: 30,
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onTap: () {
              context.pop();
            },
          ),
        )
      ],
    );
  }
}
