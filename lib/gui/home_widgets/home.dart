import 'package:flutter/material.dart';
import 'package:gym_app/globals/extensionen/date_time.dart';
import 'package:gym_app/globals/extensionen/navigator.dart';
import 'package:gym_app/globals/widgets/my_container.dart';
import 'package:gym_app/globals/widgets/my_inkwell.dart';
import 'package:gym_app/gui/home_widgets/calender/calender.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.6,
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(DateTime.now().formattedDate),
      ),
      body: MyContainer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MyInkwell(
                height: 60,
                width: 100,
                onTap: () {},
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
