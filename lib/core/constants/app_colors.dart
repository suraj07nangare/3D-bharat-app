import 'package:flutter/material.dart';

/// All app colors in one place.
/// Keeps the UI consistent and easy to change later.
class AppColors {
  AppColors._();

  static const Color primary = Color(0xFFFF4B6E);
  static const Color primaryDark = Color(0xFFE63A5C);
  static const Color accent = Color(0xFFFFC542);

  static const Color background = Color(0xFFF8F8FA);
  static const Color cardBackground = Colors.white;

  static const Color textPrimary = Color(0xFF1E1E1E);
  static const Color textSecondary = Color(0xFF7A7A7A);
  static const Color textLight = Colors.white;

  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFE53935);

  static const Color chipBackground = Color(0xFFF0F0F3);
  static const Color divider = Color(0xFFE0E0E0);

  // Gradient used on profile card image overlay
  static const List<Color> profileGradient = [
    Colors.transparent,
    Color(0xCC000000),
  ];
}
