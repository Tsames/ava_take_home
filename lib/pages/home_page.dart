import 'package:flutter/material.dart';

import 'home_widgets/account_details.dart';
import 'home_widgets/credit_chart.dart';
import 'home_widgets/credit_details.dart';
import 'home_widgets/credit_factors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    CreditChart(),
                    const SizedBox(height: 24),
                    CreditFactors(),
                    const SizedBox(height: 24),
                    AccountDetails(),
                    const SizedBox(height: 24),
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
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24, top: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
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
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              const SizedBox(width: 24),
            ],
          ),
          const SizedBox(height: 16),
          CreditDetails(),
        ],
      ),
    );
  }

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
