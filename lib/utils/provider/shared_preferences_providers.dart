import 'package:flutter/material.dart';
import 'package:naatomeals/utils/helper/shared_preferences.dart';

class PreferenceSettingsProvider extends ChangeNotifier {
  late PreferenceSettingsHelper _preferenceSettingsHelper;

  PreferenceSettingsProvider(
      {required PreferenceSettingsHelper preferenceSettingsHelper}) {
    _preferenceSettingsHelper = preferenceSettingsHelper;
    _getPreferenceSettings();
  }

  bool _isDailyNotificationActive = false;
  bool get isDailyNotificationActive => _isDailyNotificationActive;

  bool _isDarkThemeActive = false;
  bool get isDarkThemeActive => _isDarkThemeActive;

  void _getPreferenceSettings() async {
    _isDailyNotificationActive =
        await _preferenceSettingsHelper.isDailyNotificationActive;
    _isDarkThemeActive = await _preferenceSettingsHelper.isDarkThemeActive;
    notifyListeners();
  }

  void setDailyNotification(bool value) async {
    _preferenceSettingsHelper.setDailyNotification(value);
    _getPreferenceSettings();
  }

  void setDarkTheme(bool value) async {
    _preferenceSettingsHelper.setDarkTheme(value);
    _getPreferenceSettings();
  }

  void reset() {
    _isDailyNotificationActive = false;
    _isDarkThemeActive = false;
    notifyListeners();
  }

  void toggleDailyNotification() {
    _isDailyNotificationActive = !_isDailyNotificationActive;
    notifyListeners();
  }

  void toggleDarkTheme() {
    _isDarkThemeActive = !_isDarkThemeActive;
    notifyListeners();
  }

  void toggleDailyNotificationAndDarkTheme() {
    _isDailyNotificationActive = !_isDailyNotificationActive;
    _isDarkThemeActive = !_isDarkThemeActive;
    notifyListeners();
  }

  ThemeData get themeData =>
      _isDarkThemeActive ? ThemeData.dark() : ThemeData.light();
}
