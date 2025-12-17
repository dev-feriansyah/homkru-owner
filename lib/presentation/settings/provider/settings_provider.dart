import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  String? _selectedLanguage;
  String? _notificationPreference;
  String? _selectedRole;
  String? _selectedLiveInStatus;
  String? _selectedWorkingHouse;
  String? _selectedRelationshipWithHomeowner;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController changePasController = TextEditingController();
  final List<String> languageOptions = ['English', 'Indonesian'];
  final List<String> notificationOptions = ['On', 'Off'];
  final List<String> roleOptions = ['Admin', 'User'];
  final List<String> liveInStatusOptions = ['Live-in', 'Non Live-in'];
  final List<String> workingHouseOptions = ['Yes', 'No'];
  final List<String> relationshipWithHomeownerOptions = [
    'Spouse',
    'Sibling',
    'Parent',
    'Child',
    'Relative',
    'Friend',
    'Other',
  ];
  String? get selectedLanguage => _selectedLanguage;
  String? get notificationPreference => _notificationPreference;
  String? get selectedRole => _selectedRole;
  String? get selectedLiveInStatus => _selectedLiveInStatus;
  String? get selectedWorkingHouse => _selectedWorkingHouse;
  String? get selectedRelationshipWithHomeowner =>
      _selectedRelationshipWithHomeowner;
  void setLanguage(String language) {
    _selectedLanguage = language;
    notifyListeners();
  }

  void setNotificationPreference(String preference) {
    _notificationPreference = preference;
    notifyListeners();
  }

  void setRole(String role) {
    _selectedRole = role;
    notifyListeners();
  }

  void setLiveInStatus(String liveInStatus) {
    _selectedLiveInStatus = liveInStatus;
    notifyListeners();
  }

  void setWorkingHouse(String workingHouse) {
    _selectedWorkingHouse = workingHouse;
    notifyListeners();
  }

  void setRelationshipWithHomeowner(String relationshipWithHomeowner) {
    _selectedRelationshipWithHomeowner = relationshipWithHomeowner;
    notifyListeners();
  }
  // String _selectedLanguage = 'English';
  // String _notificationPref = 'All';

  // String get selectedLanguage => _selectedLanguage;
  // String get notificationPref => _notificationPref;

  // void setLanguage(String value) {
  //   if (value == _selectedLanguage) return;
  //   _selectedLanguage = value;
  //   notifyListeners();
  // }

  // void setNotificationPref(String value) {
  //   if (value == _notificationPref) return;
  //   _notificationPref = value;
  //   notifyListeners();
  // }
}
