import 'package:flutter/material.dart';
import 'package:my_portfolio/components/resources/fonts.dart';
import 'package:my_portfolio/constants/colors.dart';

ThemeData theme() =>  ThemeData(
      fontFamily: Fonts.itim,
      appBarTheme: appBarTheme(),
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      // textTheme: textTheme().apply(
      //   bodyColor: kBlack,
      //   displayColor: kBlack,
      // ),
      // textSelectionTheme: textSelectionTheme(),
      colorScheme: colorScheme(),
      iconTheme: iconTheme(),
      highlightColor: Colors.transparent,
      focusColor: Colors.grey,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      // inputDecorationTheme: inputDecorationTheme(),
    );
  

IconThemeData iconTheme() {
    return const IconThemeData(
      color: black,
    );
  }

   AppBarTheme appBarTheme() {
    return AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 16,
        color: black,
      ),
      foregroundColor: Colors.transparent,
      toolbarHeight: 100,
    );
  }

  ColorScheme colorScheme() {
    return ColorScheme(
      brightness: Brightness.light,
      primary: black,
      onPrimary: white,
      secondary: Colors.white,
      onSecondary:white,
      error: Colors.red,
      onError: Colors.red.shade100,
      surface: black,
      onSurface: Colors.grey.shade100,
    );
  }
