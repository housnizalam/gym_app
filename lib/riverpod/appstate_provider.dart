
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/models/appstate.dart';

class AppStateNotifier extends StateNotifier<AppState> {
  AppStateNotifier() : super(AppState(days: []));

}


final appStateProvider = StateNotifierProvider<AppStateNotifier, AppState>((ref) {
  return AppStateNotifier();
});