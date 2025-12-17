import 'package:flutter/material.dart';

class OvertimeTrackerProvider extends ChangeNotifier {
  String _selectedRange = "This Month";
  String get selectedRange => _selectedRange;

  bool _markPaid = false;
  bool get markPaid => _markPaid;

  DateTimeRange? _customDateRange;
  DateTimeRange? get customDateRange => _customDateRange;

  final List<String> dateRanges = [
    "Today",
    "This Week",
    "This Month",
    "Last Month",
    "Custom",
  ];

  void changeRange(val) {
    _selectedRange = val;
    notifyListeners();
  }

  void changeMark() {
    _markPaid = !markPaid;
    notifyListeners();
  }

  void setCustomDateRange(DateTimeRange? range) {
    _customDateRange = range;
    notifyListeners();
  }
}
