import 'package:jiffy/jiffy.dart';

/// [DateUtil] class used to format datetime
class DateUtil {
  static String formatDisplayDate(DateTime dateTime) {
    return Jiffy(dateTime).format("do MMMM, yyyy");
  }
}
