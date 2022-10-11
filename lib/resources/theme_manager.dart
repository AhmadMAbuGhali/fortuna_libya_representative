
import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'font_manager.dart';
import 'styles_manager.dart';
import 'values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main colors
    primaryColor: ColorManager.primary,
   scaffoldBackgroundColor: ColorManager.white,
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorManager.white,
        elevation: 0,
        // shadowColor: ColorManager.lightPrimary,
        titleTextStyle:
            getMediumStyle(fontSize: FontSize.s22, color: ColorManager.primary)),

    // elevated button them
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(

            textStyle: getMediumStyle(
                color: ColorManager.white, fontSize: FontSize.s18), backgroundColor: ColorManager.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s50)))),


  );
}
