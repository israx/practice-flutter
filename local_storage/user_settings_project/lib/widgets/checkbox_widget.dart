import 'package:flutter/material.dart';
import 'package:user_settings_project/models/progamming_languages_model.dart';
import 'package:user_settings_project/state/inherited_settings_notifier.dart';

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget(
      {Key? key, required this.programmingLanguage, required this.title})
      : super(key: key);
  final ProgrammingLanguages programmingLanguage;
  final String title;
  @override
  Widget build(BuildContext context) {
    final settingsNotifier = InheritedSettingsNotifier.of(context);
    return CheckboxListTile(
        title: Text(title),
        value: settingsNotifier!.programmingLanguages
            .contains(programmingLanguage),
        onChanged: (value) {
          !settingsNotifier.programmingLanguages.contains(programmingLanguage)
              ? settingsNotifier.setLanguage(programmingLanguage)
              : settingsNotifier.removeLanguage(programmingLanguage);
        });
  }
}
