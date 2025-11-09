import 'package:evently/Utils/app_colors.dart';
import 'package:evently/Utils/app_styles.dart';
import 'package:flutter/material.dart';

class AppThemes {
  // Light Theme
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.whiteBGColor,
    primaryColor: AppColors.primaryLight,
    focusColor: AppColors.whiteColor,
    textTheme: TextTheme(
      headlineLarge: AppStyles.bold20Black,
      headlineSmall: AppStyles.medium16Primary,
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.transparentColor,
      selectedItemColor: AppColors.whiteColor,
      unselectedItemColor: AppColors.whiteColor,
      unselectedLabelStyle: AppStyles.bold12White,
      selectedLabelStyle: AppStyles.bold12White,
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryLight,
    ),
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    focusColor: AppColors.primaryLight,
    primaryColor: AppColors.primaryDark,
    scaffoldBackgroundColor: AppColors.primaryDark,

    textTheme: TextTheme(
      headlineLarge: AppStyles.bold20White,
      headlineSmall: AppStyles.medium16White,
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.transparentColor,
      selectedItemColor: AppColors.whiteColor,
      unselectedItemColor: AppColors.whiteColor,
      unselectedLabelStyle: AppStyles.bold12White,
      selectedLabelStyle: AppStyles.bold12White,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryDark,
    ),
  );
}
