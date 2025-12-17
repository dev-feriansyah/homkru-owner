import 'package:flutter/material.dart';

class TaskProvider extends ChangeNotifier {
  int _selectedTabIndex = 0;
  final List<String> _tabs = ['Task', 'Upcoming', 'Completed'];

  // Getters
  int get selectedTabIndex => _selectedTabIndex;
  List<String> get tabs => _tabs;

  /// Tab ke hisaab se heading text return karega
  String getTabHeading() {
    switch (_selectedTabIndex) {
      case 0:
        return "All Tasks";
      case 1:
        return "Upcoming Tasks";
      case 2:
        return "Completed Tasks";
      default:
        return "All Tasks";
    }
  }

  /// Tab change karne ke liye
  void changeTab(int index) {
    if (index >= 0 && index < _tabs.length) {
      _selectedTabIndex = index;
      notifyListeners();
    }
  }

  /// Current selected tab name
  String get currentTabName => _tabs[_selectedTabIndex];
}
