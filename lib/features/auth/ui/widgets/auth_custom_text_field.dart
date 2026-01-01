import 'package:flutter/material.dart';
import 'package:homekru_owner/core/theme/app_colors.dart';

class AuthCustomTextField extends StatelessWidget {
  const AuthCustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.keyboardType,
    this.validator,
  });

  final String hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      cursorColor: appColors.lightGrey,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: appColors.lightGrey,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: appColors.veryLightGrey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: appColors.veryLightGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: appColors.veryLightGrey),
        ),
      ),
      validator: validator,
    );
  }
}
