import 'package:intl/intl.dart';

class DateHelper {
  String getTodayDate() {
    final DateTime now = DateTime.now();
    final String formattedDate = DateFormat('d MMMM').format(now);
    return formattedDate;
  }
}
