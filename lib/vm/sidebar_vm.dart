import 'package:flutter/material.dart';

class SideBarViewModel extends ChangeNotifier {
  int _index = 0;
  int get index => _index;
  void selectScreenIndex(int selectedIndex) {
    _index = selectedIndex;
    notifyListeners();
  }
}
