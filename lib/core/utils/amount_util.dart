import 'package:intl/intl.dart';

/// [AmountUtil] class used to format money
class AmountUtil {
  static String formatAmount(double value) {
    final f = NumberFormat('₦#,##0', 'en_US');
    return f.format(value);
  }
}
