import 'package:flutter/material.dart';

Widget getUserInputPopUp({
  required BuildContext context,
  required Function(String) onComplete,
  required int maxLength,
  required TextInputType inputType,
}) =>
    AddSetingTextField(
      onComplete: onComplete,
      maxLen: maxLength,
      inputType: inputType,
    );

class AddSetingTextField extends StatefulWidget {
  final Function(String) onComplete;
  final int maxLen;
  final TextInputType inputType;
  const AddSetingTextField({
    Key? key,
    required this.onComplete,
    required this.maxLen,
    required this.inputType,
  }) : super(key: key);

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
        child: Container(
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
          child: TextFormField(
            controller: _textController,
            keyboardType: widget.inputType,
            keyboardAppearance: Brightness.light,
            autofocus: true,
            maxLength: widget.maxLen,
            onEditingComplete: () {
              widget.onComplete(_textController!.text);
              Navigator.pop(context);
            },
          ),
        ),
      );
}
