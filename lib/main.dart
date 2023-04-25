import 'package:chefkart/constants/theme.dart';
import 'package:chefkart/screen/select_dish_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, snapshot) {
        return GetMaterialApp(
          title: 'ChefKart',
          debugShowCheckedModeBanner: false,
          theme: buildTheme(),
          home: const SelectDishScreen(),
        );
      },
    );
  }
}
