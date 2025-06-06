import 'package:flutter/material.dart';
import 'package:meet_ava_take_home/common/styles/app_text_styles.dart';

import '../../../common/styles/app_colors.dart';

class CreditFactors extends StatelessWidget {
  const CreditFactors({super.key});

  static const highImpactColor = AppColors.darkGreen;
  static const mediumImpactColor = AppColors.middleGreen;
  static const lowImpactColor = AppColors.lightGreen;

  static const highImpactText = AppColors.white;
  static const mediumImpactText = AppColors.white;
  static const lowImpactText = AppColors.darkGreen;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Credit factors', style: AppTextStyles.sectionHeadlineStyle),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              CreditFactorsCard(
                title: 'Payment History',
                value: '100%',
                impact: 'HIGH IMPACT',
                impactColor: highImpactColor,
                impactTextColor: highImpactText,
              ),
              const SizedBox(width: 8),
              CreditFactorsCard(
                title: 'Credit Card Utilization',
                value: '4%',
                impact: 'LOW IMPACT',
                impactColor: lowImpactColor,
                impactTextColor: lowImpactText,
              ),
              const SizedBox(width: 8),
              CreditFactorsCard(
                title: 'Derogatory Marks',
                value: '2',
                impact: 'MED IMPACT',
                impactColor: mediumImpactColor,
                impactTextColor: mediumImpactText,
              ),
              const SizedBox(width: 8),
              CreditFactorsCard(
                title: 'Age of Credit History',
                value: '1ys 4mo',
                impact: 'LOW IMPACT',
                impactColor: lowImpactColor,
                impactTextColor: lowImpactText,
              ),
              const SizedBox(width: 8),
              CreditFactorsCard(
                title: 'Hard Inquiries',
                value: '3',
                impact: 'MED IMPACT',
                impactColor: mediumImpactColor,
                impactTextColor: mediumImpactText,
              ),
              const SizedBox(width: 8),
              CreditFactorsCard(
                title: 'Total Accounts',
                value: '9',
                impact: 'MED IMPACT',
                impactColor: mediumImpactColor,
                impactTextColor: mediumImpactText,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CreditFactorsCard extends StatelessWidget {
  final String title;
  final String value;
  final String impact;
  final Color impactColor;
  final Color impactTextColor;

  const CreditFactorsCard({
    super.key,
    required this.title,
    required this.value,
    required this.impact,
    required this.impactColor,
    required this.impactTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 144,
      height: 160,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, textAlign: TextAlign.center, style: AppTextStyles.cardHeadlineStyle.copyWith(fontSize: 14)),
          Text(value, style: AppTextStyles.sectionHeadlineStyle),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(color: impactColor, borderRadius: BorderRadius.circular(4)),
            child: Text(
              impact,
              style: TextStyle(fontFamily: "Inter", color: impactTextColor, fontSize: 11, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
