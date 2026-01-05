import 'package:flutter/material.dart';
import 'app_color_extension.dart';
import 'component_themes.dart';

/// Main theme configuration for the app with Material 3 ColorScheme
/// and custom color extensions.
class AppTheme {
  // Light theme ColorScheme
  static final ColorScheme _lightColorScheme = ColorScheme.light(
    // Primary colors (main brand color: #3B70B9)
    primary: const Color(0xFF3B70B9),
    onPrimary: Colors.white,
    primaryContainer: const Color(0xFFEEF3F9),
    onPrimaryContainer: const Color(0xFF3B70B9),

    // Secondary colors (complementary accent)
    secondary: const Color(0xFF2E5BA2),
    onSecondary: Colors.white,
    secondaryContainer: const Color(0xFFE3ECF7),
    onSecondaryContainer: const Color(0xFF2E5BA2),

    // Tertiary colors (for variation)
    tertiary: const Color(0xFFD96A89),
    onTertiary: Colors.white,
    tertiaryContainer: const Color(0xFFFAC0CA),
    onTertiaryContainer: const Color(0xFFD96A89),

    // Error colors
    error: const Color(0xFFC62828),
    onError: Colors.white,
    errorContainer: const Color(0xFFFFF1E5),
    onErrorContainer: const Color(0xFFC62828),

    // Background colors
    background: const Color(0xFFF8F9FA),
    onBackground: const Color(0xFF212121),

    // Surface colors
    surface: Colors.white,
    onSurface: const Color(0xFF212121),
    surfaceVariant: const Color(0xFFF4F4F4),
    onSurfaceVariant: const Color(0xFF747474),

    // Outline colors
    outline: const Color(0xFF747474),
    outlineVariant: const Color(0xFFE0E0E0),

    // Other Material 3 colors
    shadow: const Color(0xFF3B70B9),
    scrim: Colors.black,
    inverseSurface: const Color(0xFF333333),
    onInverseSurface: Colors.white,
    inversePrimary: const Color(0xFF89A9E2),
  );

  // Dark theme ColorScheme (placeholder - same as light for now)
  // TODO: Define actual dark mode colors when design is ready
  static final ColorScheme _darkColorScheme = _lightColorScheme;

  /// Light theme configuration
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: _lightColorScheme,

      // Custom extensions for app-specific colors
      extensions: [AppColorExtension.light()],

      // Component themes
      elevatedButtonTheme: ComponentThemes.elevatedButtonTheme(
        _lightColorScheme,
      ),
      outlinedButtonTheme: ComponentThemes.outlinedButtonTheme(
        _lightColorScheme,
      ),
      inputDecorationTheme: ComponentThemes.inputDecorationTheme(
        _lightColorScheme,
      ),
      cardTheme: ComponentThemes.cardTheme(_lightColorScheme),
      floatingActionButtonTheme: ComponentThemes.fabTheme(_lightColorScheme),
      chipTheme: ComponentThemes.chipTheme(_lightColorScheme),
      appBarTheme: ComponentThemes.appBarTheme(_lightColorScheme),
      bottomNavigationBarTheme: ComponentThemes.bottomNavTheme(
        _lightColorScheme,
      ),

      // Text theme
      textTheme: ComponentThemes.textTheme(_lightColorScheme),

      // Scaffold
      scaffoldBackgroundColor: _lightColorScheme.background,

      // Divider
      dividerTheme: ComponentThemes.dividerTheme(_lightColorScheme),

      // Icon theme
      iconTheme: ComponentThemes.iconTheme(_lightColorScheme),
    );
  }

  /// Dark theme configuration (placeholder)
  /// TODO: Implement when dark mode colors are defined
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: _darkColorScheme,

      // Custom extensions
      extensions: [AppColorExtension.dark()],

      // Component themes (using light scheme as placeholder)
      elevatedButtonTheme: ComponentThemes.elevatedButtonTheme(
        _darkColorScheme,
      ),
      outlinedButtonTheme: ComponentThemes.outlinedButtonTheme(
        _darkColorScheme,
      ),
      inputDecorationTheme: ComponentThemes.inputDecorationTheme(
        _darkColorScheme,
      ),
      cardTheme: ComponentThemes.cardTheme(_darkColorScheme),
      floatingActionButtonTheme: ComponentThemes.fabTheme(_darkColorScheme),
      chipTheme: ComponentThemes.chipTheme(_darkColorScheme),
      appBarTheme: ComponentThemes.appBarTheme(_darkColorScheme),
      bottomNavigationBarTheme: ComponentThemes.bottomNavTheme(
        _darkColorScheme,
      ),

      // Text theme
      textTheme: ComponentThemes.textTheme(_darkColorScheme),

      // Scaffold
      scaffoldBackgroundColor: _darkColorScheme.background,

      // Divider
      dividerTheme: ComponentThemes.dividerTheme(_darkColorScheme),

      // Icon theme
      iconTheme: ComponentThemes.iconTheme(_darkColorScheme),
    );
  }
}
