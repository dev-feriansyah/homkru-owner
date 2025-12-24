import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData;

class ThemeHelper {
  //current app theme
  final bool isDark;

  ThemeHelper({this.isDark = false});

  final Map<String, LightCodeColors> _supportedCustomColor = {
    'light': LightCodeColors(),
  };

  final Map<String, ColorScheme> _supportedColorScheme = {
    'light': ColorSchemes.lightCodeColorScheme,
    'dark': ColorSchemes.darkCodeColorScheme,
  };

  ColorScheme? get _colorScheme =>
      _supportedColorScheme[isDark ? 'dark' : 'light'];

  LightCodeColors get _themeColors =>
      _supportedCustomColor[isDark ? 'dark' : 'light']!;

  // LightCodeColors _getThemeColors(){
  //   // return _supportedCustomColor[_appTheme]?? LightCodeColors();
  //   return _supportedCustomColor[isDark]?? LightCodeColors();
  // }

  //return the current theme data
  ThemeData _getThemeData() {
    // var colorScheme = _supportedColorScheme[_appTheme]?? ColorSchemes.lightCodeColorScheme;
    var colorScheme = _colorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme!),
      scaffoldBackgroundColor: colorScheme.onPrimaryContainer,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          shadowColor: Colors.black,
          elevation: 3,
          visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(color: colorScheme.primary, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
          padding: EdgeInsets.zero,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: appTheme.amber300,
      ),
    );
  }

  // /// return the lightCode colors for the current theme
  // LightCodeColors themeColor() => _getThemeColors();
  // //return the current theme data
  // ThemeData themeData({required bool isDark}) => _getThemeData();
  /// return the lightCode colors for the current theme
  LightCodeColors themeColor() => _themeColors;

  // return the current theme data
  ThemeData get themeData => _getThemeData();
}

class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
    bodyLarge: TextStyle(
      color: appTheme.amber300,
      fontSize: 19.sp,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      color: appTheme.amber300,
      fontSize: 15.sp,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    ),

    displayMedium: TextStyle(
      color: appTheme.amber300,
      fontSize: 50.sp,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    ),
    displaySmall: TextStyle(
      color: colorScheme.onPrimary,
      fontSize: 35.sp,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    ),
    headlineLarge: TextStyle(
      color: appTheme.amber300,
      fontSize: 33.sp,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w300,
    ),
    headlineMedium: TextStyle(
      color: colorScheme.onPrimaryContainer,
      fontSize: 28.sp,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
    ),
    headlineSmall: TextStyle(
      color: appTheme.amber300,
      fontSize: 25.sp,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w300,
    ),
    titleLarge: TextStyle(
      color: colorScheme.onPrimaryContainer,
      fontSize: 18.sp,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    ),
    titleMedium: TextStyle(
      color: appTheme.amber300,
      fontSize: 16.sp,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    ),
    titleSmall: TextStyle(
      color: appTheme.amber300,
      fontSize: 14.sp,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    ),
  );
}

class ColorSchemes {
  static const lightCodeColorScheme = ColorScheme.light(
    primary: Color(0XFFCB0744),
    secondaryContainer: Color(0XFFFFD987),
    onPrimary: Color(0XFF1F41BB),
    onPrimaryContainer: Color(0XFFFFFFFF),
    surface: Color(0XFFF5F5F5), // Light background
    onSurface: Color(0XFF000000), // Text color on light background
  );
  static var darkCodeColorScheme = ColorScheme.dark(
    primary: const Color(0xFF3B70B9),
    secondaryContainer: const Color(0XFF2A2A2A),
    onPrimary: const Color(0XFFFFFFFF),
    onPrimaryContainer: const Color(0xFF3B70B9),
    surface: const Color(0XFF121212), // Dark background
    onSurface: const Color(0XFFFFFFFF), // Text color on dark background
  );
}

class LightCodeColors {
  Color get amber300 => const Color.fromRGBO(251, 166, 41, 1);
  Color get intro1 => const Color(0xFFD96A89);
  Color get intro2 => const Color(0xFF89A371);
  Color get intro3 => const Color.fromRGBO(227, 152, 91, 1);
  Color get grey => const Color(0xFF616161);
  Color get lightBackground => const Color(0xFFF8F9FA);

  Color get shadowColor => const Color(0xff3B70B9).withValues(alpha: 0.08);
  Color get lightBorder => const Color(0xFFE5E7EB);

  Color get textPrimary => const Color(0xFF212121);
  Color get textSecondary => const Color(0xFF747474);

  Color get black => Colors.black;
  Color get white => Colors.white;
  Color get darkGrey => const Color(0xFF5F6368);
  Color get mediumGrey => const Color(0xFF666666);
  Color get lightGrey => const Color(0xFF747474);
  Color get veryLightGrey => const Color(0xFFE0E0E0);
  Color get primaryColor => const Color(0xFF3B70B9);
  Color get darkCharcoal => const Color(0xFF333333);
  Color get lightGreen => const Color(0xFFD0FFB8);
  Color get paleGreen => const Color(0xFFEEFFE6);
  Color get brightGreen => const Color(0xFF41B607);
  Color get bgGreen => const Color(0xFFC9F2CB);
  Color get orange => const Color(0xFFC95D05);
  Color get paleOrange => const Color(0xFFFFF1E5);
  Color get lightOrange => const Color(0xFFFFCBA1);
  Color get lightBlue => const Color(0xFFEEF3F9);
  Color get lightBlueTwo => const Color(0xFFE3ECF7);
  Color get lightBlueThree => Color.fromARGB(255, 153, 185, 224);
  Color get darkRed => const Color(0xFFC62828);
  Color get red => Colors.red;

  Color get amber => const Color(0xFFF9A825);
  Color get lightPink => const Color(0xFFFAC0CA);
  Color get lightYellow => const Color(0xFFFFF3CC);
  Color get mediumYellow => const Color(0xFFF5DF97);
  Color get silver => const Color(0xFFBDBDBD);
  Color get silver2 => const Color(0xFFF5F5F5).withValues(alpha: 10);
  Color get offWhite => const Color(0xFFF4F4F4);
  Color get mintGreen => const Color(0xFFE8F5E9);
  Color get darkGreen => const Color(0xFF2E7D32);
  Color get blueAccentCustom => Color(0xFF2E5BA2);
  Color get greyAA => const Color(0xFFAAAAAA);

  // Accent colors
  Color get successColor => const Color(0xFF4CAF50);
  Color get warningColor => const Color(0xFFFF9800);
  Color get errorColor => const Color(0xFFE53E3E);
  Color get infoColor => const Color(0xFF2196F3);
}
