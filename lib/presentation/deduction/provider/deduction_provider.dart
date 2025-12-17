import 'package:flutter/material.dart';

class DeductionProvider extends ChangeNotifier {
  String _selectedRange = "This Month";
  String get selectedRange => _selectedRange;

  String _selectedHelper = "All Helpers";
  String get selectedHelper => _selectedHelper;

  bool _markDeducted = false;
  bool get markDeducted => _markDeducted;

  DateTimeRange? _customDateRange;
  DateTimeRange? get customDateRange => _customDateRange;

  final List<String> dateRanges = [
    "Today",
    "This Week",
    "This Month",
    "Last Month",
    "Custom",
  ];

  final List<String> helpers = [
    "All Helpers",
    "Maria Johnson",
    "James Miller",
    "Sarah Wilson",
    "John Smith",
  ];

  void changeRange(val) {
    _selectedRange = val;
    notifyListeners();
  }

  void changeHelper(val) {
    _selectedHelper = val;
    notifyListeners();
  }

  void changeMark() {
    _markDeducted = !markDeducted;
    notifyListeners();
  }

  void setCustomDateRange(DateTimeRange? range) {
    _customDateRange = range;
    notifyListeners();
  }
}
