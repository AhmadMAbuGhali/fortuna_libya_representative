import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: FontConstants.fontFamily,
      color: color,
      fontWeight: fontWeight);
}

// regular style

TextStyle getRegularStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}

// medium style

TextStyle getMediumStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}

// Light style

TextStyle getLightStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color);
}
// Extra Light style

TextStyle getExtraLightStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.extraLight, color);
}

// bold style

TextStyle getBoldStyle(
    {double fontSize = FontSize.s16, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}

//extra bold style
TextStyle getExtraBoldStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.extraBold, color);
}
// black style
TextStyle getBlackStyle(
    {double fontSize = FontSize.s22, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.black, color);
}