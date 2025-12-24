import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homekru_owner/core/theme/theme_helper.dart';

class CustomButtonStyle {
  static ButtonStyle get fillOnPrimaryContainer => ElevatedButton.styleFrom(
    backgroundColor: theme.colorScheme.primary,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
  );
  static ButtonStyle get fillPrimary => ElevatedButton.styleFrom(
    backgroundColor: theme.colorScheme.primary,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
  );
  static ButtonStyle get none => ButtonStyle(
    backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
    elevation: WidgetStateProperty.all<double>(0),
  );
  static ButtonStyle get outline => ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    side: BorderSide(color: theme.colorScheme.primary, width: 1),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
  );
}
