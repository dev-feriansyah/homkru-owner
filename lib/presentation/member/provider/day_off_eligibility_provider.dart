import 'package:flutter/material.dart';

class DayOffEligibilityProvider extends ChangeNotifier {
  String? _selectedFrequency;
  int _allocatedLeaves = 4;

  // Getters
  String? get selectedFrequency => _selectedFrequency;
  int get allocatedLeaves => _allocatedLeaves;

  // Frequency options
  final List<String> frequencyOptions = [
    "Daily",
    "Weekly",
    "Bi-weekly",
    "Monthly",
  ];

  // Initialize with default values
  DayOffEligibilityProvider() {
    _selectedFrequency = "Weekly";
  }

  // Update frequency
  void updateFrequency(String frequency) {
    _selectedFrequency = frequency;
    notifyListeners();
  }

  // Update allocated leaves
  void updateAllocatedLeaves(int leaves) {
    _allocatedLeaves = leaves;
    notifyListeners();
  }

  // Increment leaves
  void incrementLeaves() {
    if (_allocatedLeaves < 30) {
      // Max limit
      _allocatedLeaves++;
      notifyListeners();
    }
  }

  // Decrement leaves
  void decrementLeaves() {
    if (_allocatedLeaves > 0) {
      // Min limit
      _allocatedLeaves--;
      notifyListeners();
    }
  }
}
