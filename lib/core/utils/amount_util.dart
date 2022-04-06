import 'package:intl/intl.dart';

class AmountUtil {
  static String removeDotFromAmount(String amount) {
    if (amount.contains('.')) {
      return amount.split('.')[0];
    } else {
      return amount;
    }
  }

  static String formatAmount(double value) {
    final f = NumberFormat('#,##0.00', 'en_US');
    return f.format(value);
  }
}
