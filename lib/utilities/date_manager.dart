import 'package:intl/intl.dart';

class DateManager {
  static String formattedDate({required String dateString}) {
    final date = DateFormat('yyyy-MM-dd').parse(dateString);

    return DateFormat('yyyy-MM-dd').format(date);
  }
}
