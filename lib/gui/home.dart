import 'package:flutter/material.dart';
import 'package:gym_app/generals/extensionen/date_time.dart';
import 'package:gym_app/generals/extensionen/navigator.dart';
import 'package:gym_app/gui/home_widgets/calender.dart';

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
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('Start Training'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Statistcs'),
              ),
              ElevatedButton(
                onPressed: () {
                  context.animateToAsPush(page: CalenderWidget());
                },
                child: Text('Calender'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
