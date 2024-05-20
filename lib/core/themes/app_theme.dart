import 'package:flutter/material.dart';
import 'package:maids_task/core/themes/app_pallete.dart';

class AppTheme {
  static final darkTthemeMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppPalette.white,
    appBarTheme: const AppBarTheme(backgroundColor: AppPalette.white),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27),
      enabledBorder: _border(),
      focusedBorder: _border(AppPalette.pink),
    ),
  );

  static _border([Color color = AppPalette.homeBG]) => OutlineInputBorder(
      borderSide: BorderSide(color: color, width: 3),
      borderRadius: BorderRadius.circular(10));
}
