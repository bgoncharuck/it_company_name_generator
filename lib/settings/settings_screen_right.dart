import 'package:flutter/material.dart';
import 'package:it_company_name_generator/common/rightside_buttons.dart';
import 'package:it_company_name_generator/common/rightside_buttons_icon.dart';
import 'package:it_company_name_generator/common/get_user_input_popup.dart';
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Default
          IconButton(
            onPressed: () => BlocProvider.of<SettingsModel>(context).add(
              RestoreDefaultSettingsEvent(),
            ),
            icon: const RightSideButtonIcon(
              icon: Icons.settings_backup_restore_rounded,
              color: Colors.red,
            ),
          ),
          // New
          IconButton(
            onPressed: () => showDialog<void>(
              context: context,
              barrierDismissible: true,
              builder: (BuildContext context) => Dialog(
                backgroundColor: Colors.transparent,
                child: getUserInputPopUp(
                    context: context,
                    maxLength: 32,
                    inputType: TextInputType.text,
                    onComplete: (String input) {
                      final settings = BlocProvider.of<SettingsModel>(context);
                      if (!settings.state.contains(input))
                        settings.add(
                          NewSettingsEvent(input),
                        );
                    }),
                insetPadding: EdgeInsets.all(0),
              ),
            ),
            icon: const RightSideButtonIcon(
              icon: Icons.add,
              color: Colors.green,
            ),
          ),
          // Restore
          IconButton(
            onPressed: () => BlocProvider.of<SettingsModel>(context).undo(),
            icon: const RightSideButtonIcon(
              icon: Icons.undo,
              color: Colors.orange,
            ),
          ),
        ],
      ),
    ));
  }
}
