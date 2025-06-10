import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsNotifier with ChangeNotifier {
  bool _soundsEnabled = true;
  double _fontScale = 1.0;
  String _language = 'es';

  bool get soundsEnabled => _soundsEnabled;
  double get fontScale => _fontScale;
  String get language => _language;

  SettingsNotifier() {
    _loadSettings();
  }

  void _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    _soundsEnabled = prefs.getBool('soundsEnabled') ?? true;
    _fontScale = prefs.getDouble('fontScale') ?? 1.0;
    _language = prefs.getString('language') ?? 'es';
    notifyListeners();
  }

  void toggleSounds() async {
    _soundsEnabled = !_soundsEnabled;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('soundsEnabled', _soundsEnabled);
    notifyListeners();
  }

  void setFontScale(double scale) async {
    _fontScale = scale;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('fontScale', scale);
    notifyListeners();
  }

  void setLanguage(String lang) async {
    _language = lang;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', lang);
    notifyListeners();
  }

  void resetSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    _loadSettings();
  }
}
