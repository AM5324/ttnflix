
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ttn_flix/presentation/themes/ttn_flix_color.dart';
import 'package:ttn_flix/presentation/themes/ttn_flix_spacing.dart';
import 'package:ttn_flix/presentation/themes/ttn_flix_text_style.dart';

class TTNFlixTheme{
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scrollbarTheme: const ScrollbarThemeData()
        .copyWith(thumbColor: const MaterialStatePropertyAll(Colors.black)),
    primaryColor: TTNFlixColor.primaryColor.lightColor,
    canvasColor: TTNFlixColor.canvasColor.lightColor,
    fontFamily: 'Inter',
    splashColor: Platform.isIOS ? Colors.transparent : null,
    dividerColor: TTNFlixColor.dividerColor.lightColor,
    disabledColor: TTNFlixColor.groundColor.lightColor?.withOpacity(0.345),
    shadowColor: TTNFlixColor.groundColor.lightColor?.withOpacity(0.33),
    dividerTheme: _getDividerThemeData(Brightness.light),
    inputDecorationTheme: _getInputDecorationTheme(Brightness.light),
    appBarTheme: _appBarThemeData(Brightness.light),
    textTheme: TTNFlixTextStyle.defaultTextTheme.apply(
        bodyColor: TTNFlixColor.primaryColor.lightColor,
        displayColor: TTNFlixColor.primaryColor.lightColor,),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scrollbarTheme: const ScrollbarThemeData()
        .copyWith(thumbColor: const MaterialStatePropertyAll(Colors.black)),
    primaryColor: TTNFlixColor.primaryColor.darkColor,
    canvasColor: TTNFlixColor.canvasColor.darkColor,
    fontFamily: 'Inter',
    splashColor: Platform.isIOS ? Colors.transparent : null,
    dividerColor: TTNFlixColor.dividerColor.darkColor,
    disabledColor: TTNFlixColor.groundColor.darkColor?.withOpacity(0.345),
    shadowColor: TTNFlixColor.groundColor.darkColor?.withOpacity(0.33),
    dividerTheme: _getDividerThemeData(Brightness.dark),
    inputDecorationTheme: _getInputDecorationTheme(Brightness.dark),
    appBarTheme: _appBarThemeData(Brightness.dark),
    textTheme: TTNFlixTextStyle.defaultTextTheme.apply(
      bodyColor: TTNFlixColor.primaryColor.darkColor,
      displayColor: TTNFlixColor.primaryColor.darkColor,),
  );

  static InputDecorationTheme _getInputDecorationTheme(Brightness brightness) {
    final secondaryTextColor = TTNFlixColor.tabSecondaryTextColor[brightness];

    final floatingLabelStyle = TTNFlixTextStyle.getBody1SemiBold()
        .copyWith(color: secondaryTextColor);
    final helperStyle = TTNFlixTextStyle.defaultTextTheme.bodySmall!
        .copyWith(color: secondaryTextColor, height: 0.8);
    final errorColor = TTNFlixColor.onErrorColor[brightness];
    final errorStyle = TTNFlixTextStyle.defaultTextTheme.bodySmall!
        .copyWith(color: errorColor, height: 0.8);

    final enabledBorderColor = TTNFlixColor.dividerColor[brightness];
    final focusedBorderColor = TTNFlixColor.primaryColor[brightness];
    final disabledBorderColor =
    TTNFlixColor.onDisabledBoundaryColor[brightness];

    InputBorder border({Color? color}) {
      return OutlineInputBorder(
        borderSide: BorderSide(color: color ?? Colors.white),
        borderRadius:
        const BorderRadius.all(Radius.circular(TTNFlixSpacing.spacing16)),
      );
    }

    return InputDecorationTheme(
      border: border(),
      enabledBorder: border(color: enabledBorderColor),
      focusedBorder: border(color: focusedBorderColor),
      disabledBorder: border(color: disabledBorderColor),
      errorBorder: border(color: errorColor),
      helperStyle: helperStyle,
      errorStyle: errorStyle,
      floatingLabelStyle: floatingLabelStyle,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      contentPadding: const EdgeInsets.all(TTNFlixSpacing.spacing16),
    );
  }

  static DividerThemeData _getDividerThemeData(Brightness brightness) {
    return DividerThemeData(
      color: TTNFlixColor.dividerColor[brightness],
      thickness: 0.5,
      space: 0.5,
      indent: 0,
      endIndent: 0,
    );
  }

  static AppBarTheme _appBarThemeData(Brightness brightness) {
    return AppBarTheme(
        backgroundColor: TTNFlixColor.primaryColor[brightness],
        iconTheme: IconThemeData(color: TTNFlixColor.canvasColor[brightness]),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: brightness,
            statusBarIconBrightness: brightness == Brightness.dark
                ? Brightness.light
                : Brightness.dark,
            statusBarColor: Colors.transparent));
  }

  static ColorScheme _getAppColorScheme(Brightness brightness) {
    return ColorScheme(
        primary: TTNFlixColor.primaryColor[brightness]!,
        secondary: TTNFlixColor.secondaryColor[brightness]!,
        surface: TTNFlixColor.canvasColor[brightness]!,
        background: TTNFlixColor.backgroundColor[brightness]!,
        error: TTNFlixColor.onErrorColor[brightness]!,
        onPrimary: TTNFlixColor.primaryColor[brightness]!,
        onSecondary: TTNFlixColor.secondaryColor[brightness]!,
        onSurface: TTNFlixColor.surfaceColor[brightness]!,
        onBackground: TTNFlixColor.onBackgroundColor[brightness]!,
        onError: TTNFlixColor.onErrorColor[brightness]!,
        brightness: brightness);
  }

  static BottomSheetThemeData _bottomSheetThemeData(Brightness brightness) =>
      BottomSheetThemeData(
          modalBackgroundColor:
          TTNFlixColor.groundColor[brightness]!.withOpacity(0.2),
          modalBarrierColor:
          TTNFlixColor.groundColor[brightness]?.withOpacity(0.2));

}