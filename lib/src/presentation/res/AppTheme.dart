import 'package:customers_manager/src/presentation/res/AppColors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light => ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.lightGrey,
    appBarTheme: AppBarTheme(
      color: AppColors.black,
      brightness: Brightness.dark,
      textTheme: TextTheme(
        subtitle1: TextStyle(color: AppColors.white),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.black,
    ),
    primaryColor: AppColors.black,
    primaryColorLight: AppColors.white,
    primaryColorDark: AppColors.lightGrey,
    accentColor: AppColors.black,
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.black,
      textTheme: ButtonTextTheme.primary,
    ),
  );

  static ThemeData get dark => ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
      color: AppColors.white,
      brightness: Brightness.light,
      textTheme: TextTheme(
        subtitle1: TextStyle(color: AppColors.black),
      ),
    ),
    primaryColor: AppColors.white,
    primaryColorLight: AppColors.lightGrey,
    primaryColorDark: AppColors.black,
    accentColor: AppColors.white,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.white,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.black,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}