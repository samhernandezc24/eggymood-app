import 'package:flutter/material.dart';

import 'package:eggymood_app/core/constants/app_colors.dart';

class AppTheme {
  static ThemeData? appTheme() {
    return ThemeData(
      appBarTheme: appBarTheme(),
    );
  }

  // AppBar Theme
  static AppBarTheme? appBarTheme() {
    return const AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      elevation: 0,
    );
  }
}