import 'package:flutter/material.dart';

const brightness = Brightness.light;
const primaryColor = Color(0xFF2AACFF);
const accentColor = Color(0xFFFFFFFF);

ThemeData androidTheme() {
  return ThemeData(
    brightness: brightness,
    primaryColor: primaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: accentColor),
    textTheme: TextTheme(
      bodyLarge: TextStyle(fontFamily: "Poppins"),
      bodySmall: TextStyle(fontFamily: "Poppins"),
      displayLarge: TextStyle(fontFamily: "Poppins"),
      displayMedium: TextStyle(fontFamily: "Poppins"),
      displaySmall: TextStyle(fontFamily: "Poppins"),
      headlineMedium: TextStyle(fontFamily: "Poppins"),
      headlineSmall: TextStyle(fontFamily: "Poppins"),
      titleLarge: TextStyle(fontFamily: "Poppins"),
      titleMedium: TextStyle(fontFamily: "Poppins"),
      titleSmall: TextStyle(fontFamily: "Poppins"),
      bodyMedium: TextStyle(fontFamily: "Poppins"),
      headlineLarge: TextStyle(fontFamily: "Poppins"),
      labelLarge: TextStyle(fontFamily: "Poppins"),
      labelMedium: TextStyle(fontFamily: "Poppins"),
      labelSmall: TextStyle(fontFamily: "Poppins"),
    ),
  );
}
