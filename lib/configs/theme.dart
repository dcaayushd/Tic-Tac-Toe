import 'package:flutter/material.dart';
import 'package:tic_tac_toe/configs/colors.dart';

var lightTheme = ThemeData(
  brightness: Brightness.light,
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: containerColor,
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(20),
    ),
    hintStyle: const TextStyle(
      fontSize: 15,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      color: labelColor,
    ),
  ),
  colorScheme: const ColorScheme.light(
    primary: primaryColor,
    secondary: secondaryColor,
    background: bgColor,
    onBackground: fontColor,
    primaryContainer: containerColor,
    onPrimaryContainer: labelColor,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 18,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: TextStyle(
      fontSize: 15,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    ),
    labelMedium: TextStyle(
      fontSize: 15,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      color: labelColor,
    ),
  ),
);
