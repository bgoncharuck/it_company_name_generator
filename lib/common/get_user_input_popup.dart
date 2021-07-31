import 'package:flutter/material.dart';

class GetUserInputPopUp extends StatefulWidget {
  final Function(String) onComplete;
  final int maxLen;
  final TextInputType inputType;
  const GetUserInputPopUp({
    Key? key,
    required this.onComplete,
    required this.maxLen,
    required this.inputType,
  }) : super(key: key);

  @override
  _GetUserInputPopUpState createState() => _GetUserInputPopUpState();
}

class _GetUserInputPopUpState extends State<GetUserInputPopUp> {
  TextEditingController? _textController;

  @override
  void initState() {
    _textController = TextEditingController(text: "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(0),
        child: Form(
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 32.0,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 32.0,
              vertical: 16.0,
            ),
            decoration: const BoxDecoration(
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
        ),
      );
}
