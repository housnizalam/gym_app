import 'package:flutter/material.dart';
import 'package:gym_app/globals/extensionen/date_time.dart';
import 'package:gym_app/globals/extensionen/navigator.dart';
import 'package:gym_app/globals/extensionen/size_extension.dart';
import 'package:gym_app/globals/widgets/my_container.dart';
import 'package:gym_app/globals/widgets/my_inkwell.dart';
import 'package:gym_app/globals/widgets/my_scafold.dart';
import 'package:gym_app/gui/home_widgets/calendar_widget/calendar.dart';
import 'package:gym_app/gui/home_widgets/statistic_tables/user_table.dart';
import 'package:gym_app/gui/home_widgets/training_widget/main_training_widget.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
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
      drawer: Drawer(
        width: context.width * 0.7,
      ),
      floatingButton: MyInkwell(
        onTap: () => context.animateToAsPush(page: const MainTrainingWidget()),
        borderRadius: 70,
        height: 70,
        width: 70,
        child: const Text('Start',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),
      onleftTitel: () => context.animateToAsPush(
        page: const CalenderWidget(),
      ),
      leftTitel: 'Calender',
      rightTitel: 'Statistics',
      body: MyContainer(
        width: context.width,
        height: context.height,
        child: const SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              UserTable(),
            ],
          ),
        ),
      ),
    );
  }
}
