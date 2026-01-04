import 'package:simple_store/local/theme_local.dart';

class ThemeRepo {
  final ThemeLocal localTheme;
  ThemeRepo(this.localTheme);

  Future<bool> get theme => localTheme.getTheme();
  Future<void> setData(bool value) => localTheme.setTheme(value);
}
