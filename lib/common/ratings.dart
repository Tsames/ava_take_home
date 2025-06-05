import 'dart:ui';

enum Rating {
  excellent('Excellent', 5, Color(0xFF48A388)), // Green
  good('Good', 4, Color(0xFF5CC368)), // Light green
  fair('Fair', 3, Color(0xFFE6B652)), // Amber
  unsatisfactory('Unsatisfactory', 2, Color(0xFFF2C388)), // Red
  poor('Poor', 1, Color(0xFFF2A088)); // Dark red

  final String label;
  final int numericValue;
  final Color color;

  const Rating(this.label, this.numericValue, this.color);
}
