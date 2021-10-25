import 'package:user_settings_project/models/progamming_languages_model.dart';

import 'gender_model.dart';

class Settings {
  String? username;
  bool? isEmployed;
  Set<ProgrammingLanguages>? programmingLanguages = {};
  Gender? selectedGender;

  Settings(
      {this.username,
      this.isEmployed,
      this.programmingLanguages,
      this.selectedGender});
}
