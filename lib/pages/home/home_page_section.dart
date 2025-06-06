import 'package:flutter/material.dart';
import 'package:meet_ava_take_home/common/styles/app_text_styles.dart';

import 'home_page_styled_card.dart';

class HomePageSection extends StatelessWidget {
  final String sectionHeader;
  final Widget child;

  const HomePageSection({super.key, required this.sectionHeader, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(sectionHeader, style: AppTextStyles.sectionHeadlineStyle),
        const SizedBox(height: 12),
        StyledCard(child: child),
      ],
    );
  }
}
