import 'package:flutter/material.dart';

class MemberDetailProvider extends ChangeNotifier {
  // This can be used for general member management
  // while AddMemberProvider handles the specific add member form

  final List<dynamic> _members = [];
  bool _isLoading = false;

  List<dynamic> get members => _members;
  bool get isLoading => _isLoading;
}
