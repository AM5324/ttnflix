import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTNFlixTextStyle{
  TTNFlixTextStyle._();

// Font styles will be defined here
  static TextTheme defaultTextTheme = TextTheme(
      displaySmall: _getHeading3(),
      headlineMedium: _getHeading4(),
      headlineSmall: _getHeading5(),
      titleLarge: _getHeading6(),
      bodySmall: _getCaptionDefault(),
    );

  static TextStyle _getHeading3() => GoogleFonts.inter(
    fontSize: 48,
    fontWeight: FontWeight.w400,
    letterSpacing: -2.88,
  );

  static TextStyle _getHeading4() => GoogleFonts.inter(
    fontSize: 34,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.34,
  );

  static TextStyle _getHeading5() => GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.24,
  );

  static TextStyle _getHeading6() => GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.2,
  );


  static TextStyle _getsubtitle1() => GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.16,
  );

  static TextStyle _getSubtitle2() => GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.14,
  );

  static TextStyle _getBody1Default() => GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
  );

  static TextStyle getBody1SemiBold() => GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.16,
  );

  static TextStyle _getCaptionDefault() => GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
  );

  static TextStyle getCaptionSemibold() => GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.12,
  );

}