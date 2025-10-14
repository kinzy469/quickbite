import 'package:flutter/material.dart';

class AppColors {
  // 🌿 Primary brand colors
  static const primary = Color(0xFF4CAF50); // Green
  static const accent = Color(0xFFFF7043); // Orange (for highlights or buttons)

  // 🎨 Background colors
  static const backgroundLight = Colors.white;
  static const backgroundDark = Color(0xFF2C2C2C); // Soft dark gray instead of pure black

  // 📝 Text colors
  static const textDark = Colors.black;
  static const textLight = Colors.white;
  static const textGray = Colors.grey;

  // 🔽 Navigation bar
  static const navSelected = primary;
  static const navUnselected = Color(0xFF9E9E9E); // Lighter gray for unselected icons

  // 🕶️ Shadows
  static const shadow = Color.fromARGB(26, 71, 69, 69); // Subtle translucent shadow

  // 🔘 Buttons
  static const buttonLight = Colors.white;
  static const buttonTextLight = primary;
}
