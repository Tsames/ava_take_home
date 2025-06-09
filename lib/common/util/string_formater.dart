import 'package:intl/intl.dart';

class StringFormater {
  String formatDollars(int amount) {
    final absAmount = amount.abs();
    final sign = amount < 0 ? '-' : '';

    if (absAmount < 1000) {
      return '$sign\$$absAmount';
    }

    final parts = absAmount.toString().split('').reversed.toList();
    final buffer = StringBuffer(sign + r'$');

    for (int i = parts.length - 1; i >= 0; i--) {
      buffer.write(parts[i]);
      if (i > 0 && i % 3 == 0) {
        buffer.write(',');
      }
    }

    return buffer.toString();
  }

  String formatPercent(int balance, int total) {
    return "${((balance / total) * 100).toInt()}%";
  }

  String formattedWithOrdinalAndDay(DateTime date) {
    final day = date.day;
    final ordinal = _getOrdinal(day);
    return DateFormat("MMM d'$ordinal', yyyy (EEEE)").format(date);
  }

  String _getOrdinal(int day) {
    if (day >= 11 && day <= 13) return 'th';
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }
}
