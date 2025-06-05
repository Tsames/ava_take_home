import 'package:flutter/material.dart';

class StyledCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const StyledCard({super.key, required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    final styledCardBackgroundColor = Theme.of(context).colorScheme.primaryContainer;
    final styledCardBorderColor = Theme.of(context).colorScheme.outline;

    return Container(
      decoration: BoxDecoration(
        color: styledCardBackgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: styledCardBorderColor, width: 1),
      ),
      padding: padding ?? const EdgeInsets.all(16),
      child: child, // The variable content
    );
  }
}
