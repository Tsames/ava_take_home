import 'package:flutter/material.dart';

import 'home_page_styled_card.dart';

class HomePageSection extends StatelessWidget {
  final String sectionHeader;
  final Widget child;

  const HomePageSection({super.key, required this.sectionHeader, required this.child});

  @override
  Widget build(BuildContext context) {
    final headlineTextStyle = Theme.of(context).textTheme.headlineLarge;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(sectionHeader, style: headlineTextStyle),
        const SizedBox(height: 12),
        StyledCard(child: child),
      ],
    );
  }
}
