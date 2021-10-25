import 'package:flutter/material.dart';
import 'package:user_settings_project/models/settings_view.dart';

class InheritedSettingsNotifier extends InheritedNotifier<SettingsNotifier> {
  InheritedSettingsNotifier(
      {Key? key, required Widget child, SettingsNotifier? notifier})
      : super(key: key, child: child, notifier: notifier);

  static SettingsNotifier? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<InheritedSettingsNotifier>()!
        .notifier;
  }
}
