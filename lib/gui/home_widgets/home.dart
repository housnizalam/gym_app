import 'package:flutter/material.dart';
import 'package:gym_app/globals/extensionen/date_time.dart';
import 'package:gym_app/globals/extensionen/navigator.dart';
import 'package:gym_app/globals/widgets/my_container.dart';
import 'package:gym_app/globals/widgets/my_inkwell.dart';
import 'package:gym_app/gui/home_widgets/calender_widget/calender.dart';
import 'package:gym_app/gui/home_widgets/training_widget/main_training_widget.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.6,
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue[900]!, Colors.black]),
          ),
          child: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text(DateTime.now().formattedDate,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ),
      ),
      body: MyContainer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MyInkwell(
                height: 60,
                width: 100,
                onTap: () {
                  context.animateToAsPush(page: const MainTrainingWidget());
                },
                child: const Text(
                  'Start Training',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              MyInkwell(
                height: 60,
                width: 100,
                onTap: () {},
                child: const Text(
                  'Statistcs',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              MyInkwell(
                height: 60,
                width: 100,
                onTap: () {
                  context.animateToAsPush(page: const CalenderWidget());
                },
                child: const Text(
                  'Calender',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
