import 'package:flutter/material.dart';

class MemberProvider extends ChangeNotifier {
  final bool _isLoading = false;

  bool get isLoading => _isLoading;
}
