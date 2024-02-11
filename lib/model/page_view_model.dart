import 'package:flutter/material.dart';

class PageViewModel extends ChangeNotifier {
  int _currentPageIndex = 0;

  int get currentPageIndex => _currentPageIndex;

  void changePage(int index) {
    _currentPageIndex = index;
    notifyListeners();
  }
}
