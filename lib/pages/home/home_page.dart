import 'package:flutter/material.dart';
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(toolbarHeight: 0, backgroundColor: Theme.of(context).colorScheme.secondaryContainer),
      backgroundColor: Theme.of(context).colorScheme.surface,
      floatingActionButton: FloatingHomeButton(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(context),
                    const SizedBox(height: 24),
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
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24, top: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30.0), bottomRight: Radius.circular(30.0)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.settings, color: Colors.white),
              Text(
                'Home',
                style: Theme.of(
                  context,
                ).textTheme.headlineSmall?.copyWith(color: Theme.of(context).colorScheme.secondary),
              ),
              const SizedBox(width: 24),
            ],
          ),
          const SizedBox(height: 16),
          StyledCard(child: CreditDetails()),
        ],
      ),
    );
  }
}
