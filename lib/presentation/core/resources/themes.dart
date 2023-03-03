import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  primaryColor: const Color(0xFF4E6E81),
  elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStatePropertyAll(Colors.white),
          textStyle: MaterialStatePropertyAll(
              TextStyle(color: Colors.white, fontSize: 20)),
          overlayColor: MaterialStatePropertyAll(Colors.grey))),
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF4E6E81),
      iconTheme: IconThemeData(color: Colors.white),
      toolbarHeight: 80,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
      centerTitle: true),
  scaffoldBackgroundColor: const Color(0xFFF9DBBB),
  colorScheme: const ColorScheme.light(
    error: Colors.red,
  ),
  textSelectionTheme: TextSelectionThemeData(
      cursorColor: const Color(0xFF4E6E81),
      selectionColor: const Color(0xFF4E6E81).withOpacity(0.7),
      selectionHandleColor: const Color(0xFF4E6E81)),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Colors.white.withOpacity(0.8),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(22),
        borderSide: const BorderSide(color: Colors.grey)),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(22),
        borderSide: const BorderSide(color: Colors.grey)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(22),
        borderSide: const BorderSide(color: Color(0xFF4E6E81))),
  ),
  textTheme: const TextTheme(
      titleMedium: TextStyle(color: Color(0xFF2E3840), fontSize: 22),
      bodyMedium: TextStyle(color: Color(0xFF2E3840), fontSize: 22)),
);
