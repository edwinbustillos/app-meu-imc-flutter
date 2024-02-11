import 'package:flutter/material.dart';
import 'package:meu_imc/utils/colors.dart';

class ThemeModel extends ChangeNotifier {
  bool _isDarkTheme = false;
  int _indexMenuBotton = 0;
  bool get isDarkTheme => _isDarkTheme;
  int get indexMenuBotton => _indexMenuBotton;

  Color get primaryColor => _isDarkTheme
      ? MyColors.darkThemePrimaryColor
      : MyColors.lightThemePrimaryColor;

  Color get backgroundColorQuadCard => _isDarkTheme
      ? MyColors.darkBackgroundColorQuadCard
      : MyColors.lightBackgroundColorQuadCard;

  Color get activeBotton => MyColors.activeColor;

  TextStyle get textStyleBig =>
      const TextStyle(fontSize: 50.0, fontWeight: FontWeight.w900);
  TextStyle get textStyleMedium => const TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
      );

  void changeIndexMenuBotton(int index) {
    _indexMenuBotton = index;
    notifyListeners();
  }

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }
}
