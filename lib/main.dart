import 'package:flutter/material.dart';
import 'package:quickbite/core/constants/theme/theme.dart';
import 'package:quickbite/presentation/screens/home/Home/Home.dart';

void main() {
  runApp(const QuickBite());
}

class QuickBite extends StatelessWidget {
  const QuickBite({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QuickBite',

      // Use your custom light & dark themes
      theme: lightTheme,
      darkTheme: darkTheme,

      // Automatically follow system theme
      themeMode: ThemeMode.system,

      home: const HomeScreen(),
    );
  }
}
