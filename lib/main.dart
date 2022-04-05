import 'package:flutter/material.dart';
import 'package:renmoney_task/core/core.dart';
import 'features/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Renmoney Task',
      theme: ThemeData(
        primarySwatch: const MaterialColor(
          0xFF7765C4,
          AppColors.colorScratch,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
