import 'dart:convert';
import 'package:gym_app/models/trainings/created_trining.dart';
import 'package:gym_app/storage/json.converter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:gym_app/models/day.dart';
import 'package:gym_app/models/saved_trainingsday.dart';

class HiveService {
  static const String _daysBoxName = 'days_box';
  static const String _savedDaysBoxName = 'saved_days_box';
  static const String _createdTrainingsBoxName = 'created_trainings_box'; // NEU
  static const String _metaBoxName = 'app_meta_box';

  static const String _daysKey = 'days';
  static const String _savedDaysKey = 'saved_days';
  static const String _createdTrainingsKey = 'created_trainings'; // NEU

  static late Box _daysBox;
  static late Box _savedDaysBox;
  static late Box _createdTrainingsBox; // NEU

  /// Hive initialisieren und alle Boxen öffnen.
  static Future<void> init() async {
    await Hive.initFlutter();
    _daysBox = await Hive.openBox(_daysBoxName);
    _savedDaysBox = await Hive.openBox(_savedDaysBoxName);
    _createdTrainingsBox = await Hive.openBox(_createdTrainingsBoxName); // NEU
  }

  /// Löscht alle App-Daten in Hive (z. B. vor einem Release ohne Testdaten).
  static Future<void> clearAllData() async {
    await Hive.initFlutter();

    if (Hive.isBoxOpen(_daysBoxName)) {
      await Hive.box(_daysBoxName).close();
    }
    if (Hive.isBoxOpen(_savedDaysBoxName)) {
      await Hive.box(_savedDaysBoxName).close();
    }
    if (Hive.isBoxOpen(_createdTrainingsBoxName)) {
      await Hive.box(_createdTrainingsBoxName).close();
    }

    await Hive.deleteBoxFromDisk(_daysBoxName);
    await Hive.deleteBoxFromDisk(_savedDaysBoxName);
    await Hive.deleteBoxFromDisk(_createdTrainingsBoxName);
  }

  /// Löscht vorhandene Testdaten genau einmal in Release-Builds.
  static Future<void> clearAllDataOnceForRelease({
    String wipeVersion = '2026_04_release_wipe',
  }) async {
    await Hive.initFlutter();

    final metaBox = await Hive.openBox(_metaBoxName);
    final markerKey = 'release_wipe_done_$wipeVersion';
    final alreadyWiped = metaBox.get(markerKey, defaultValue: false) as bool;
    if (alreadyWiped) return;

    await clearAllData();
    await metaBox.put(markerKey, true);
  }

  // ── Days ──────────────────────────────────────────────────────────────────

  static Future<void> saveDays(List<Day> days) async {
    final json = days.map((d) => dayToJson(d)).toList();
    await _daysBox.put(_daysKey, jsonEncode(json));
  }

  static List<Day> loadDays() {
    final String? raw = _daysBox.get(_daysKey);
    if (raw == null) return [];
    return (jsonDecode(raw) as List).map((j) => dayFromJson(j)).toList();
  }

  // ── SavedDays ─────────────────────────────────────────────────────────────

  static Future<void> saveSavedDays(List<SavedTrainingsday> savedDays) async {
    final json = savedDays.map((d) => savedDayToJson(d)).toList();
    await _savedDaysBox.put(_savedDaysKey, jsonEncode(json));
  }

  static List<SavedTrainingsday> loadSavedDays() {
    final String? raw = _savedDaysBox.get(_savedDaysKey);
    if (raw == null) return [];
    return (jsonDecode(raw) as List).map((j) => savedDayFromJson(j)).toList();
  }

  // ── CreatedTrinings ───────────────────────────────────────────────────────

  /// Speichert alle benutzerdefinierten Trainings als JSON.
  static Future<void> saveCreatedTrainings(
      List<CreatedTrining> trainings) async {
    final json = trainings.map((t) => createdTriningToJson(t)).toList();
    await _createdTrainingsBox.put(_createdTrainingsKey, jsonEncode(json));
  }

  /// Lädt alle benutzerdefinierten Trainings aus Hive.
  static List<CreatedTrining> loadCreatedTrainings() {
    final String? raw = _createdTrainingsBox.get(_createdTrainingsKey);
    if (raw == null) return [];
    return (jsonDecode(raw) as List)
        .map((j) => createdTriningFromJson(j))
        .toList();
  }
}
