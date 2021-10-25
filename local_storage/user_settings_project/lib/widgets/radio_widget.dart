import 'package:flutter/material.dart';
import 'package:user_settings_project/models/gender_model.dart';
import 'package:user_settings_project/state/inherited_settings_notifier.dart';

class RadioTailWidget extends StatelessWidget {
  const RadioTailWidget({Key? key, required this.gender, required this.title})
      : super(key: key);
  final Gender gender;
  final String title;
  @override
  Widget build(BuildContext context) {
    final settingsNotifier = InheritedSettingsNotifier.of(context);
    return ListTile(
      title: Text(title),
      leading: Radio<Gender>(
          value: gender,
          groupValue: settingsNotifier!.selectedGender,
          onChanged: (value) => settingsNotifier.setGender(value)),
    );
  }
}
