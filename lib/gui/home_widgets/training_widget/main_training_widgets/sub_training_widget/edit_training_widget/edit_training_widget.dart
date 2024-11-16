import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/globals/extensionen/size_extension.dart';
import 'package:gym_app/globals/widgets/my_container.dart';
import 'package:gym_app/globals/widgets/my_inkwell.dart';
import 'package:gym_app/globals/widgets/wheal_scroller.dart';
import 'package:gym_app/models/sets.dart';
import 'package:gym_app/models/training_images.dart';
import 'package:gym_app/models/trainings/training.dart';
import 'package:gym_app/riverpod/temp_day_provider.dart';

class EditTrainingWidget extends ConsumerWidget {
  const EditTrainingWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Training training = ref.watch(selectedTraining);
    final List<Sets> sets = training.sets;

    print('real Value ${sets.first.weight}');
    return Material(
      child: MyContainer(
        height: context.height,
        width: context.width,
        child: Stack(
          children: [
            Center(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        training.name,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Hero(
                      tag: AssetImage(training.image),
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(training.image),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  for (int i = 0; i < sets.length; i++)
                    Column(
                      children: [
                        ListTile(
                          title: Text(
                            'Set ${i + 1}',
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 4.0),
                                child: Text(
                                  'Weight:',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              WhealScroller(
                                firstValue: 0,
                                lastValue: 200,
                                startValue: sets[i].weight.toInt(),
                                height: 60,
                                width: 30,
                                onValueChange: (value) {
                                  // Aktualisiere den Zustand des Providers mit dem neuen Gewicht
                                  ref.read(selectedTraining.notifier).state =
                                      training.copyWith(
                                    sets: [...sets]
                                      ..removeAt(i)
                                      ..insert(
                                          i,
                                          sets[i].copyWith(
                                              weight: value.toDouble())),
                                  );
                                },
                              ),
                              const SizedBox(width: 20),
                              Padding(
                                padding: const EdgeInsets.only(right: 4.0),
                                child: Text(
                                  'Reps:',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              WhealScroller(
                                firstValue: 0,
                                lastValue: 40,
                                startValue: sets[i].reps.toInt(),
                                height: 60,
                                width: 25,
                                onValueChange: (value) {
                                  // Aktualisiere den Zustand des Providers mit dem neuen Gewicht
                                  ref.read(selectedTraining.notifier).state =
                                      training.copyWith(
                                    sets: [...sets]
                                      ..removeAt(i)
                                      ..insert(
                                          i, sets[i].copyWith(reps: value)),
                                  );
                                },
                              ),
                              Expanded(child: SizedBox()),
                              InkWell(
                                onTap: () {
                                  if (sets.length == 1) return;

                                  ref.read(selectedTraining.notifier).state =
                                      training.copyWith(
                                    sets: [...sets]..removeAt(i),
                                  );
                                },
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                      ],
                    ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MyInkwell(
                          width: context.width * 0.1,
                          height: context.width * 0.1,
                          onTap: () {
                            ref.read(selectedTraining.notifier).state =
                                training.copyWith(
                              sets: [
                                ...sets,
                                Sets(
                                    reps: sets.last.reps,
                                    weight: sets.last.weight)
                              ],
                            );
                          },
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              top: 3,
              left: 3,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  ref.read(tempDayProvider.notifier).saveTraining(training);
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
