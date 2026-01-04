import 'package:shared_preferences/shared_preferences.dart';

class ThemeLocal {
  static const _themeState = 'appTheme';

  Future<void> setTheme(bool value) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setBool(_themeState, value);
  }

  Future<bool> getTheme() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool(_themeState) ?? false;
  }

  Future<void> removeTheme() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove(_themeState);
  }

  Future<void> clearData() async {
    final pref = await SharedPreferences.getInstance();
    pref.clear();
  }
}
