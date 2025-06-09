import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meet_ava_take_home/pages/settings/display/settings_display.dart';
import 'package:meet_ava_take_home/pages/settings/edit/settings_edit.dart';

import '../../common/repository/state_provider.dart';
import '../../common/styles/app_colors.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  bool _isEditing = false;

  void _setDisplayMode() {
    setState(() {
      _isEditing = false;
    });
  }

  void _setEditingMode() {
    setState(() {
      _isEditing = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userData = ref.watch(userDataProvider);
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.pageBackground,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.deepPurple),
              onPressed: () => {_isEditing ? _setDisplayMode() : Navigator.of(context).pop()},
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 40),
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: _isEditing ? SettingsEdit(onExit: _setDisplayMode) : SettingsDisplay(onEnter: _setEditingMode),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
