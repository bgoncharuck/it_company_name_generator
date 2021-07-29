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
abstract class SettingsModelEvent extends ReplayEvent {}

@immutable
class RestoreDefaultSettingsEvent extends Equatable
    implements SettingsModelEvent {
  final SettingsModelState settings = _defaultSettings;
  const RestoreDefaultSettingsEvent();

  @override
  List<Object> get props => [settings];

  @override
  bool get stringify => false;
}

@immutable
class NewSettingsEvent extends Equatable implements SettingsModelEvent {
  final String item;
  const NewSettingsEvent(this.item);

  @override
  List<Object> get props => [item];

  @override
  bool get stringify => false;
}

@immutable
class RemoveByIndexSettingsEvent extends Equatable
    implements SettingsModelEvent {
  final int index;
  const RemoveByIndexSettingsEvent(this.index);

  @override
  List<Object> get props => [index];

  @override
  bool get stringify => false;
}

class SettingsModel extends HydratedBloc<SettingsModelEvent, SettingsModelState>
    with ReplayBlocMixin {
  SettingsModel() : super(_defaultSettings);

  @override
  Stream<SettingsModelState> mapEventToState(SettingsModelEvent event) async* {
    // new setting adding
    if (event is NewSettingsEvent)
      yield List.from(state)..add(event.item);

    // remove setting by index
    else if (event is RemoveByIndexSettingsEvent)
      yield List.from(state)..removeAt(event.index);

    // restore default
    else if (event is RestoreDefaultSettingsEvent) yield event.settings;
  }

  @override
  SettingsModelState fromJson(Map<String, dynamic> json) =>
      (json["settings"] as List).map((e) => e.toString()).toList();

  @override
  Map<String, dynamic> toJson(SettingsModelState state) => {"settings": state};
}
