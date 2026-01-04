import 'package:flutter/material.dart';
import 'package:simple_store/shared/data/repository/theme_repo.dart';

class ThemeNotifer extends ChangeNotifier {
  final ThemeRepo repo;
  bool _isDark = false;

  ThemeNotifer(this.repo);

  bool get theme => _isDark;

  Future<void> setTheme(bool value) async {
    await repo.setData(value);
    _isDark = value;
    notifyListeners();
  }

  void toggle() {
    setTheme(!_isDark);
  }

  ThemeMode get currentTheme => _isDark ? ThemeMode.dark : ThemeMode.light;
}
