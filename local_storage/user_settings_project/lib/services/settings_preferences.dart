import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_settings_project/models/gender_model.dart';
import 'package:user_settings_project/models/progamming_languages_model.dart';
import 'package:user_settings_project/models/settings.dart';

class SettingsPreferences {
  late SharedPreferences _sharedPreferences;

  SettingsPreferences() {
    _initializePreferences();
  }

  Future<void> _initializePreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  // Save data
  void setUsername(String value) {
    _sharedPreferences.setString('username', value);
  }

  void setGender(Gender? value) {
    print(value);
    _sharedPreferences.setInt('gender', value!.index);
  }

  void setPragrammingLanguages(Set<ProgrammingLanguages> languages) {
    var newLanguages = languages.map((lang) => lang.index.toString()).toList();

    _sharedPreferences.setStringList('languages', newLanguages);
  }

  void setEmployed(bool value) {
    _sharedPreferences.setBool('employed', value);
  }

  // Retrieve data

  static Future<Settings> getSettings() async {
    final _sharedPreferences = await SharedPreferences.getInstance();

    var username = _sharedPreferences.getString('username');
    var gender = Gender.values[_sharedPreferences.getInt('gender') ?? 0];
    var isEmployed = _sharedPreferences.getBool('employed');

    var programmingLanguagesString =
        _sharedPreferences.getStringList('languages');
    var programmingLanguages;

    // avoiding the use of null check operator for the map method
    if (programmingLanguagesString != null) {
      programmingLanguages = programmingLanguagesString
          .map((index) => ProgrammingLanguages.values[int.parse(index)])
          .toSet();
    }
    return Settings(
        username: username,
        selectedGender: gender,
        isEmployed: isEmployed,
        programmingLanguages: programmingLanguages);
  }
}
