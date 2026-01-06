import 'package:flutter/material.dart';

/// Custom theme extension for app-specific colors that don't fit Material 3 semantics.
/// This allows us to maintain all custom colors while using Material 3's ColorScheme
/// for standard UI components.
@immutable
class AppColors extends ThemeExtension<AppColors> {
  // Text colors
  final Color textSecondary;

  // Grey scale variations
  final Color grey;
  final Color darkGrey;
  final Color mediumGrey;
  final Color silver;
  final Color silver2;
  final Color greyAA;

  // Status/Semantic colors (success, warning, info)
  final Color successColor;
  final Color successLight; // lightGreen
  final Color successPale; // paleGreen
  final Color successBackground; // bgGreen

  final Color warningColor;
  final Color warningLight; // lightOrange
  final Color warningPale; // paleOrange
  final Color amber; // Additional warning/pending color

  final Color infoColor;

  // Brand accent colors (for onboarding/special UI)
  final Color intro1;
  final Color intro2;
  final Color intro3;

  // Orange variations (warnings/secondary status)
  final Color orangeDark;

  // Yellow variations (caution/pending states)
  final Color amber300;
  final Color mediumYellow;
  final Color lightYellow;

  // Red variations (errors/critical)
  final Color red;

  // Green variations (success states - additional)
  final Color mintGreen;
  final Color darkGreen;

  // Blue variations (info backgrounds - additional)
  final Color lightBlueThree;

  // Pink variations
  final Color lightPink;

  const AppColors({
    required this.textSecondary,
    required this.grey,
    required this.darkGrey,
    required this.mediumGrey,
    required this.silver,
    required this.silver2,
    required this.greyAA,
    required this.successColor,
    required this.successLight,
    required this.successPale,
    required this.successBackground,
    required this.warningColor,
    required this.warningLight,
    required this.warningPale,
    required this.amber,
    required this.infoColor,
    required this.intro1,
    required this.intro2,
    required this.intro3,
    required this.orangeDark,
    required this.amber300,
    required this.mediumYellow,
    required this.lightYellow,
    required this.red,
    required this.mintGreen,
    required this.darkGreen,
    required this.lightBlueThree,
    required this.lightPink,
  });

