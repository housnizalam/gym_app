import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/riverpod/appstate_provider.dart';

final bodyWeightProvider = StateProvider<int>((ref) {
  final bodyWeight =
      ref.watch(appStateProvider.select((value) => value.user?.bodyWeight)) ??
          80;
  return bodyWeight;
});
