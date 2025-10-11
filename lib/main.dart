import 'package:flutter/material.dart';
import 'package:quickbite/screens/screen1.dart';
 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuickBite',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(), // You can switch to light if needed
      home: HomeScreen(), // This is your custom UI screen
    );
  }
}
