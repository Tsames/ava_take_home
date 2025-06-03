import 'package:flutter/material.dart';

class CreditFactors extends StatelessWidget {
  const CreditFactors({super.key});

  @override
  Widget build(BuildContext context) {
    final cardBackgroundColor = Theme.of(context).colorScheme.primaryContainer;
    final cardBorderColor = Theme.of(context).colorScheme.outline;
    final cardHeadline = Theme.of(context).textTheme.headlineSmall;
    final cardBodyLightText = Theme.of(context).textTheme.bodyMedium;
    final cardBodyPinkText = Theme.of(context).textTheme.bodySmall;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Credit factors',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: CreditFactorsCard(
                title: 'Payment\nHistory',
                value: '100%',
                impact: 'HIGH IMPACT',
                impactColor: Colors.green,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: CreditFactorsCard(
                title: 'Credit Card\nUtilization',
                value: '4%',
                impact: 'LOW IMPACT',
                impactColor: Colors.blue,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: CreditFactorsCard(
                title: 'Derogatory\nMarks',
                value: '0',
                impact: 'MED',
                impactColor: Colors.teal,
              ),
            ),
          ],
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

  const CreditFactorsCard({
    super.key,
    required this.title,
    required this.value,
    required this.impact,
    required this.impactColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: impactColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              impact,
              style: TextStyle(
                color: impactColor,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
