class Money {
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
}
