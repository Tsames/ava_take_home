import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            // Custom Status Bar and Header
            _buildHeader(context),
            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    // _buildChartSection(context),
                    // const SizedBox(height: 24),
                    // _buildCreditFactors(context),
                    // const SizedBox(height: 24),
                    // _buildAccountDetails(context),
                    // const SizedBox(height: 24),
                    // _buildCreditCardAccounts(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 24,
          top: 8,
      ),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        )
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.settings, color: Colors.white),
              Text(
                'Home',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Theme.of(context).colorScheme.primaryContainer
                )
              ),
              const SizedBox(width: 24),
            ],
          ),
          const SizedBox(height: 16),
          _buildCreditScoreCard(context)
        ],
      ),
    );
  }

  Widget _buildCreditScoreCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline,
          width: 1.0,
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Credit Score',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.onPrimary
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFDCFCE7),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'FREE',
                        style: TextStyle(
                          color: Color(0xFF166534),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  'Updated Today | Next May 12',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Experian',
                  style: TextStyle(
                    color: Color(0xFF6B46C1),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          _buildCircularProgress(720, 850),
        ],
      ),
    );
  }

  Widget _buildCircularProgress(int value, int maxValue) {
    final percentage = value / maxValue;
    return SizedBox(
      width: 80,
      height: 80,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: CircularProgressIndicator(
              value: percentage,
              strokeWidth: 6,
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF10B981)),
            ),
          ),
          Text(
            value.toString(),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildChartSection(BuildContext context) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       const Text(
  //         'Chart',
  //         style: TextStyle(
  //           fontSize: 20,
  //           fontWeight: FontWeight.w600,
  //         ),
  //       ),
  //       const SizedBox(height: 12),
  //       Container(
  //         padding: const EdgeInsets.all(16),
  //         decoration: BoxDecoration(
  //           color: Colors.white,
  //           borderRadius: BorderRadius.circular(12),
  //           boxShadow: [
  //             BoxShadow(
  //               color: Colors.grey.withOpacity(0.1),
  //               spreadRadius: 1,
  //               blurRadius: 4,
  //               offset: const Offset(0, 2),
  //             ),
  //           ],
  //         ),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Row(
  //               children: [
  //                 const Text(
  //                   'Credit Score',
  //                   style: TextStyle(
  //                     fontSize: 16,
  //                     fontWeight: FontWeight.w500,
  //                   ),
  //                 ),
  //                 const SizedBox(width: 8),
  //                 Container(
  //                   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
  //                   decoration: BoxDecoration(
  //                     color: const Color(0xFFDCFCE7),
  //                     borderRadius: BorderRadius.circular(4),
  //                   ),
  //                   child: const Text(
  //                     'FREE',
  //                     style: TextStyle(
  //                       color: Color(0xFF166534),
  //                       fontSize: 12,
  //                       fontWeight: FontWeight.w600,
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             const SizedBox(height: 4),
  //             const Text(
  //               'Updated Today | Next May 12',
  //               style: TextStyle(
  //                 color: Colors.grey,
  //                 fontSize: 12,
  //               ),
  //             ),
  //             const SizedBox(height: 4),
  //             const Text(
  //               'Experian',
  //               style: TextStyle(
  //                 color: Color(0xFF6B46C1),
  //                 fontSize: 12,
  //                 fontWeight: FontWeight.w500,
  //               ),
  //             ),
  //             const SizedBox(height: 16),
  //             SizedBox(
  //               height: 200,
  //               child: LineChart(
  //                 LineChartData(
  //                   gridData: FlGridData(show: false),
  //                   titlesData: FlTitlesData(
  //                     leftTitles: AxisTitles(
  //                       sideTitles: SideTitles(
  //                         showTitles: true,
  //                         reservedSize: 40,
  //                         getTitlesWidget: (value, meta) {
  //                           return Text(
  //                             value.toInt().toString(),
  //                             style: const TextStyle(fontSize: 12, color: Colors.grey),
  //                           );
  //                         },
  //                       ),
  //                     ),
  //                     bottomTitles: AxisTitles(
  //                       sideTitles: SideTitles(showTitles: false),
  //                     ),
  //                     topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
  //                     rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
  //                   ),
  //                   borderData: FlBorderData(show: false),
  //                   minX: 0,
  //                   maxX: 11,
  //                   minY: 600,
  //                   maxY: 750,
  //                   lineBarsData: [
  //                     LineChartBarData(
  //                       spots: [
  //                         const FlSpot(0, 650),
  //                         const FlSpot(1, 670),
  //                         const FlSpot(2, 660),
  //                         const FlSpot(3, 680),
  //                         const FlSpot(4, 690),
  //                         const FlSpot(5, 700),
  //                         const FlSpot(6, 710),
  //                         const FlSpot(7, 705),
  //                         const FlSpot(8, 715),
  //                         const FlSpot(9, 720),
  //                         const FlSpot(10, 720),
  //                         const FlSpot(11, 720),
  //                       ],
  //                       isCurved: true,
  //                       color: const Color(0xFF10B981),
  //                       barWidth: 2,
  //                       dotData: FlDotData(
  //                         show: true,
  //                         getDotPainter: (spot, percent, barData, index) =>
  //                             FlDotCirclePainter(
  //                               radius: 3,
  //                               color: const Color(0xFF10B981),
  //                               strokeWidth: 0,
  //                             ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //             const SizedBox(height: 8),
  //             const Text(
  //               'Last 12 months',
  //               textAlign: TextAlign.center,
  //               style: TextStyle(
  //                 color: Colors.grey,
  //                 fontSize: 12,
  //               ),
  //             ),
  //             const Text(
  //               'Score calculated using VantageScore 3.0',
  //               textAlign: TextAlign.center,
  //               style: TextStyle(
  //                 color: Colors.grey,
  //                 fontSize: 10,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }
  //
  // Widget _buildCreditFactors(BuildContext context) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       const Text(
  //         'Credit factors',
  //         style: TextStyle(
  //           fontSize: 20,
  //           fontWeight: FontWeight.w600,
  //         ),
  //       ),
  //       const SizedBox(height: 12),
  //       Row(
  //         children: [
  //           Expanded(child: _buildFactorCard('Payment\nHistory', '100%', 'HIGH IMPACT', Colors.green)),
  //           const SizedBox(width: 8),
  //           Expanded(child: _buildFactorCard('Credit Card\nUtilization', '4%', 'LOW IMPACT', Colors.blue)),
  //           const SizedBox(width: 8),
  //           Expanded(child: _buildFactorCard('Derogatory\nMarks', '0', 'MED', Colors.teal)),
  //         ],
  //       ),
  //     ],
  //   );
  // }
  //
  // Widget _buildFactorCard(String title, String value, String impact, Color impactColor) {
  //   return Container(
  //     padding: const EdgeInsets.all(16),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(12),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.grey.withOpacity(0.1),
  //           spreadRadius: 1,
  //           blurRadius: 4,
  //           offset: const Offset(0, 2),
  //         ),
  //       ],
  //     ),
  //     child: Column(
  //       children: [
  //         Text(
  //           title,
  //           textAlign: TextAlign.center,
  //           style: const TextStyle(
  //             color: Colors.grey,
  //             fontSize: 12,
  //           ),
  //         ),
  //         const SizedBox(height: 8),
  //         Text(
  //           value,
  //           style: const TextStyle(
  //             fontSize: 24,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //         const SizedBox(height: 8),
  //         Container(
  //           padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
  //           decoration: BoxDecoration(
  //             color: impactColor.withOpacity(0.1),
  //             borderRadius: BorderRadius.circular(4),
  //           ),
  //           child: Text(
  //             impact,
  //             style: TextStyle(
  //               color: impactColor,
  //               fontSize: 10,
  //               fontWeight: FontWeight.w600,
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  //
  // Widget _buildAccountDetails(BuildContext context) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       const Text(
  //         'Account details',
  //         style: TextStyle(
  //           fontSize: 20,
  //           fontWeight: FontWeight.w600,
  //         ),
  //       ),
  //       const SizedBox(height: 12),
  //       Container(
  //         padding: const EdgeInsets.all(16),
  //         decoration: BoxDecoration(
  //           color: Colors.white,
  //           borderRadius: BorderRadius.circular(12),
  //           boxShadow: [
  //             BoxShadow(
  //               color: Colors.grey.withOpacity(0.1),
  //               spreadRadius: 1,
  //               blurRadius: 4,
  //               offset: const Offset(0, 2),
  //             ),
  //           ],
  //         ),
  //         child: Column(
  //           children: [
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Container(
  //                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
  //                   decoration: BoxDecoration(
  //                     color: const Color(0xFF6B46C1),
  //                     borderRadius: BorderRadius.circular(6),
  //                   ),
  //                   child: const Text(
  //                     '\$75',
  //                     style: TextStyle(
  //                       color: Colors.white,
  //                       fontWeight: FontWeight.w600,
  //                     ),
  //                   ),
  //                 ),
  //                 const Text(
  //                   'Spend limit: \$100 Why is it different?',
  //                   style: TextStyle(
  //                     color: Colors.grey,
  //                     fontSize: 12,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             const SizedBox(height: 16),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     const Text(
  //                       '\$50',
  //                       style: TextStyle(
  //                         fontSize: 24,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                     const Text(
  //                       'Balance',
  //                       style: TextStyle(
  //                         color: Colors.grey,
  //                         fontSize: 12,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 Column(
  //                   crossAxisAlignment: CrossAxisAlignment.end,
  //                   children: [
  //                     const Text(
  //                       '\$600',
  //                       style: TextStyle(
  //                         fontSize: 24,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                     const Text(
  //                       'Credit limit',
  //                       style: TextStyle(
  //                         color: Colors.grey,
  //                         fontSize: 12,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //             const SizedBox(height: 16),
  //             const Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Text('Utilization'),
  //                 Text('4%', style: TextStyle(fontWeight: FontWeight.w500)),
  //               ],
  //             ),
  //             const Divider(height: 32),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 const Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Text(
  //                       'Total balance: \$5,390',
  //                       style: TextStyle(
  //                         fontSize: 16,
  //                         fontWeight: FontWeight.w600,
  //                       ),
  //                     ),
  //                     SizedBox(height: 4),
  //                     Text(
  //                       'Total limit: \$200,000',
  //                       style: TextStyle(
  //                         color: Colors.grey,
  //                         fontSize: 12,
  //                       ),
  //                     ),
  //                     SizedBox(height: 8),
  //                     Text(
  //                       'Excellent',
  //                       style: TextStyle(
  //                         color: Color(0xFF10B981),
  //                         fontSize: 12,
  //                         fontWeight: FontWeight.w500,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 Column(
  //                   children: [
  //                     _buildSmallCircularProgress(48, 100),
  //                     const SizedBox(height: 4),
  //                     const Text(
  //                       'months',
  //                       style: TextStyle(
  //                         color: Colors.grey,
  //                         fontSize: 10,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //             const SizedBox(height: 16),
  //             _buildUtilizationBars(),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }
  //
  // Widget _buildSmallCircularProgress(int value, int maxValue) {
  //   final percentage = value / maxValue;
  //   return SizedBox(
  //     width: 50,
  //     height: 50,
  //     child: Stack(
  //       alignment: Alignment.center,
  //       children: [
  //         SizedBox(
  //           width: 50,
  //           height: 50,
  //           child: CircularProgressIndicator(
  //             value: percentage,
  //             strokeWidth: 4,
  //             backgroundColor: Colors.grey[300],
  //             valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF10B981)),
  //           ),
  //         ),
  //         Text(
  //           value.toString(),
  //           style: const TextStyle(
  //             fontSize: 14,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  //
  // Widget _buildUtilizationBars() {
  //   return Column(
  //     children: [
  //       _buildUtilizationBar('0-9%', 0.9, const Color(0xFF10B981)),
  //       _buildUtilizationBar('10-29%', 0.6, const Color(0xFFFBBF24)),
  //       _buildUtilizationBar('30-49%', 0.4, const Color(0xFFF97316)),
  //       _buildUtilizationBar('50-74%', 0.2, const Color(0xFFEF4444)),
  //       _buildUtilizationBar('>75%', 0.1, const Color(0xFFDC2626)),
  //     ],
  //   );
  // }
  //
  // Widget _buildUtilizationBar(String label, double percentage, Color color) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 2),
  //     child: Row(
  //       children: [
  //         Expanded(
  //           child: Container(
  //             height: 12,
  //             decoration: BoxDecoration(
  //               color: Colors.grey[200],
  //               borderRadius: BorderRadius.circular(6),
  //             ),
  //             child: FractionallySizedBox(
  //               alignment: Alignment.centerLeft,
  //               widthFactor: percentage,
  //               child: Container(
  //                 decoration: BoxDecoration(
  //                   color: color,
  //                   borderRadius: BorderRadius.circular(6),
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //         const SizedBox(width: 8),
  //         Text(
  //           label,
  //           style: const TextStyle(
  //             color: Colors.grey,
  //             fontSize: 10,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  //
  // Widget _buildCreditCardAccounts(BuildContext context) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       const Text(
  //         'Open credit card accounts',
  //         style: TextStyle(
  //           fontSize: 20,
  //           fontWeight: FontWeight.w600,
  //         ),
  //       ),
  //       const SizedBox(height: 12),
  //       _buildCreditCardItem('Syncb/Amazon', '\$1,500', '\$5,300', '21%', 'June 20, 2023'),
  //       const SizedBox(height: 8),
  //       _buildCreditCardItem('Syncb/Amazon', '\$1,500', '\$5,300', '21%', 'June 20, 2023'),
  //       const SizedBox(height: 8),
  //       _buildCreditCardItem('Syncb/Amazon', '\$1,500', '\$5,300', '21%', 'June 20, 2023'),
  //     ],
  //   );
  // }
  //
  // Widget _buildCreditCardItem(String name, String balance, String limit, String utilization, String reportDate) {
  //   return Container(
  //     padding: const EdgeInsets.all(16),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(12),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.grey.withOpacity(0.1),
  //           spreadRadius: 1,
  //           blurRadius: 4,
  //           offset: const Offset(0, 2),
  //         ),
  //       ],
  //     ),
  //     child: Column(
  //       children: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Expanded(
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Text(
  //                     name,
  //                     style: const TextStyle(
  //                       fontWeight: FontWeight.w500,
  //                     ),
  //                   ),
  //                   const SizedBox(height: 4),
  //                   Text(
  //                     '$balance Balance',
  //                     style: const TextStyle(
  //                       color: Colors.grey,
  //                       fontSize: 12,
  //                     ),
  //                   ),
  //                   const SizedBox(height: 4),
  //                   Text(
  //                     'Reported on $reportDate',
  //                     style: const TextStyle(
  //                       color: Colors.grey,
  //                       fontSize: 10,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             Column(
  //               crossAxisAlignment: CrossAxisAlignment.end,
  //               children: [
  //                 Text(
  //                   utilization,
  //                   style: const TextStyle(
  //                     fontSize: 18,
  //                     fontWeight: FontWeight.w600,
  //                   ),
  //                 ),
  //                 Text(
  //                   '$limit Limit',
  //                   style: const TextStyle(
  //                     color: Colors.grey,
  //                     fontSize: 12,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //         const SizedBox(height: 12),
  //         Container(
  //           width: double.infinity,
  //           height: 6,
  //           decoration: BoxDecoration(
  //             color: Colors.grey[200],
  //             borderRadius: BorderRadius.circular(3),
  //           ),
  //           child: FractionallySizedBox(
  //             alignment: Alignment.centerLeft,
  //             widthFactor: 0.21, // 21%
  //             child: Container(
  //               decoration: BoxDecoration(
  //                 color: const Color(0xFF10B981),
  //                 borderRadius: BorderRadius.circular(3),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}