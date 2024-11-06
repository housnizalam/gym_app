extension DateTimeExtension on DateTime {
  String get formattedDate => '${day>9?day:'0$day'}/${month>9?month:'0$month'}/$year';
  bool isSameDay(DateTime other) => year == other.year && month == other.month && day == other.day;
  }