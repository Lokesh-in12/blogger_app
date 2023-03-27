import 'package:blogger_app/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppThemes {
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: AppColors.blackBasic),
      primaryTextTheme: GoogleFonts.montagaTextTheme(),
      scaffoldBackgroundColor: AppColors.white,
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: AppColors.blackBasic,
          fontSize: 35,
          fontWeight: FontWeight.w200,
        ),
        displayMedium: TextStyle(color: AppColors.blackBasic, fontSize: 20),
        displaySmall: TextStyle(
          color: AppColors.blackBasic,
          fontSize: 15,
          fontWeight: FontWeight.w300,
        ),
        bodySmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w300,
            color: AppColors.blackBasic),
        labelSmall: TextStyle(
            fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.white),
        titleSmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.blackBasic),
      ));

  static const scaffoldBackground = AppColors.white;
  static const appBarBackground = AppColors.white;
}
