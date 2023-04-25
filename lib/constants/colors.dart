import 'package:flutter/material.dart';

const Color transparent = Colors.transparent;
const Color whiteColor = Colors.white;

const Color statusBarColor = Color(0xffFFFFFF);
const Color primaryColor = Color(0xff1C1C1C);
const Color backgroundColor = Color(0xFFFFFFFF);

const Color orangeColor = Color(0xFFFF941A);
const Color greenColor = Color(0xFF51C452);
const Color greyColor = Color(0xFFBDBDBD);
const Color lightOrangeColor = Color(0xFFFFF9F2);

const Color txtOrangeColor = Color(0xFFFF8800);

MaterialColor createMaterialColor(Color color) {
  final strengths = <double>[.05];
  final swatch = <int, Color>{};
  final r = color.red;
  final g = color.green;
  final b = color.blue;

  for (var i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (final str in strengths) {
    final strength = num.parse(str.toString());
    final ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
