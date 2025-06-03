import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CreditChart extends StatelessWidget {
  const CreditChart({super.key});

  @override
  Widget build(BuildContext context) {
    final cardBackgroundColor = Theme.of(context).colorScheme.primaryContainer;
    final cardBorderColor = Theme.of(context).colorScheme.outline;
    final headlineText = Theme.of(context).textTheme.headlineMedium;
    final cardHeadlineText = Theme.of(context).textTheme.headlineSmall;
    final cardBodyLightText = Theme.of(context).textTheme.bodyMedium;
    final cardBodyPinkText = Theme.of(context).textTheme.bodySmall;
    final cardPointsText = Theme.of(context).textTheme.labelMedium;
    final cardPointsColor = Theme.of(context).colorScheme.tertiary;

    final chartColor = Theme.of(context).colorScheme.tertiary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Chart', style: headlineText),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: cardBackgroundColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: cardBorderColor, width: 1.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Credit Score', style: cardHeadlineText),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: cardPointsColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text('+2pts', style: cardPointsText),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text('Updated Today | Next May 12', style: cardBodyLightText),
              const SizedBox(height: 10),
              Text('Experian', style: cardBodyPinkText),
              const SizedBox(height: 24),
              _buildChart(chartColor),
              const SizedBox(height: 8),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Last 12 months',
                      textAlign: TextAlign.center,
                      style: cardBodyPinkText?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    const Text(
                      'Score calculated using VantageScore 3.0',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildChart(Color chartColor) {
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
                  return Text(
                    value.toInt().toString(),
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  );
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
              spots: [
                const FlSpot(0, 610),
                const FlSpot(1, 600),
                const FlSpot(2, 625),
                const FlSpot(3, 650),
                const FlSpot(4, 635),
                const FlSpot(5, 665),
                const FlSpot(6, 650),
                const FlSpot(7, 655),
                const FlSpot(8, 650),
                const FlSpot(9, 675),
                const FlSpot(10, 700),
                const FlSpot(11, 695),
              ],
              isCurved: false,
              color: chartColor,
              barWidth: 2,
              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, percent, barData, index) =>
                    FlDotCirclePainter(
                      radius: 3,
                      color: Colors.white,
                      strokeWidth: 2,
                      strokeColor: chartColor,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
