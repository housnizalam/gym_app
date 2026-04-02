import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/globals/extensionen/navigator.dart';
import 'package:gym_app/globals/extensionen/size_extension.dart';
import 'package:gym_app/globals/widgets/my_container.dart';
import 'package:gym_app/globals/widgets/my_inkwell.dart';
import 'package:gym_app/models/day.dart';
import 'package:gym_app/models/saved_trainingsday.dart';
import 'package:gym_app/riverpod/appstate_provider.dart';

class AddSavedDayWidget extends ConsumerStatefulWidget {
  const AddSavedDayWidget({super.key, required this.day});
  final Day day;

  @override
  ConsumerState<AddSavedDayWidget> createState() => _AddSavedDayWidgetState();
}

class _AddSavedDayWidgetState extends ConsumerState<AddSavedDayWidget> {
  final TextEditingController controller = TextEditingController();
  final List<String> savedDays = [];
  bool istExist = false;

  @override
  Widget build(BuildContext context) {
    final savedTrainingsdays =
        ref.watch(appStateProvider.select((value) => value.savedTrainingsdays));
    if (savedTrainingsdays != null && savedTrainingsdays.isNotEmpty) {
      savedDays.addAll(savedTrainingsdays.map((e) => e.name).toList());
    }

    return MyContainer(
      height: context.height * 0.5,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                right: context.width * 0.1,
                left: context.width * 0.1,
                top: context.height * 0.05),
            child: TextFormField(
              onChanged: (value) {
                istExist = savedDays.contains(value.trim());
                setState(() {}); // Aktualisiere die UI
              },
              controller: controller,
              autofocus: true,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  borderSide: BorderSide(color: Colors.grey, width: 2.0),
                ),
                labelText: 'Saved Day Name',
                labelStyle: TextStyle(color: Colors.white),
              ),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          if (istExist)
            const Text(
              'This name already exists',
              style: TextStyle(color: Colors.red),
            ),
          if (controller.text.trim().isNotEmpty && !istExist)
            MyInkwell(
              height: 50,
              width: context.width * 0.5,
              onTap: () {
                final name = controller.text.trim();
                ref.read(appStateProvider.notifier).addSavedDay(
                    SavedTrainingsday(name: name, day: widget.day));
                context.pop();
              },
              child: const Text(
                'Save',
                style: TextStyle(color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}
