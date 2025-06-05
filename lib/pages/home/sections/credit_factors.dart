import 'package:flutter/material.dart';

class CreditFactors extends StatelessWidget {
  const CreditFactors({super.key});

  @override
  Widget build(BuildContext context) {
    final cardHeadlineText = Theme.of(context).textTheme.headlineLarge;

    final highImpactColor = Color(0xFF003928);
    final mediumImpactColor = Color(0xFF48A388);
    final lowImpactColor = Color(0xFFA9EACE);

    final highImpactText = Colors.white;
    final mediumImpactText = Colors.white;
    final lowImpactText = Color(0xFF003928);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Credit factors', style: cardHeadlineText),
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
    final cardTitleText = Theme.of(context).textTheme.headlineSmall;
    final cardValueText = Theme.of(context).textTheme.headlineMedium;

    return Container(
      height: 150,
      width: 120,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FittedBox(
            child: Text(title, textAlign: TextAlign.center, style: cardTitleText?.copyWith(fontSize: 14)),
          ),
          FittedBox(child: Text(value, style: cardValueText)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(color: impactColor, borderRadius: BorderRadius.circular(4)),
            child: Text(
              impact,
              style: TextStyle(color: impactTextColor, fontSize: 11, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
