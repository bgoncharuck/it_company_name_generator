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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Default
          IconButton(
            onPressed: () => BlocProvider.of<SettingsModel>(context).add(
              DefaultSettingsEvent(),
            ),
            icon: Icon(
              Icons.settings_backup_restore_rounded,
              color: Colors.red,
              size: 48.0,
            ),
          ),
          // New
          IconButton(
            onPressed: () => showDialog<void>(
              context: context,
              barrierDismissible: true,
              builder: (BuildContext context) => Dialog(
                backgroundColor: Colors.transparent,
                child: addSettingPopUp(context),
                insetPadding: EdgeInsets.all(0),
              ),
            ),
            icon: Icon(
              Icons.add,
              color: Colors.green,
              size: 48.0,
            ),
          ),
          // Restore
          IconButton(
            onPressed: () => BlocProvider.of<SettingsModel>(context).undo(),
            icon: Icon(
              Icons.undo,
              color: Colors.orange,
              size: 48.0,
            ),
          ),
        ],
      ),
    ));
  }
}

Widget addSettingPopUp(BuildContext context) => Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 32.0,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 32.0,
        vertical: 16.0,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(64.0)),
        color: Colors.white,
      ),
      child: const AddSetingTextField(),
    );

class AddSetingTextField extends StatefulWidget {
  const AddSetingTextField({Key? key}) : super(key: key);

  @override
  _AddSetingTextFieldState createState() => _AddSetingTextFieldState();
}

class _AddSetingTextFieldState extends State<AddSetingTextField> {
  TextEditingController? _textController;

  @override
  void initState() {
    _textController = TextEditingController(text: "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Form(
        child: TextFormField(
          controller: _textController,
          keyboardAppearance: Brightness.light,
          autofocus: true,
          maxLength: 32,
          onEditingComplete: () {
            final settings = BlocProvider.of<SettingsModel>(context);
            if (!settings.state.contains(_textController!.text))
              settings.add(
                NewSettingsEvent(
                  List.from(
                    settings.state,
                  )..add(_textController!.text),
                ),
              );
            Navigator.pop(context);
          },
        ),
      );
}
