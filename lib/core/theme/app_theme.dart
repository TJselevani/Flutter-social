import 'package:flutter/material.dart';
import 'package:social/core/theme/app_pallet.dart';

class AppTheme {
  static _borderLayout([Color color = AppPalette.greenColor]) =>
      OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(20),
      );
  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPalette.greenColor1,
    appBarTheme: const AppBarTheme(backgroundColor: AppPalette.greenColor1),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27),
      enabledBorder: _borderLayout(),
      focusedBorder: _borderLayout(AppPalette.greenColor3),
      errorBorder: _borderLayout(AppPalette.brownColor6),
      focusedErrorBorder:  _borderLayout(AppPalette.brownColor12),
    ),
  );
}
