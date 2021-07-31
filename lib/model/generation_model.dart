import 'package:flutter/material.dart';
import 'settings_model.dart' show SettingsModelState;
import 'dart:math';

class GenerationModel with ChangeNotifier {
  final _rand = Random();

  List<String> _names = [];
  List<String> get names => _names;
  int _amountOfNames = 99;
  int get amountOfNames => _amountOfNames;
  SettingsModelState? _tempState;

  void clear() {
    _names.clear();
    notifyListeners();
  }

  void generateNames(SettingsModelState settings) {
    if (settings.isEmpty) return;

    _tempState = settings;
    _names.clear();
    // generation
    for (int index = 0; index < _amountOfNames; index++) {
      //
      final firstPart = settings[_rand.nextInt(settings.length - 1)];
      //
      final secondPart = settings[_rand.nextInt(settings.length - 1)];
      //
      final capitalizeSecond = _rand.nextBool();
      //
      _names.add(
          "${firstPart.capitalize()}${(capitalizeSecond) ? secondPart.capitalize() : secondPart}");
    }
    notifyListeners();
  }
}

extension _StringExtension on String {
  /// capitalize first letter of string
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
