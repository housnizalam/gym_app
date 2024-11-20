import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/models/day.dart';

final selectedDayProvider = StateProvider<DateTime>((ref) => DateTime.now());
final focusNodeProvider = StateProvider<DateTime>((ref) => DateTime.now());
final calenderSelectedTeainingsDay = StateProvider<Day?>(
  (ref) => null,
);
