import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/globals/extensionen/navigator.dart';
import 'package:gym_app/globals/extensionen/size_extension.dart';
import 'package:gym_app/globals/widgets/my_container.dart';
import 'package:gym_app/globals/widgets/my_inkwell.dart';
import 'package:gym_app/globals/widgets/wheal_scroller.dart';
import 'package:gym_app/models/muscle.dart';
import 'package:gym_app/models/sets.dart';
import 'package:gym_app/models/trainings/created_trining.dart';
import 'package:gym_app/riverpod/appstate_provider.dart';
import 'package:gym_app/riverpod/bodyWeight.dart';
import 'package:gym_app/riverpod/create_new_training.dart';

class CreateNewTrainingWidget extends ConsumerStatefulWidget {
  const CreateNewTrainingWidget({super.key});

  @override
  ConsumerState<CreateNewTrainingWidget> createState() =>
      _CreateNewTrainingWidgetState();
}

class _CreateNewTrainingWidgetState
    extends ConsumerState<CreateNewTrainingWidget> {
  bool isDumbbell = false;
  final TextEditingController trainingsName = TextEditingController();
  int bodyWeightPercent = 0;
  final List<Muscle> selectedMusclesList = [];
  // final createdTraining = CreatedTrining.standard();
  @override
  Widget build(BuildContext context) {
    final standardTrainingsNumber =
        ref.watch(appStateProvider).allStandardTraining.length;
    print('standardTrainingsNumber: $standardTrainingsNumber');
    final List<Muscle> allMuscleList = ref.watch(targetedMuscleListProvider);
    final bodyWeight = ref.watch(bodyWeightProvider);
    final mainTargetedMuscle = ref.watch(mainTargetedMuscleNameProvider);
    return Material(
      child: MyContainer(
        height: context.height,
        width: context.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: SizedBox(
                  width: context.width * 0.7,
                  child: TextFormField(
                    controller: trainingsName,
                    autofocus: true,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                      ),
                      labelText: 'Trainings name',
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text(
                      'Dumbbell ?',
                      style: TextStyle(color: Colors.white),
                    ),
                    Checkbox(
                      activeColor: Colors.blue,
                      checkColor: Colors.white,
                      side: const BorderSide(color: Colors.white),
                      value: isDumbbell,
                      onChanged: (value) {
                        setState(() {
                          isDumbbell = value!;
                        });
                      },
                    ),
                    Expanded(child: SizedBox()),
                    Text(
                      'Body weight %',
                      style: TextStyle(color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: WhealScroller(
                          lastValue: 100,
                          width: context.width * 0.07,
                          height: 60,
                          onValueChange: (value) {
                            setState(() {
                              bodyWeightPercent = value;
                            });
                          }),
                    ),
                  ],
                ),
              ),
              Text(
                'Targeted muscles: ',
                style: TextStyle(color: Colors.white),
              ),
              Container(
                width: context.width * 0.9,
                height: context.height * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (final muscle in allMuscleList)
                        if (!selectedMusclesList.contains(muscle))
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MyInkwell(
                              onTap: () {
                                setState(() {
                                  selectedMusclesList.add(muscle);
                                });
                              },
                              width: context.width * 0.6,
                              height: 35,
                              child: Text(muscle.name,
                                  style: const TextStyle(color: Colors.white)),
                            ),
                          ),
                    ],
                  ),
                ),
              ),
              for (int i = 0; i < selectedMusclesList.length; i++)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: context.width * 0.5,
                        child: Text(selectedMusclesList[i].name,
                            style: const TextStyle(color: Colors.white)),
                      ),
                      WhealScroller(
                          startValue: 30,
                          lastValue: 100,
                          width: 20,
                          height: 50,
                          onValueChange: (value) {
                            setState(() {
                              selectedMusclesList[i] =
                                  selectedMusclesList[i].copyWith(value / 100);
                              print(
                                  '${selectedMusclesList[i].name} : ${selectedMusclesList[i].traningsdensity}');
                            });
                          }),
                      Expanded(child: SizedBox()),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedMusclesList.removeAt(i);
                            });
                          },
                          child: Icon(Icons.delete, color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyInkwell(
                  onTap: () {
                    final training = CreatedTrining(
                      name: trainingsName.text,
                      isDumbbell: isDumbbell,
                      bodyWeightPercent: bodyWeightPercent / 100,
                      targetedMuscles: selectedMusclesList,
                      bodyWeight: bodyWeight,
                      mainTargetedMuscle: mainTargetedMuscle,
                      sets: [
                        Sets(reps: 0, weight: 0),
                        Sets(reps: 0, weight: 0),
                        Sets(reps: 0, weight: 0),
                      ],
                    );

                    ref
                        .read(appStateProvider.notifier)
                        .addStanderdTraining(training);

                    print('standardTrainingsNumber: $standardTrainingsNumber');
                    context.pop();
                  },
                  child: Text(
                    'Save',
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  height: 40,
                  width: context.width * 0.3,
                ),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
