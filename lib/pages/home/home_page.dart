import 'package:flutter/material.dart';
import 'package:meet_ava_take_home/common/styles/app_colors.dart';
import 'package:meet_ava_take_home/pages/home/custom_app_bar.dart';
import 'package:meet_ava_take_home/pages/home/floating_home_button.dart';
import 'package:meet_ava_take_home/pages/home/home_page_section.dart';
import 'package:meet_ava_take_home/pages/home/home_page_styled_card.dart';
import 'package:meet_ava_take_home/pages/home/sections/account_details.dart';
import 'package:meet_ava_take_home/pages/home/sections/credit_cards.dart';
import 'package:meet_ava_take_home/pages/home/sections/credit_chart.dart';
import 'package:meet_ava_take_home/pages/home/sections/credit_details.dart';
import 'package:meet_ava_take_home/pages/home/sections/credit_factors.dart';
import 'package:meet_ava_take_home/pages/home/sections/credit_utilization.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: CustomAppBar(), backgroundColor: AppColors.headBackground),
      backgroundColor: AppColors.homeBackground,
      floatingActionButton: FloatingHomeButton(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // const CustomAppBar(),
                  const CreditDetails(),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        HomePageSection(sectionHeader: "Chart", child: CreditChart()),
                        const SizedBox(height: 24),
                        CreditFactors(),
                        const SizedBox(height: 24),
                        HomePageSection(sectionHeader: "Account details", child: AccountDetails()),
                        const SizedBox(height: 24),
                        StyledCard(child: CreditUtilization()),
                        const SizedBox(height: 24),
                        HomePageSection(sectionHeader: "Open credit card accounts", child: CreditCardAccounts()),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
