import 'package:flutter/material.dart';

final themeData = ThemeData(
  searchBarTheme: const SearchBarThemeData(
    hintStyle: WidgetStatePropertyAll(
      TextStyle(fontSize: 20),
    ),
    textStyle: WidgetStatePropertyAll(
      TextStyle(fontSize: 20),
    ),
  ),
  iconTheme: const IconThemeData(
    color: Colors.blue,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 50,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(
      fontSize: 25,
    ),
    bodySmall: TextStyle(
      fontSize: 20,
      color: Colors.grey,
    ),
    displayMedium: TextStyle(
      fontSize: 20,
    ),
  ),
);
