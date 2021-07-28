import 'package:flutter/material.dart';
import 'package:it_company_name_generator/common/background.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const AppBackGround(),
          ],
        ),
      ),
    );
  }
}
