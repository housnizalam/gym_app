import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/globals/extensionen/size_extension.dart';
import 'package:gym_app/globals/widgets/my_inkwell.dart';
import 'package:gym_app/gui/home_widgets/training_widget/main_training_widgets/page_widgets/creat_day_widgets/add_traininig_widget/choose_training_widget/choose_training_widget.dart';

class AddTrainingWidget extends ConsumerStatefulWidget {
  const AddTrainingWidget({super.key});

  @override
  ConsumerState<AddTrainingWidget> createState() => _AddTrainingWidgetState();
}

class _AddTrainingWidgetState extends ConsumerState<AddTrainingWidget> {
  void _showAddTrainingSheet(BuildContext context) {
    showModalBottomSheet(
      
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return ChooseTrainingWidget();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: MyInkwell(
            width: context.width * 0.1,
            height: context.width * 0.1,
            onTap: () => _showAddTrainingSheet(context),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
