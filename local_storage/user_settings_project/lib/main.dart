import 'package:flutter/material.dart';
import 'package:user_settings_project/models/settings_view.dart';
import 'package:user_settings_project/services/settings_preferences.dart';
import 'package:user_settings_project/state/inherited_settings_notifier.dart';

import 'home_settings.dart';
import 'models/settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeSettings(title: 'Settings Project'),
    );
  }
}

class HomeSettings extends StatefulWidget {
  HomeSettings({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _HomeSettingsState createState() => _HomeSettingsState();
}

class _HomeSettingsState extends State<HomeSettings> {
  bool isPreferencesInitialized = false;
  late SettingsNotifier settingsNotifier;
  late Settings settings;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getSettings();
  }

  Future<void> _getSettings() async {
    settings = await SettingsPreferences.getSettings();
    settingsNotifier = SettingsNotifier(settings: settings);
    setState(() {
      isPreferencesInitialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: isPreferencesInitialized
          ? InheritedSettingsNotifier(
              notifier: settingsNotifier, child: const HomeSettingsApp())
          : const CircularProgressIndicator(),
    );
  }
}
