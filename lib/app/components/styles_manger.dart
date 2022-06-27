import 'package:flutter/material.dart';

import '../../core/resources/font_manager.dart';

TextStyle _getTextStyle({
  required double fontSize,
  required FontWeight fontWeight,
  Color color = Colors.black,
}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
  );
}

// light

TextStyle getLightStyle({
  double fontSize = FontSize.s14,
  Color color = Colors.black,
}) {
  return _getTextStyle(
      fontSize: fontSize, fontWeight: FontWeightManager.light, color: color);
}

// regular

TextStyle getRegularStyle({
  double fontSize = FontSize.s16,
  Color color = Colors.black,
}) {
  return _getTextStyle(
      fontSize: fontSize, fontWeight: FontWeightManager.regular, color: color);
}

// medium

TextStyle getMediumStyle({
  double fontSize = FontSize.s18,
  Color color = Colors.black,
}) {
  return _getTextStyle(
      fontSize: fontSize, fontWeight: FontWeightManager.medium, color: color);
}

// semi bold

TextStyle getSemiBoldStyle({
  double fontSize = FontSize.s24,
  Color color = Colors.black,
}) {
  return _getTextStyle(
      fontSize: fontSize, fontWeight: FontWeightManager.semiBold, color: color);
}

// bold

TextStyle getBoldStyle({
  double fontSize = FontSize.s28,
  Color color = Colors.black,
}) {
  return _getTextStyle(
      fontSize: fontSize, fontWeight: FontWeightManager.bold, color: color);
}