  @override
  ThemeExtension<AppColors> copyWith({
    Color? textSecondary,
    Color? grey,
    Color? darkGrey,
    Color? mediumGrey,
    Color? silver,
    Color? silver2,
    Color? greyAA,
    Color? successColor,
    Color? successLight,
    Color? successPale,
    Color? successBackground,
    Color? warningColor,
    Color? warningLight,
    Color? warningPale,
    Color? amber,
    Color? infoColor,
    Color? intro1,
    Color? intro2,
    Color? intro3,
    Color? orangeDark,
    Color? amber300,
    Color? mediumYellow,
    Color? lightYellow,
    Color? red,
    Color? mintGreen,
    Color? darkGreen,
    Color? lightBlueThree,
    Color? lightPink,
  }) {
    return AppColors(
      textSecondary: textSecondary ?? this.textSecondary,
      grey: grey ?? this.grey,
      darkGrey: darkGrey ?? this.darkGrey,
      mediumGrey: mediumGrey ?? this.mediumGrey,
      silver: silver ?? this.silver,
      silver2: silver2 ?? this.silver2,
      greyAA: greyAA ?? this.greyAA,
      successColor: successColor ?? this.successColor,
      successLight: successLight ?? this.successLight,
      successPale: successPale ?? this.successPale,
      successBackground: successBackground ?? this.successBackground,
      warningColor: warningColor ?? this.warningColor,
      warningLight: warningLight ?? this.warningLight,
      warningPale: warningPale ?? this.warningPale,
      amber: amber ?? this.amber,
      infoColor: infoColor ?? this.infoColor,
      intro1: intro1 ?? this.intro1,
      intro2: intro2 ?? this.intro2,
      intro3: intro3 ?? this.intro3,
      orangeDark: orangeDark ?? this.orangeDark,
      amber300: amber300 ?? this.amber300,
      mediumYellow: mediumYellow ?? this.mediumYellow,
      lightYellow: lightYellow ?? this.lightYellow,
      red: red ?? this.red,
      mintGreen: mintGreen ?? this.mintGreen,
      darkGreen: darkGreen ?? this.darkGreen,
      lightBlueThree: lightBlueThree ?? this.lightBlueThree,
      lightPink: lightPink ?? this.lightPink,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(
    covariant ThemeExtension<AppColors>? other,
    double t,
  ) {
    if (other is! AppColors) return this;
    return AppColors(
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      grey: Color.lerp(grey, other.grey, t)!,
      darkGrey: Color.lerp(darkGrey, other.darkGrey, t)!,
      mediumGrey: Color.lerp(mediumGrey, other.mediumGrey, t)!,
      silver: Color.lerp(silver, other.silver, t)!,
      silver2: Color.lerp(silver2, other.silver2, t)!,
      greyAA: Color.lerp(greyAA, other.greyAA, t)!,
      successColor: Color.lerp(successColor, other.successColor, t)!,
      successLight: Color.lerp(successLight, other.successLight, t)!,
      successPale: Color.lerp(successPale, other.successPale, t)!,
      successBackground:
          Color.lerp(successBackground, other.successBackground, t)!,
      warningColor: Color.lerp(warningColor, other.warningColor, t)!,
      warningLight: Color.lerp(warningLight, other.warningLight, t)!,
      warningPale: Color.lerp(warningPale, other.warningPale, t)!,
      amber: Color.lerp(amber, other.amber, t)!,
      infoColor: Color.lerp(infoColor, other.infoColor, t)!,
      intro1: Color.lerp(intro1, other.intro1, t)!,
      intro2: Color.lerp(intro2, other.intro2, t)!,
      intro3: Color.lerp(intro3, other.intro3, t)!,
      orangeDark: Color.lerp(orangeDark, other.orangeDark, t)!,
      amber300: Color.lerp(amber300, other.amber300, t)!,
      mediumYellow: Color.lerp(mediumYellow, other.mediumYellow, t)!,
      lightYellow: Color.lerp(lightYellow, other.lightYellow, t)!,
      red: Color.lerp(red, other.red, t)!,
      mintGreen: Color.lerp(mintGreen, other.mintGreen, t)!,
      darkGreen: Color.lerp(darkGreen, other.darkGreen, t)!,
      lightBlueThree: Color.lerp(lightBlueThree, other.lightBlueThree, t)!,
      lightPink: Color.lerp(lightPink, other.lightPink, t)!,
    );
  }

  /// Factory for light theme colors
  factory AppColors.light() {
    return const AppColors(
      // Text colors
      textSecondary: Color(0xFF747474),

      // Grey scale
      grey: Color(0xFF616161),
      darkGrey: Color(0xFF5F6368),
      mediumGrey: Color(0xFF666666),
      silver: Color(0xFFBDBDBD),
      silver2: Color(
        0xFFF5F5F5,
      ), // Note: original had .withValues(alpha: 10) which seems incorrect
      greyAA: Color(0xFFAAAAAA),

      // Success colors (green variations)
      successColor: Color(
        0xFF4CAF50,
      ), // Previously: brightGreen for visual states
      successLight: Color(0xFFD0FFB8), // lightGreen
      successPale: Color(0xFFEEFFE6), // paleGreen
      successBackground: Color(0xFFC9F2CB), // bgGreen
      mintGreen: Color(0xFFE8F5E9),
      darkGreen: Color(0xFF2E7D32),

      // Warning colors (orange/amber variations)
      warningColor: Color(0xFFFF9800),
      warningLight: Color(0xFFFFCBA1), // lightOrange
      warningPale: Color(0xFFFFF1E5), // paleOrange
      amber: Color(0xFFF9A825),
      orangeDark: Color(0xFFC95D05), // orange
      amber300: Color(0xFFFBA629),

      // Yellow variations
      mediumYellow: Color(0xFFF5DF97),
      lightYellow: Color(0xFFFFF3CC),

      // Error colors
      red: Colors.red,

      // Info colors
      infoColor: Color(0xFF2196F3),
      lightBlueThree: Color.fromARGB(255, 153, 185, 224),

      // Brand/intro colors
      intro1: Color(0xFFD96A89),
      intro2: Color(0xFF89A371),
      intro3: Color(0xFFE3985B),

      // Other colors
      lightPink: Color(0xFFFAC0CA),
    );
  }

  /// Factory for dark theme (placeholder - same as light for now)
  /// TODO: Implement when dark mode colors are defined
  factory AppColors.dark() {
    // For now, return light theme colors as placeholder
    // Update this when dark mode design is defined
    return AppColors.light();
  }
}

/// Convenience extension for easy access to custom colors
extension AppColorsGetter on BuildContext {
  AppColors get appColors {
    return Theme.of(this).extension<AppColors>()!;
  }
}
