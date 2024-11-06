import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedDayProvider = StateProvider<DateTime>((ref) => DateTime.now());
final focusNodeProvider = StateProvider<DateTime>((ref) => DateTime.now());
