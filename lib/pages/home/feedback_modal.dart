import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meet_ava_take_home/common/styles/app_text_styles.dart';

import '../../common/repository/state_provider.dart';
import '../../common/styles/app_colors.dart';

class FeedbackWidget extends ConsumerWidget {
  const FeedbackWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isVisible = ref.watch(feedbackVisibilityProvider);
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      bottom: isVisible ? 0 : -500,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.only(top: 25, left: 10, right: 10, bottom: 50),
        decoration: BoxDecoration(
          color: AppColors.pageBackground,
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32)),
          border: Border(top: BorderSide(color: AppColors.pink, width: 15)),
        ),
        child: Center(
          child: Column(
            children: [
              Text('Give us feedback!', style: AppTextStyles.cardHeadlineStyle),
              SizedBox(height: 15),
              TextField(
                keyboardType: TextInputType.text,
                style: AppTextStyles.settingsEditFieldData,
                minLines: 3,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: "It's been helpful so far!",
                  hintStyle: AppTextStyles.settingsStaticFieldData,
                  isDense: true,
                  filled: true,
                  fillColor: AppColors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.white, width: 0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: AppColors.headBackground),
                  ),
                ),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  final notifier = ref.read(feedbackVisibilityProvider.notifier);
                  notifier.state = false;
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.headBackground,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: Center(
                  child: Text("Send feedback", style: AppTextStyles.cardHeadlineStyle.copyWith(color: AppColors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
