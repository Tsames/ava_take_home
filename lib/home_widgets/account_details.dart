import 'package:flutter/material.dart';
import 'package:meet_ava_take_home/home_widgets/animated/animated_slider.dart';

class AccountDetails extends StatelessWidget {
  const AccountDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final cardBackgroundColor = Theme.of(context).colorScheme.primaryContainer;
    final cardBorderColor = Theme.of(context).colorScheme.outline;

    final headlineText = Theme.of(context).textTheme.headlineMedium;
    final cardBodyText = Theme.of(context).textTheme.headlineSmall;
    final cardBodyPinkText = Theme.of(context).textTheme.bodySmall;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Account details', style: headlineText),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: cardBackgroundColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: cardBorderColor, width: 1.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 60, child: AnimatedUtilizationSlider(utilization: 50, total: 100, valueLabel: "\$")),
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
              Divider(height: 32, color: cardBorderColor),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Utilization', style: cardBodyText?.copyWith(fontWeight: FontWeight.w400)),
                  Text('4%', style: cardBodyText),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
