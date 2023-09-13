import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// flutter dart에서 클래스(인터페이스)를 상속받을 때
/// extends : 일반적인 클래스를 상속받을 때
/// mixin : 한개의 클래스와 두개 이상의 인터페이스를 동시에 상속받을 때
/// with : 현재는 한개의 클래스를 상속받지만, ChangeNotifier가
/// 자체적으로 상속받았던 클래스, 인터페이스를 모두 상속받기

class ThemeController with ChangeNotifier {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  /// ThemeMode 클래스를 사용한 객체 선언
  /// flutter 에서 meterial3의 theme를 쉽게 변경할 수 있도록
  /// 미리 준비해둔 클래스
  late ThemeMode _themeMode;

  // private 변수를 외부에서 참조할 수 있는 getter 선언
  ThemeMode get themeMode => _themeMode;

  Future<void> initSystemTheme() async {
    _themeMode = ThemeMode.system;
    notifyListeners();
  }

  Future<void> loadTheme() async {
    final SharedPreferences prefs = await _prefs;
    var themeStr = prefs.getString("THEME");

    ThemeMode themeMode = ThemeMode.system;
    if (themeStr == ThemeMode.dark.toString()) {
      themeMode = ThemeMode.dark;
    } else if (themeStr == "ThemeMode.light") {
      themeMode = ThemeMode.light;
    }
    updateThemeMode(themeMode);
    notifyListeners();
  }

// 생성자에는 async를 부착할 수 없기 때문에
// 개별적으로 method를 만들어 넣어준다.
  ThemeController() {
    loadTheme();
  }

  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;
    if (_themeMode == newThemeMode) return;

    _themeMode = newThemeMode;

    final SharedPreferences prefs = await _prefs;
    var result = await prefs.setString("THEME", newThemeMode.toString());
    if (!result) {
      debugPrint("저장실패");
    }
    notifyListeners();
  }
}
