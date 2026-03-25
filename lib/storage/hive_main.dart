import 'dart:convert';
import 'package:gym_app/storage/json.converter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:gym_app/models/day.dart';
import 'package:gym_app/models/saved_trainingsday.dart';

class HiveService {
  static const String _daysBoxName = 'days_box';
  static const String _savedDaysBoxName = 'saved_days_box';
  static const String _daysKey = 'days';
  static const String _savedDaysKey = 'saved_days';

  static late Box _daysBox;
  static late Box _savedDaysBox;

  // تهيئة Hive
  static Future<void> init() async {
    await Hive.initFlutter();
    _daysBox = await Hive.openBox(_daysBoxName);
    _savedDaysBox = await Hive.openBox(_savedDaysBoxName);
  }

  // حفظ الأيام
  static Future<void> saveDays(List<Day> days) async {
    final List<Map<String, dynamic>> daysJson =
        days.map((day) => dayToJson(day)).toList();
    await _daysBox.put(_daysKey, jsonEncode(daysJson));
  }

  // قراءة الأيام
  static List<Day> loadDays() {
    final String? daysString = _daysBox.get(_daysKey);
    if (daysString == null) return [];
    final List<dynamic> daysJson = jsonDecode(daysString);
    return daysJson.map((json) => dayFromJson(json)).toList();
  }

  // حفظ الأيام المحفوظة
  static Future<void> saveSavedDays(List<SavedTrainingsday> savedDays) async {
    final List<Map<String, dynamic>> savedDaysJson =
        savedDays.map((day) => savedDayToJson(day)).toList();
    await _savedDaysBox.put(_savedDaysKey, jsonEncode(savedDaysJson));
  }

  // قراءة الأيام المحفوظة
  static List<SavedTrainingsday> loadSavedDays() {
    final String? savedDaysString = _savedDaysBox.get(_savedDaysKey);
    if (savedDaysString == null) return [];
    final List<dynamic> savedDaysJson = jsonDecode(savedDaysString);
    return savedDaysJson.map((json) => savedDayFromJson(json)).toList();
  }
}