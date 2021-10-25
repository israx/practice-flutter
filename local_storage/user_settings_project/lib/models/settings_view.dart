import 'package:flutter/material.dart';
import 'package:user_settings_project/models/progamming_languages_model.dart';
import 'package:user_settings_project/models/settings.dart';
import 'package:user_settings_project/services/settings_preferences.dart';

import 'gender_model.dart';

class SettingsNotifier extends ChangeNotifier {
  SettingsNotifier({required this.settings}) {
    username = settings.username;
    isEmployed = settings.isEmployed ?? false;
    programmingLanguages = settings.programmingLanguages ?? {};
    selectedGender = settings.selectedGender ?? Gender.female;
  }
  final Settings settings;
  final SettingsPreferences _settingsPreferences = SettingsPreferences();

  late String? username;
  late bool isEmployed;
  late Set<ProgrammingLanguages> programmingLanguages;
  late Gender? selectedGender;

  void setUsername(String value) {
    username = value;
    _settingsPreferences.setUsername(value);
    notifyListeners();
  }

  void setGender(Gender? gender) {
    selectedGender = gender;
    _settingsPreferences.setGender(gender);
    notifyListeners();
  }

  void setLanguage(ProgrammingLanguages language) {
    programmingLanguages.add(language);
    _settingsPreferences.setPragrammingLanguages(programmingLanguages);
    notifyListeners();
  }

  void removeLanguage(ProgrammingLanguages language) {
    programmingLanguages.remove(language);
    _settingsPreferences.setPragrammingLanguages(programmingLanguages);
    notifyListeners();
  }

  void setSwitch(bool bool) {
    isEmployed = bool;
    _settingsPreferences.setEmployed(bool);
    notifyListeners();
  }
}
