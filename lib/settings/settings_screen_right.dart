import 'package:flutter/material.dart';
import 'package:it_company_name_generator/common/rightside_buttons.dart';
import 'package:it_company_name_generator/model/settings_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreenRight extends StatelessWidget {
  const SettingsScreenRight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RightSideButtons(
        child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 32.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("kek"),
        ],
      ),
    ));
  }
}
