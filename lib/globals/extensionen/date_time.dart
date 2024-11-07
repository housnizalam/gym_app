extension DateTimeExtension on DateTime {
  String get formattedDate =>
      '${day > 9 ? day : '0$day'}/${month > 9 ? month : '0$month'}/$year';
  bool isSameDay(DateTime other) =>
      year == other.year && month == other.month && day == other.day;
  String get todayAsWeakday {
    switch (weekday) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        return '';
    }
  }
}
