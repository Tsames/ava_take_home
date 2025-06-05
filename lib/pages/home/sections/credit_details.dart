import 'package:flutter/material.dart';

import '../animated/animated_dial.dart';

class CreditDetails extends StatelessWidget {
  const CreditDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final cardHeadline = Theme.of(context).textTheme.headlineSmall;
    final cardBodyLightText = Theme.of(context).textTheme.bodyMedium;
    final cardBodyPinkText = Theme.of(context).textTheme.bodySmall;

    animatedDialCallBack(double animationValue) {
      if (animationValue < 0.25) return 'Poor';
      if (animationValue < 0.5) return 'Fair';
      if (animationValue < 0.75) return 'Good';
      return 'Excellent';
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Credit Score', style: cardHeadline),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.tertiary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '+2pts',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text('Updated Today | Next May 12', style: cardBodyLightText),
              const SizedBox(height: 4),
              Text('Experian', style: cardBodyPinkText),
            ],
          ),
        ),
        SizedBox(
          width: 75,
          height: 75,
          child: AnimatedDial(
            value: 720,
            maxValue: 850,
            textBuilder: animatedDialCallBack,
            colorTween: ColorTween(begin: const Color(0xFFFF7D60), end: const Color(0xFF48A388)),
          ),
        ),
      ],
    );
  }
}
