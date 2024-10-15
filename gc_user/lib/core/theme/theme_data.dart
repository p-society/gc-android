import 'package:flutter/material.dart';

class CustomThemeData {
  static InputDecoration inputDecoration = const InputDecoration(
    border: OutlineInputBorder(),
    contentPadding: EdgeInsets.all(16.0),
    filled: true,
    fillColor: Colors.white,
  );

  static AppBarTheme appBarTheme = const AppBarTheme();
}
