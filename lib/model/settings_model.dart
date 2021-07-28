import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:replay_bloc/replay_bloc.dart';
import 'package:equatable/equatable.dart';

typedef SettingsModelState = List<String>;

const SettingsModelState _defaultSettings = [
  "dev",
  "bit",
  "soft",
  "pro",
  "mob",
  "dream",
  "cod",
  "web",
  "smart",
  "solutions",
  "team",
  "hack",
  "jedi",
  "wizard",
];

@immutable
abstract class SettingsModelEvent extends ReplayEvent {
  SettingsModelState get settings;
}

@immutable
class DefaultSettingsEvent extends Equatable implements SettingsModelEvent {
  final SettingsModelState settings = _defaultSettings;
  const DefaultSettingsEvent();

  @override
  List<Object> get props => [settings];

  @override
  bool get stringify => false;
}

@immutable
class NewSettingsEvent extends Equatable implements SettingsModelEvent {
  final SettingsModelState settings;
  const NewSettingsEvent(this.settings);

  @override
  List<Object> get props => [settings];

  @override
  bool get stringify => false;
}

class SettingsModel extends HydratedBloc<SettingsModelEvent, SettingsModelState>
    with ReplayBlocMixin {
  SettingsModel() : super(_defaultSettings);

  @override
  Stream<SettingsModelState> mapEventToState(SettingsModelEvent event) async* {
    yield event.settings;
  }

  @override
  SettingsModelState fromJson(Map<String, dynamic> json) =>
      (json["settings"] as List).map((e) => e.toString()).toList();

  @override
  Map<String, dynamic> toJson(SettingsModelState state) => {"settings": state};
}
