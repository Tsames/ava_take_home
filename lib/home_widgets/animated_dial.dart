import 'package:flutter/material.dart';

class AnimatedDial extends StatelessWidget {
  final int value;
  final int maxValue;
  final String numberText;
  final String subText;

  const AnimatedDial({
    super.key,
    required this.value,
    required this.maxValue,
    required this.numberText,
    required this.subText,
  });

  @override
  Widget build(BuildContext context) {
      final numberTextTheme = Theme.of(context).textTheme.labelLarge;
      final subTextTheme = Theme.of(context).textTheme.labelSmall;

      final dialProgressColor = Theme.of(context).colorScheme.tertiary;
      final dialBackgroundColor = Theme.of(context).colorScheme.tertiaryContainer;

      final percentage = (value / maxValue);

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
                backgroundColor: dialBackgroundColor,
                valueColor: AlwaysStoppedAnimation<Color>(dialProgressColor),
              ),
            ),
            SizedBox(
              width: 80,
              height: 80,
              child: Padding(
                padding: EdgeInsetsGeometry.all(10),
                child: Column(
                  children: [
                    FittedBox(
                      child: Text(
                        numberText,
                        style: numberTextTheme,
                      ),
                    ),
                    FittedBox(
                      child: Text(
                        subText,
                        style: subTextTheme,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
  }
}
