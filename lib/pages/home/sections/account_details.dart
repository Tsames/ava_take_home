import 'package:flutter/material.dart';

import '../animated/animated_slider.dart';

class AccountDetails extends StatelessWidget {
  const AccountDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final dividerColor = Theme.of(context).colorScheme.outline;

    final cardBodyText = Theme.of(context).textTheme.headlineSmall;
    final cardBodyPinkText = Theme.of(context).textTheme.bodySmall;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 60, child: AnimatedUtilizationSlider(utilization: 75, total: 150, valueLabel: "\$")),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Spend limit: \$100',
                    style: cardBodyText?.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  TextSpan(text: " Why is it different?", style: cardBodyPinkText?.copyWith(fontSize: 14)),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('\$30', style: cardBodyText),
                Text('Balance', style: cardBodyText?.copyWith(fontWeight: FontWeight.w400, fontSize: 14)),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('\$600', style: cardBodyText),
                Text('Credit limit', style: cardBodyText?.copyWith(fontWeight: FontWeight.w400, fontSize: 14)),
              ],
            ),
          ],
        ),
        Divider(height: 32, color: dividerColor),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Utilization', style: cardBodyText?.copyWith(fontWeight: FontWeight.w400)),
            Text('4%', style: cardBodyText),
          ],
        ),
      ],
    );
  }
}
