import 'package:flutter/material.dart';

class OnboardingProvider extends ChangeNotifier{

  int _currentPage = 0;
  int get currentPage => _currentPage;

  void nextPage(int maxPages) {
    if (_currentPage < maxPages - 1) {
      _currentPage++;
      notifyListeners();
    }
  }

  void onPageChanged(int index){
    _currentPage = index;
    notifyListeners();
  }
}