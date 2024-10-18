import 'package:flutter/material.dart';
import 'package:gc_user/core/style/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  static const TextStyle headline1 = TextStyle();

  static const TextStyle bodyText1 = TextStyle();

  static const TextStyle bodyText2 = TextStyle();

  static const TextStyle button = TextStyle();

  static TextStyle authButtonTextStyle =
      GoogleFonts.leagueSpartan(fontSize: 20);

  static TextStyle authFieldTextStyle = GoogleFonts.leagueSpartan(
    fontSize: 20,
    color: AppColors.authFieldsForegroundColor,
  );
}
