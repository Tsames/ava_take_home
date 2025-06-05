import 'package:flutter/material.dart';

class CreditCardAccounts extends StatelessWidget {
  const CreditCardAccounts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildAccountCard(
          cardName: 'Syncb/Amazon',
          utilization: '21%',
          balance: '\$1,500',
          limit: '\$6,300',
          reportedDate: 'Reported on June 20, 2023',
        ),
        const SizedBox(height: 12),
        _buildAccountCard(
          cardName: 'Syncb/Amazon',
          utilization: '21%',
          balance: '\$1,500',
          limit: '\$6,300',
          reportedDate: 'Reported on June 20, 2023',
        ),
        const SizedBox(height: 12),
        _buildAccountCard(
          cardName: 'Syncb/Amazon',
          utilization: '21%',
          balance: '\$1,500',
          limit: '\$6,300',
          reportedDate: 'Reported on June 20, 2023',
        ),
      ],
    );
  }

  Widget _buildAccountCard({
    required String cardName,
    required String utilization,
    required String balance,
    required String limit,
    required String reportedDate,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(cardName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text(utilization, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Text(balance, style: const TextStyle(fontSize: 14)),
            const SizedBox(width: 8),
            Text('Balance', style: TextStyle(fontSize: 14, color: Colors.grey.shade600)),
            const SizedBox(width: 16),
            Text(limit, style: const TextStyle(fontSize: 14)),
            const SizedBox(width: 8),
            Text('Limit', style: TextStyle(fontSize: 14, color: Colors.grey.shade600)),
          ],
        ),
        const SizedBox(height: 8),
        Text(reportedDate, style: TextStyle(fontSize: 14, color: Colors.grey.shade600)),
      ],
    );
  }
}
