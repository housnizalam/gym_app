
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/globals/extensionen/date_time.dart';
import 'package:gym_app/globals/extensionen/navigator.dart';
import 'package:gym_app/globals/extensionen/size_extension.dart';
import 'package:gym_app/globals/widgets/my_container.dart';
import 'package:gym_app/globals/widgets/my_inkwell.dart';
import 'package:gym_app/globals/widgets/my_scafold.dart';
import 'package:gym_app/gui/home_widgets/training_widget/main_training_widgets/page_widgets/creat_day_widgets/add_traininig_widget/choose_training_widget/choose_training_widget.dart';
import 'package:gym_app/gui/home_widgets/training_widget/main_training_widgets/page_widgets/creat_day_widgets/edit_training_widget/edit_training_widget.dart';
import 'package:gym_app/riverpod/appstate_provider.dart';
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
    final day = ref.watch(creatTempDayProvider);
    final trainingsDay = day.trainings;
    final musclDensity = day.totalMuscleDensityMap;
    print(days.isEmpty);

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
        print('Add this training');
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
                          context.pop();
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
        }
        ref.read(appStateProvider.notifier).addDay(day);
        return;
      },
      onRightTitel: () {
        print('Save');
      },
      body: MyContainer(
        height: context.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: context.height * 0.02,
              ),
              const Text(
                'Create new Training',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
                                      borderRadius: BorderRadius.circular(50),
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
                                  style: const TextStyle(color: Colors.white),
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
                          ref
                              .read(creatTempDayProvider.notifier)
                              .removeTraining(training);
                        },
                        child: const Icon(Icons.delete,
                            color: Colors.white, size: 25),
                      )),
                    ],
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, bottom: 20.0, right: 8.0, top: 08.0),
                child: Table(
                  border: TableBorder.all(color: Colors.white),
                  columnWidths: const {
                    0: IntrinsicColumnWidth(),
                    1: FlexColumnWidth(),
                  },
                  children: [
                    // الصف الخاص بـ Total density
                    TableRow(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Total density',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            '${day.totalDensity} Kg',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    // الصفوف الخاصة بـ العضلات والكثافة
                    ...musclDensity.entries.map(
                      (entry) => TableRow(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              entry.key,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              '${entry.value} Kg',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
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
