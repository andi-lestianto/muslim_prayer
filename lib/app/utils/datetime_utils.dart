import 'package:intl/intl.dart';

class DateTimeUtils {
  String getTimeNow() {
    return DateFormat('dd MMMM yyyy~HH:mm').format(DateTime.now());
  }

  String getMonthNow() {
    return DateFormat('MM').format(DateTime.now());
  }

  String getYearNow() {
    return DateTime.now().year.toString();
  }
}
