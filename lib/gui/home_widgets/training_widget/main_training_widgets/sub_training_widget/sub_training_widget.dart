import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/globals/extensionen/navigator.dart';
import 'package:gym_app/globals/extensionen/size_extension.dart';
import 'package:gym_app/globals/widgets/my_container.dart';
import 'package:gym_app/globals/widgets/my_inkwell.dart';
import 'package:gym_app/gui/home_widgets/training_widget/main_training_widgets/page_widgets/select_saved_training_widget.dart';
import 'package:gym_app/gui/home_widgets/training_widget/main_training_widgets/sub_training_widget/add_traininig_widget/add_training_widget.dart';
import 'package:gym_app/gui/home_widgets/training_widget/main_training_widgets/sub_training_widget/edit_training_widget/edit_training_widget.dart';
import 'package:gym_app/models/training_images.dart';
import 'package:gym_app/riverpod/temp_day_provider.dart';

class SubTrainingWidget extends ConsumerStatefulWidget {
  const SubTrainingWidget({super.key});
  @override
  ConsumerState<SubTrainingWidget> createState() => _TrainingWidgetState();
}

class _TrainingWidgetState extends ConsumerState<SubTrainingWidget> {
  @override
  Widget build(BuildContext context) {
    final day = ref.watch(tempDayProvider);
    final trainingsDay = day.trainings;
    final musclDensity = day.totalMuscleDensityMap;
    if (trainingsDay.isNotEmpty)
      print('SubTrainingWidget ${trainingsDay.first.name}');
    return MyContainer(
      height: context.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'Create new Training',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const AddTrainingWidget(),
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
                          ref.read(selectedTraining.notifier).state = training;
                          context.navigatePushTo(EditTrainingWidget());
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 8.0, left: 8.0),
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
                            .read(tempDayProvider.notifier)
                            .removeTraining(training);
                      },
                      child:
                          const Icon(Icons.delete, color: Colors.red, size: 35),
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
          ],
        ),
      ),
    );
  }
}
