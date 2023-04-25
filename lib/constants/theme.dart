import 'package:chefkart/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// FONT WEIGHT : 300 400 500 600 700 800

ThemeData buildTheme() {
  final baseTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: createMaterialColor(primaryColor),
    fontFamily: 'OpenSans',
  ).copyWith(textTheme: GoogleFonts.openSansTextTheme());

  return baseTheme;
}
