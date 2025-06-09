import 'package:flutter/material.dart';
import 'package:meet_ava_take_home/pages/settings/display/settings_display.dart';
import 'package:meet_ava_take_home/pages/settings/settings_page.dart';

import '../../common/styles/app_colors.dart';
import '../../common/styles/app_text_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24, top: 8),
      decoration: BoxDecoration(color: AppColors.headBackground),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.settings, color: AppColors.white),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SettingsPage()));
            },
          ),
          Text('Home', style: AppTextStyles.cardHeadlineStyle.copyWith(color: AppColors.white)),
          const SizedBox(),
        ],
      ),
    );
  }
}
