import 'package:flutter/material.dart';
import 'package:it_company_name_generator/common/background.dart';
import 'settings_screen_left.dart';
import 'settings_screen_right.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: const [
            const Positioned.fill(
              child: const AppBackGround(),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: const SettingsScreenLeft(),
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: const SettingsScreenRight(),
            ),
          ],
        ),
      ),
    );
  }
}
