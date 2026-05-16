import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const SpinWheelApp());
}

class SpinWheelApp extends StatelessWidget {
  const SpinWheelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spin Wheel Game',
      theme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}