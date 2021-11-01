import 'package:flutter/material.dart';
import 'my_custom_colors.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    tabBarTheme: const TabBarTheme(
      labelColor: Palette.myDarkAccent, /* labelStyle: TextStyle(fontSize: 25) */
    ),
    primarySwatch: Palette.myDarkColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blue[900]
        //Color(0xff4285F4),
        //const Color.fromRGBO(66, 133, 244, 1),
    ),
    scaffoldBackgroundColor: Palette.myDarkColor,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Palette.myDarkAccent),
      toolbarTextStyle: TextStyle(
        color: Palette.myDarkAccent,
      ),
      backgroundColor: Palette.myDarkColor,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Palette.myDarkAccent,
      ),
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(fontSize: 14),
      bodyText2: TextStyle(
        fontSize: 18,
      ),
      headline6: TextStyle(
        fontSize: 28,
      ),
    ),
  );
}
