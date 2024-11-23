import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/globals/extensionen/date_time.dart';
import 'package:gym_app/globals/extensionen/navigator.dart';
import 'package:gym_app/globals/extensionen/size_extension.dart';
import 'package:gym_app/globals/widgets/my_container.dart';
import 'package:gym_app/globals/widgets/my_inkwell.dart';
import 'package:gym_app/globals/widgets/my_scafold.dart';
import 'package:gym_app/globals/widgets/density_table.dart';
import 'package:gym_app/gui/home_widgets/training_widget/main_training_widgets/page_widgets/creat_day_widgets/add_saved_day.dart';
import 'package:gym_app/gui/home_widgets/training_widget/main_training_widgets/page_widgets/creat_day_widgets/add_traininig_widget/choose_training_widget/choose_training_widget.dart';
import 'package:gym_app/gui/home_widgets/training_widget/main_training_widgets/page_widgets/creat_day_widgets/edit_training_widget/edit_training_widget.dart';
import 'package:gym_app/riverpod/appstate_provider.dart';
import 'package:gym_app/riverpod/calender_providers.dart';
import 'package:gym_app/riverpod/temp_day_provider.dart';

class CreatTrainingWidget extends ConsumerWidget {
  const CreatTrainingWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> days = ref
        .watch(appStateProvider.select(
          (value) => value.days,
        ))
        .map((e) => e.date.formattedDate)
        .toList();
    final selectedDay = ref.watch(selectedDayProvider);
    final day = ref.watch(creatTempDayProvider).copyWith(date: selectedDay);
    final trainingsDay = day.trainings;
    final musclDensity = day.totalMuscleDensityMap;
    print(day.date.formattedDate);

    return MyScaffold(
      leftTitel: 'Save & add',
      rightTitel: 'Save as',
      onFloatingButton: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return const ChooseTrainingWidget();
          },
        );
      },
      onleftTitel: () {
        if (days.contains(day.date.formattedDate)) {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return MyContainer(
                  height: context.height * 0.5,
                  child: Column(
                    children: [
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'you have already trained this day',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      MyInkwell(
                        height: 50,
                        width: context.width * 0.5,
                        onTap: () {
                          ref.read(appStateProvider.notifier).addDay(day);
                          ref.invalidate(creatTempDayProvider);

                          context.pop();
                          return;
                        },
                        child: const Text(
                          'Add any way',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MyInkwell(
                        height: 50,
                        width: context.width * 0.5,
                        onTap: () {
                          ref.read(appStateProvider.notifier).replaceDay(day);
                          ref.invalidate(creatTempDayProvider);

                          context.pop();
                          print('replace');
                          return;
                        },
                        child: Text(
                          'Replace it',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                );
              });
        } else {
          ref.read(appStateProvider.notifier).addDay(day);
          ref.invalidate(creatTempDayProvider);
          return;
        }
      },
      onRightTitel: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return AddSavedDayWidget(
              day: day,
            );
          },
        );
        // ref.read(appStateProvider.notifier).ad
      },
      body: Stack(
        children: [
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
                    'Create new Training',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: context.height * 0.04,
                  ),
                  for (var training in trainingsDay)
                    Padding(
                      padding: EdgeInsets.only(top: 8.0, left: 8),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: MyInkwell(
                              height: 50,
                              onTap: () {
                                ref.read(selectedTraining.notifier).state =
                                    training;
                                context.navigatePushTo(EditTrainingWidget());
                              },
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 8.0, left: 8.0),
                                    child: Hero(
                                      tag: AssetImage(training.image),
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          image: DecorationImage(
                                            image: AssetImage(training.image),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: context.width * 0.5,
                                    child: Text(
                                      training.name,
                                      overflow: TextOverflow.clip,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Expanded(child: SizedBox()),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                              child: InkWell(
                            onTap: () {
                              if (trainingsDay.length == 1) {
                                ref.invalidate(creatTempDayProvider);
                                print('invalidate');
                              } else {
                                print('remove');
                                ref
                                    .read(creatTempDayProvider.notifier)
                                    .removeTraining(training);
                              }
                            },
                            child: const Icon(Icons.delete,
                                color: Colors.white, size: 25),
                          )),
                        ],
                      ),
                    ),
                  DensityTable(
                      musclDensity: musclDensity,
                      totalDensity: day.totalDensity),
                  SizedBox(
                    height: context.height * 0.13,
                  )
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
      ),
    );
  }
}
