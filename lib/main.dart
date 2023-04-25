import 'package:chefkart/constants/theme.dart';
import 'package:chefkart/screen/select_dish_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ChefKart',
      debugShowCheckedModeBanner: false,
      theme: buildTheme(),
      home: const SelectDishScreen(),
    );
  }
}
