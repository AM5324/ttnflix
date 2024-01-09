
import 'package:flutter/material.dart';

class TTNFlixColor {
  TTNFlixColor._();

  static const Color _greyColor = Color(0xFF212121);
  static const Color _darkGreyColor = Color(0xFF424242);
  static const Color _dividerColor = Color(0xff342c2f);
  static const Color _groundGrey = Color(0xFF333333);
  static const Color _cautiousRedDark = Color(0xFFFF3819);
  static const Color _informGrey = Color(0xFF191919);
  static const Color _boundaryGrey = Color(0xFFE5E5E5);
  static const Color _blue = Color(0xFF0071EB);


  static final Map<Brightness, Color> primaryColor = _buildColor(
      lightColor: _darkGreyColor,
      darkColor: _darkGreyColor);

  static final Map<Brightness, Color> canvasColor = _buildColor(
      lightColor: _greyColor,
      darkColor: _greyColor);

  static final Map<Brightness, Color> dividerColor = _buildColor(
      lightColor: _dividerColor, darkColor: _dividerColor);

  static final Map<Brightness, Color> groundColor =
  _buildColor(lightColor: _groundGrey, darkColor: _groundGrey);

  static final Map<Brightness, Color> tabSecondaryTextColor = _buildColor(
      lightColor: _groundGrey.withOpacity(0.69),
      darkColor: _groundGrey.withOpacity(0.69));

  static final Map<Brightness, Color> onErrorColor = _buildColor(
      lightColor: _cautiousRedDark,
      darkColor: _cautiousRedDark);

  static final Map<Brightness, Color> onDisabledBoundaryColor = _buildColor(
      lightColor: _boundaryGrey,
      darkColor: _informGrey);

  static final Map<Brightness, Color> secondaryColor = _buildColor(
      lightColor: _blue, darkColor: _blue);

  static final Map<Brightness, Color> accentColor = _buildColor(
      lightColor: _darkGreyColor,
      darkColor: _darkGreyColor);

  static final Map<Brightness, Color> backgroundColor = _buildColor(
      lightColor: _darkGreyColor,
      darkColor: _darkGreyColor);

  static final Map<Brightness, Color> surfaceColor = _buildColor(
      lightColor: _boundaryGrey,
      darkColor: _informGrey);

  static final Map<Brightness, Color> onBackgroundColor = _buildColor(
      lightColor: _informGrey,
      darkColor: _boundaryGrey);

  static Map<Brightness, Color> _buildColor(
      {required Color lightColor, required Color darkColor}) {
    final Map<Brightness, Color> colorMap = {};

    colorMap.putIfAbsent(Brightness.light, () => lightColor);
    colorMap.putIfAbsent(Brightness.dark, () => darkColor);

    return colorMap;
  }
}

extension ColorMap on Map<Brightness, Color> {
  Color? get lightColor => this[Brightness.light];

  Color? get darkColor => this[Brightness.dark];

  Color? platformBrightnessColor(BuildContext context) {
    // We need to check the theme mode to be able disable dark mode completely.
    // Indeed, Platform.brightness will still be `dark` even if we force the ThemeMode to be `light` in the MaterialApp.
    final ThemeMode themeMode =
        context.findAncestorWidgetOfExactType<MaterialApp>()?.themeMode ??
            ThemeMode.system;
    final Brightness brightness;

    switch (themeMode) {
      case ThemeMode.system:
        brightness = MediaQuery.of(context).platformBrightness;
        break;
      case ThemeMode.light:
        brightness = Brightness.light;
        break;
      case ThemeMode.dark:
        brightness = Brightness.dark;
        break;
    }

    return this[brightness];
  }
}