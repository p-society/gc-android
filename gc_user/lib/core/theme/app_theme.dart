import 'package:flutter/material.dart';
import 'package:gc_user/core/theme/theme_data.dart';
class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      appBarTheme: CustomThemeData.appBarTheme,
    );
  }
}
