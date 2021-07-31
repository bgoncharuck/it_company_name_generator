import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:it_company_name_generator/common/get_user_input_popup.dart';
import 'package:it_company_name_generator/common/rightside_buttons.dart';
import 'package:it_company_name_generator/common/rightside_buttons_icon.dart';
import 'package:it_company_name_generator/model/generation_model.dart';
import 'package:it_company_name_generator/model/settings_model.dart';

class HomeScreenRight extends StatelessWidget {
  const HomeScreenRight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RightSideButtons(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 32.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () => context
                  .read<GenerationModel>()
                  .generateNames(BlocProvider.of<SettingsModel>(context).state),
              icon: const RightSideButtonIcon(
                icon: Icons.play_arrow,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
