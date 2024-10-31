import 'package:flutter/material.dart';

import 'configs.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get dark {
    return ThemeData(
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        backgroundColor: AppColors.textPrimary,
        centerTitle: true,
      ),
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.textPrimary, brightness: Brightness.dark),
      scaffoldBackgroundColor: AppColors.mainBackground,
      textTheme: const TextTheme(
          headlineLarge: headerSpecial,
          headlineMedium: headerXL,
          headlineSmall: headerXL,
          titleLarge: headerL,
          titleMedium: headerM,
          titleSmall: headerS,
          displayLarge: body1,
          displayMedium: body2,
          labelLarge: caption1,
          labelSmall: caption2),
    );
  }
}
