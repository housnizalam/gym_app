import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/globals/extensionen/date_time.dart';
import 'package:gym_app/globals/extensionen/navigator.dart';
import 'package:gym_app/globals/extensionen/size_extension.dart';
import 'package:gym_app/globals/widgets/my_container.dart';
import 'package:gym_app/globals/widgets/my_inkwell.dart';
import 'package:gym_app/globals/widgets/my_scafold.dart';
import 'package:gym_app/globals/widgets/density_table.dart';
import 'package:gym_app/gui/home_widgets/training_widget/main_training_widgets/page_widgets/weak_day_widget/choose_training_widget.dart';
import 'package:gym_app/gui/home_widgets/training_widget/main_training_widgets/page_widgets/weak_day_widget/edit_training_widget.dart';
import 'package:gym_app/riverpod/appstate_provider.dart';
import 'package:gym_app/riverpod/temp_day_provider.dart';

class EditWeakDayWidget extends ConsumerWidget {
  const EditWeakDayWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> days = ref
        .watch(appStateProvider.select(
          (value) => value.days,
        ))
        .map((e) => e.date.formattedDate)
        .toList();
    final day = ref.watch(weakdayTempDayProvider);
    final trainingsDay = day.trainings;
    final musclDensity = day.totalMuscleDensityMap;

    return MyScaffold(
      leftTitel: 'Save & add',
      rightTitel: 'Save as',
      onFloatingButton: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return const ChooseWeakdayTrainingWidget();
          },
        );
      },
      onleftTitel: () {
        if (days.contains(day.date.formattedDate)) {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return MyContainer(
                  width: context.width,
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
                          context.pop();
                          return;
                        },
                        child: const Text(
                          'Add any way',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MyInkwell(
                        height: 50,
                        width: context.width * 0.5,
                        onTap: () {
                          ref.read(appStateProvider.notifier).replaceDay(day);
                          context.pop();
                          return;
                        },
                        child: const Text(
                          'Replace it',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                );
              });
        }
        ref.read(appStateProvider.notifier).addDay(day);
        return;
      },
      onRightTitel: () {
      },
      body: MyContainer(
        width: context.width,
        height: context.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: context.height * 0.02,
              ),
              Text(
                '${DateTime.now().todayAsWeakday}s Training',
                style:
                    const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: context.height * 0.04,
              ),
              for (var training in trainingsDay)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 8),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: MyInkwell(
                          height: 50,
                          onTap: () {
                            ref.read(selectedTraining.notifier).state =
                                training;
                            context.navigatePushTo(
                                const EditWeakDayTrainingWidget());
                          },
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 8.0, left: 8.0),
                                child: Hero(
                                  tag: training.id,
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image.asset(
                                        training.image.isNotEmpty
                                            ? training.image
                                            : 'assets/images/1000011614.jpg',
                                        fit: BoxFit.fill,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                Image.asset(
                                          'assets/images/1000011614.jpg',
                                          fit: BoxFit.fill,
                                        ),
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
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                              const Expanded(child: SizedBox()),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                          child: InkWell(
                        onTap: () {
                          ref
                              .read(weakdayTempDayProvider.notifier)
                              .removeTraining(training);
                        },
                        child: const Icon(Icons.delete,
                            color: Colors.white, size: 25),
                      )),
                    ],
                  ),
                ),
              DensityTable(
                  musclDensity: musclDensity, totalDensity: day.totalDensity),
              SizedBox(
                height: context.height * 0.13,
              )
            ],
          ),
        ),
      ),
    );
  }
}
