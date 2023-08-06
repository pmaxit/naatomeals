import 'package:shared_preferences/shared_preferences.dart';

class PreferenceSettingsHelper {
  final Future<SharedPreferences> sharedPreferences;

  PreferenceSettingsHelper({required this.sharedPreferences});

  static const dailyNotification = 'daily_notification';

  Future<bool> get isDailyNotificationActive async {
    final prefs = await sharedPreferences;
    return prefs.getBool(dailyNotification) ?? false;
  }

  void setDailyNotification(bool value) async {
    final prefs = await sharedPreferences;
    prefs.setBool(dailyNotification, value);
  }

  static const darkTheme = 'dark_theme';

  Future<bool> get isDarkThemeActive async {
    final prefs = await sharedPreferences;
    return prefs.getBool(darkTheme) ?? false;
  }

  void setDarkTheme(bool value) async {
    final prefs = await sharedPreferences;
    prefs.setBool(darkTheme, value);
  }

  static const onboarding = 'onboarding';
  Future<bool> get isOnboardingDone async {
    final prefs = await sharedPreferences;
    return prefs.getBool(onboarding) ?? false;
  }

  void setOnboardingDone(bool value) async {
    final prefs = await sharedPreferences;
    prefs.setBool(onboarding, value);
  }
}
