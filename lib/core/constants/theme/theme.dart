import 'package:flutter/material.dart';
import 'package:quickbite/core/constants/colors.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.backgroundLight,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.backgroundLight,
    foregroundColor: AppColors.textDark,
    elevation: 0,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.backgroundLight,
    selectedItemColor: AppColors.navSelected,
    unselectedItemColor: AppColors.navUnselected,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: AppColors.textDark),
    bodyLarge: TextStyle(color: AppColors.textDark),
    bodySmall: TextStyle(color: AppColors.textGray),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.buttonLight,
      foregroundColor: AppColors.buttonTextLight,
    ),
  ),
  colorScheme: const ColorScheme.light(
    primary: AppColors.primary,
    secondary: AppColors.accent,
    background: AppColors.backgroundLight,
    surface: AppColors.backgroundLight,  // Add this for card consistency
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.backgroundDark,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.backgroundDark,
    foregroundColor: AppColors.textLight,
    elevation: 0,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.backgroundDark,
    selectedItemColor: AppColors.primary,
    unselectedItemColor: AppColors.textGray,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: AppColors.textLight),
    bodyLarge: TextStyle(color: AppColors.textLight),
    bodySmall: TextStyle(color: AppColors.textGray),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.textLight,
    ),
  ),
  colorScheme: const ColorScheme.dark(
    primary: AppColors.primary,
    secondary: AppColors.accent,
    background: AppColors.backgroundDark,
    surface: AppColors.backgroundDark,  // This is key—sets cards/containers to your custom color too
  ),
);