import 'package:flutter/material.dart';

const brightness = Brightness.light;
const primaryColor = Color(0xFF2AACFF);
const accentColor = Color(0xFFFFFFFF);
const borderColor = Colors.grey;

ThemeData appTheme() {
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
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: borderColor, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: borderColor, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: borderColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.red, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.red, width: 2),
      ),
      floatingLabelStyle: TextStyle(
        fontSize: 16,
        height: 1.5,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        side: BorderSide(color: borderColor, width: 2),
      ),
    ),
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
    ),
  );
}
