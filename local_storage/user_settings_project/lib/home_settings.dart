import 'package:flutter/material.dart';
import 'package:user_settings_project/models/settings_view.dart';
import 'package:user_settings_project/state/inherited_settings_notifier.dart';
import 'package:user_settings_project/widgets/checkbox_widget.dart';
import 'package:user_settings_project/widgets/radio_widget.dart';

import 'models/gender_model.dart';
import 'models/progamming_languages_model.dart';

class HomeSettingsApp extends StatelessWidget {
  const HomeSettingsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settingsNotifier = InheritedSettingsNotifier.of(context);
    return ListView(
      children: [
        getTextFormField(settingsNotifier!),
        getRadioForm(settingsNotifier),
        getCheckBoxList(settingsNotifier),
        getSwitchList(settingsNotifier)
      ],
    );
  }
}

Widget getTextFormField(SettingsNotifier settingsNotifier) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      onChanged: settingsNotifier.setUsername,
    ),
  );
}

Widget getRadioForm(SettingsNotifier settingsNotifier) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: Column(
      children: const [
        RadioTailWidget(gender: Gender.female, title: "Female"),
        RadioTailWidget(gender: Gender.male, title: "Male"),
        RadioTailWidget(gender: Gender.other, title: "Other"),
      ],
    ),
  );
}

Widget getCheckBoxList(SettingsNotifier settingsNotifier) {
  return Column(
    children: const <Widget>[
      CheckBoxWidget(
          programmingLanguage: ProgrammingLanguages.javaScript,
          title: "Java Script"),
      CheckBoxWidget(
          programmingLanguage: ProgrammingLanguages.dart, title: "Dart"),
      CheckBoxWidget(
          programmingLanguage: ProgrammingLanguages.kotlin, title: "Klotin"),
      CheckBoxWidget(
          programmingLanguage: ProgrammingLanguages.swift, title: "Swift"),
    ],
  );
}

Widget getSwitchList(SettingsNotifier settingsNotifier) {
  return SwitchListTile(
      title: const Text('Is Employed'),
      value: settingsNotifier.isEmployed,
      onChanged: (newValue) => settingsNotifier.setSwitch(newValue));
}
