class RatingThresholds {
  final double poor;
  final double unsatisfactory;
  final double fair;
  final double good;
  final double excellent;

  const RatingThresholds({
    required this.poor,
    required this.unsatisfactory,
    required this.fair,
    required this.good,
    required this.excellent,
  }) : assert(
         0 <= poor &&
             poor < unsatisfactory &&
             unsatisfactory < fair &&
             fair < good &&
             good < excellent &&
             excellent <= 1.0,
         'Thresholds must be in ascending order (0-1)',
       );
}
