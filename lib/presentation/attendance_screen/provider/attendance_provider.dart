import 'package:flutter/material.dart';
import 'package:homekru_owner/theme/theme_helper.dart';

class AttendanceProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  DateTime _selectedDate = DateTime.now().subtract(Duration(days: 1));
  DateTime get selectedDate => _selectedDate;

  void changeTab(value) {
    _selectedIndex = value;
    notifyListeners();
  }
  // Initially set to yesterday

  void pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now().subtract(
        Duration(days: 1),
      ), // disables today and future
      helpText: 'Select a Date',
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: appTheme.primaryColor,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      _selectedDate = picked;
    }
    notifyListeners();
  }
}
