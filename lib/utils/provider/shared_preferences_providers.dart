import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:naatomeals/utils/helper/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme.dart';

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

  bool _isOnboardingDone = false;
  bool get isOnboardingDone => _isOnboardingDone;

  // create AppTheme
  AppTheme appTheme = AppTheme();

  void _getPreferenceSettings() async {
    _isDailyNotificationActive =
        await _preferenceSettingsHelper.isDailyNotificationActive;
    _isDarkThemeActive = await _preferenceSettingsHelper.isDarkThemeActive;
    _isOnboardingDone = await _preferenceSettingsHelper.isOnboardingDone;
    notifyListeners();
  }

  void setDailyNotification(bool value) async {
    _preferenceSettingsHelper.setDailyNotification(value);
    _getPreferenceSettings();
  }

  void toggleTheme(bool value) {
    if (value) {
      _preferenceSettingsHelper.setDarkTheme(value);
    } else {
      _preferenceSettingsHelper.setDarkTheme(value);
    }
    _getPreferenceSettings();
  }

  void setOnboardingDone(bool value) async {
    _preferenceSettingsHelper.setOnboardingDone(value);
    _getPreferenceSettings();
  }

  void resetOnBoardingDone() async {
    _preferenceSettingsHelper.setOnboardingDone(false);
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
      _isDarkThemeActive ? appTheme.darkTheme : appTheme.lightTheme;

  // ThemeData get themeData =>
  //     _isDarkThemeActive ? AppTheme.darkTheme : AppTheme.lightTheme;
}

final preferenceSettingsProvider =
    ChangeNotifierProvider<PreferenceSettingsProvider>((ref) {
  final preferenceSettingsHelper = PreferenceSettingsHelper(
      sharedPreferences: SharedPreferences.getInstance());
  return PreferenceSettingsProvider(
      preferenceSettingsHelper: preferenceSettingsHelper);
});
