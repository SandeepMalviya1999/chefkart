import 'package:chefkart/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SelectDishScreen extends StatefulWidget {
  const SelectDishScreen({super.key});

  @override
  State<SelectDishScreen> createState() => _SelectDishScreemState();
}

class _SelectDishScreemState extends State<SelectDishScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: statusBarColor,
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // F
        ),
      ),
      body: Column(
        children: [Text('Hello')],
      ),
    );
  }
}
