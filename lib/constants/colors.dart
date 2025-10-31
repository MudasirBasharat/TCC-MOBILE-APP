import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors (Orange-Red Gradient)
  static const Color primary = Color(0xFFFF8C42); // Orange
  static const Color primaryRed = Color(0xFFFF5E5B); // Red

  // Text Colors
  static const Color textPrimary = Color(0xFF000000); // Black
  static const Color textSecondary = Color(0xFF666666); // Dark Gray
  static const Color textTertiary = Color(0xFF999999); // Light Gray

  // Background Colors
  static const Color background = Color(0xFFFFFFFF); // White
  static const Color cardUnselected = Color(0xFFF5F5F5); // Light Gray
  static const Color cardSelected = Color(0xFFFFF0EB); // Light Orange

  // Border & Divider Colors
  static const Color border = Color(0xFFE0E0E0); // Light Gray Border
  static const Color textFieldBorder = Color(0xFFE0E0E0); // TextField Border
  static const Color divider = Color(0xFFEEEEEE); // Divider Color

  // Button Colors
  static const Color button = Color(0xFFFF8C42); // Orange Button
  static const Color buttonText = Color(0xFFFFFFFF); // White Text
  static const Color outlineButton = Color(0xFFE0E0E0); // Outline Button Border

  // Social Button Colors
  static const Color googleButton = Color(0xFF4285F4); // Google Blue
  static const Color appleButton = Color(0xFF000000); // Apple Black

  // Profile Picture Gradient
  static const Color profileGradientStart = Color(0xFFFFECEC);
  static const Color profileGradientEnd = Color(0xFFFFF4F4);

  // Gradient for Primary Button
  static const Gradient primaryGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [primary, primaryRed],
  );

  // Remember me checkbox
  static const Color checkbox = Color(0xFFFF8C42); // Orange checkbox

  // Link/Interactive Colors
  static const Color link = Color(0xFFFF8C42); // Orange for links
  static const Color interactive = Color(
    0xFFFF8C42,
  ); // Orange for interactive elements
}
