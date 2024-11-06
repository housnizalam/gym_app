import 'package:flutter/material.dart';
import 'package:gym_app/gui/user_widgets/sign_in_seite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInWidget(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       print('Appstate: ${appState.days.first.chestDensity}');
//       _counter++;
//     });
//   }

//   late final AppState appState;

//   @override
//   void initState() {
//     super.initState();
//     final sets = const Sets(reps: 10, weight: 10);
//     final benchPress = ChestSubTraining(
//         date: DateTime.now(),
//         name: 'Bench Press',
//         sets: [
//           sets,
//           sets,
//           sets
//         ],
//         targetetMuscles: [
//           ChestMuscle(traningsdensity: 0.7, recoveryDuration: 3)
//         ]);

//     final chestTraining =
//         ChestTraining(date: DateTime.now(), subTrainings: [benchPress]);

//     final day1 = Day(
//         date: DateTime.now().subtract(const Duration(days: 4)),
//         trainings: [chestTraining]);

//     final day2 = Day(
//         date: DateTime.now().subtract(const Duration(days: 3)),
//         trainings: [chestTraining]);

//     final day3 = Day(
//         date: DateTime.now().subtract(const Duration(days: 2)),
//         trainings: [chestTraining]);

//     final day4 = Day(
//         date: DateTime.now().subtract(const Duration(days: 1)),
//         trainings: [chestTraining]);
//     final day5 = Day(date: DateTime.now(), trainings: [chestTraining]);
//     appState = AppState(days: [day1, day2, day3, day4, day5]);
//     // appState.muscles.add(ChestMuscle(traningsdensity: 0.7, recoveryDuration: 3));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
