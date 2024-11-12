import 'package:flutter/material.dart';
import 'package:gym_app/globals/widgets/my_container.dart';
import 'package:gym_app/models/trainings/training.dart';

class EditTrainingWidget extends StatelessWidget {
  const EditTrainingWidget({super.key, required this.training});
  final Training training;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: MyContainer(
        child: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Hero(
                      tag: training.name,
                      child: Text(
                        training.name,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
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
