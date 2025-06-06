import 'package:flutter/material.dart';

import '../../common/styles/app_colors.dart';
import '../../common/styles/app_text_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext build) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24, top: 8),
      decoration: BoxDecoration(color: AppColors.headBackground),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.settings, color: AppColors.whiteText),
          Text('Home', style: AppTextStyles.cardHeadlineStyle.copyWith(color: AppColors.whiteText)),
          const SizedBox(),
        ],
      ),
    );
  }
}
