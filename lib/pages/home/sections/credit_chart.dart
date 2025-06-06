import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meet_ava_take_home/common/styles/app_text_styles.dart';

import '../../../common/repository/state_provider.dart';
import '../../../common/styles/app_colors.dart';

class CreditChart extends ConsumerStatefulWidget {
  const CreditChart({super.key});

  @override
  ConsumerState<CreditChart> createState() => _CreditChartState();
}

class _CreditChartState extends ConsumerState<CreditChart> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 3000), vsync: this)..forward();
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<FlSpot> _getAnimatedSpots(double progress) {
    final fullSpots = const [
      FlSpot(0, 610),
      FlSpot(1, 600),
      FlSpot(2, 625),
      FlSpot(3, 650),
      FlSpot(4, 635),
      FlSpot(5, 665),
      FlSpot(6, 650),
      FlSpot(7, 655),
      FlSpot(8, 650),
      FlSpot(9, 675),
      FlSpot(10, 700),
      FlSpot(11, 695),
    ];
    final visibleCount = (fullSpots.length * progress).ceil();
    return fullSpots.sublist(0, visibleCount);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(chartAnimationTriggerProvider, (previous, next) {
      _controller
        ..reset()
        ..forward();
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Credit Score', style: AppTextStyles.cardHeadlineStyle),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(color: AppColors.middleGreen, borderRadius: BorderRadius.circular(14)),
              child: Text('+2pts', style: AppTextStyles.cardPointsStyle),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text('Updated Today | Next May 12', style: AppTextStyles.cardBodyDetailsStyle),
        const SizedBox(height: 10),
        Text(
          'Experian',
          style: AppTextStyles.cardSmallBodyStyle.copyWith(color: AppColors.pink, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 24),
        _buildChart(),
        const SizedBox(height: 8),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Last 12 months',
                textAlign: TextAlign.center,
                style: AppTextStyles.cardSmallBodyStyle.copyWith(
                  color: AppColors.deepPurple,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Score calculated using VantageScore 3.0',
                textAlign: TextAlign.center,
                style: AppTextStyles.cardSmallBodyStyle.copyWith(
                  color: AppColors.lightPurple,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildChart() {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return SizedBox(
          height: 100,
          child: LineChart(
            LineChartData(
              gridData: FlGridData(show: false),
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 40,
                    interval: 50,
                    getTitlesWidget: (value, meta) {
                      return Text(value.toInt().toString(), style: const TextStyle(fontSize: 12, color: Colors.grey));
                    },
                  ),
                ),
                bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
              borderData: FlBorderData(show: false),
              minX: 0,
              maxX: 11,
              minY: 600,
              maxY: 700,
              lineBarsData: [
                LineChartBarData(
                  spots: _getAnimatedSpots(_animation.value),
                  isCurved: false,
                  color: AppColors.middleGreen,
                  barWidth: 2,
                  dotData: FlDotData(
                    show: true,
                    getDotPainter: (spot, percent, barData, index) {
                      if (index < _getAnimatedSpots(_animation.value).length) {
                        return FlDotCirclePainter(
                          radius: 3,
                          color: AppColors.white,
                          strokeWidth: 2,
                          strokeColor: AppColors.middleGreen,
                        );
                      }
                      return FlDotCirclePainter(radius: 0);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
