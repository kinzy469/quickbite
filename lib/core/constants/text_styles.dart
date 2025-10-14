import 'package:flutter/material.dart';

class AppTextStyles {
  // 🏠 Headings
  static TextStyle heading1(BuildContext context) => TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.onBackground,
      );

  static TextStyle heading2(BuildContext context) => TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).colorScheme.onBackground,
      );

  static TextStyle heading3(BuildContext context) => TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).colorScheme.onBackground,
      );

  // 🧾 Body Text
  static TextStyle body(BuildContext context) => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Theme.of(context).colorScheme.onBackground,
      );

  static TextStyle bodySmall(BuildContext context) => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      );

  // 💬 Emphasis Text (like buttons or highlights)
  static TextStyle emphasis(BuildContext context) => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).colorScheme.primary,
      );

  // ⚪ For text on dark backgrounds
  static TextStyle lightText(BuildContext context) => TextStyle(
        fontSize: 16,
        color: Theme.of(context).colorScheme.onPrimary,
      );
}
