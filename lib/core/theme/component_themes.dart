import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Centralized component theme configurations for the app.
/// This class provides themed configurations for buttons, inputs, cards, and other UI components.
class ComponentThemes {
  /// Elevated button theme with primary styling
  static ElevatedButtonThemeData elevatedButtonTheme(ColorScheme colorScheme) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        minimumSize: Size(double.infinity, 50.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        elevation: 0,
        textStyle: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
          fontFamily: 'Karla',
        ),
      ),
    );
  }

  /// Outlined button theme
  static OutlinedButtonThemeData outlinedButtonTheme(ColorScheme colorScheme) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: colorScheme.primary,
        side: BorderSide(color: colorScheme.primary),
        minimumSize: Size(double.infinity, 50.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        textStyle: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
          fontFamily: 'Karla',
        ),
      ),
    );
  }

  /// Input decoration theme for text fields
  static InputDecorationTheme inputDecorationTheme(ColorScheme colorScheme) {
    return InputDecorationTheme(
      filled: true,
      fillColor: colorScheme.surface,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.r),
        borderSide: BorderSide(color: colorScheme.surfaceContainerHighest),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.r),
        borderSide: BorderSide(color: colorScheme.surfaceContainerHighest),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.r),
        borderSide: BorderSide(color: colorScheme.primary, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.r),
        borderSide: BorderSide(color: colorScheme.error, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.r),
        borderSide: BorderSide(color: colorScheme.error, width: 1),
      ),
      hintStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: colorScheme.onSurfaceVariant,
        fontFamily: 'Poppins',
      ),
    );
  }

  /// Card theme for consistent card styling
  static CardThemeData cardTheme(ColorScheme colorScheme) {
    return CardThemeData(
      color: colorScheme.surface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
        side: BorderSide(color: colorScheme.outline),
      ),
      margin: EdgeInsets.zero,
    );
  }

  /// Floating action button theme
  static FloatingActionButtonThemeData fabTheme(ColorScheme colorScheme) {
    return FloatingActionButtonThemeData(
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
    );
  }

  /// Chip theme for status chips and filters
  static ChipThemeData chipTheme(ColorScheme colorScheme) {
    return ChipThemeData(
      backgroundColor: colorScheme.surfaceContainerHighest,
      deleteIconColor: colorScheme.onSurfaceVariant,
      selectedColor: colorScheme.primaryContainer,
      secondarySelectedColor: colorScheme.secondaryContainer,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      labelStyle: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w600,
        fontFamily: 'Poppins',
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
    );
  }

  /// App bar theme with transparent background
  static AppBarTheme appBarTheme(ColorScheme colorScheme) {
    return AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: colorScheme.onSurface,
        fontFamily: 'Poppins',
      ),
      iconTheme: IconThemeData(color: colorScheme.onPrimary, size: 24.sp),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }

  /// Bottom navigation bar theme
  static BottomNavigationBarThemeData bottomNavTheme(ColorScheme colorScheme) {
    return BottomNavigationBarThemeData(
      backgroundColor: colorScheme.surface,
      selectedItemColor: colorScheme.primary,
      unselectedItemColor: colorScheme.onSurfaceVariant,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
    );
  }

  /// Text theme with Poppins font
  static TextTheme textTheme(ColorScheme colorScheme) {
    return TextTheme(
      // Display styles (largest text)
      displayLarge: TextStyle(
        fontSize: 32.sp,
        fontWeight: FontWeight.w700,
        color: colorScheme.onSurface,
        fontFamily: 'Poppins',
      ),
      displayMedium: TextStyle(
        fontSize: 28.sp,
        fontWeight: FontWeight.w600,
        color: colorScheme.onSurface,
        fontFamily: 'Poppins',
      ),
      displaySmall: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        color: colorScheme.onSurface,
        fontFamily: 'Poppins',
      ),

      // Headline styles
      headlineLarge: TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.w600,
        color: colorScheme.onSurface,
        fontFamily: 'Poppins',
      ),
      headlineMedium: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: colorScheme.onSurface,
        fontFamily: 'Poppins',
      ),
      headlineSmall: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: colorScheme.onSurface,
        fontFamily: 'Poppins',
      ),

      // Title styles
      titleLarge: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: colorScheme.onSurface,
        fontFamily: 'Poppins',
      ),
      titleMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: colorScheme.onSurface,
        fontFamily: 'Poppins',
      ),
      titleSmall: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: colorScheme.onSurface,
        fontFamily: 'Poppins',
      ),

      // Body styles (main content text)
      bodyLarge: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: colorScheme.onSurface,
        fontFamily: 'Poppins',
      ),
      bodyMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: colorScheme.onSurface,
        fontFamily: 'Poppins',
      ),
      bodySmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: colorScheme.onSurfaceVariant,
        fontFamily: 'Poppins',
      ),

      // Label styles (buttons, small text)
      labelLarge: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: colorScheme.onSurface,
        fontFamily: 'Poppins',
      ),
      labelMedium: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w600,
        color: colorScheme.onSurface,
        fontFamily: 'Poppins',
      ),
      labelSmall: TextStyle(
        fontSize: 10.sp,
        fontWeight: FontWeight.w600,
        color: colorScheme.onSurfaceVariant,
        fontFamily: 'Poppins',
      ),
    );
  }

  /// Divider theme
  static DividerThemeData dividerTheme(ColorScheme colorScheme) {
    return DividerThemeData(color: colorScheme.outline, thickness: 1, space: 1);
  }

  /// Icon theme
  static IconThemeData iconTheme(ColorScheme colorScheme) {
    return IconThemeData(color: colorScheme.onSurface, size: 24.sp);
  }
}
