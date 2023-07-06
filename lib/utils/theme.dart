import 'package:flutter/material.dart';
import 'package:naatomeals/utils/styles.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: orangeColor, onPrimary: blackColor, secondary: orangeColor),
    appBarTheme: const AppBarTheme(
      elevation: 0,
    ),
    scaffoldBackgroundColor: whiteColor,
    textTheme: textTheme.apply(
        bodyColor: blackColor,
        decorationColor: blackColor,
        displayColor: blackColor),
    iconTheme: IconThemeData(
      color: blackColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all(orangeColor),
        foregroundColor: MaterialStateProperty.all(orangeColor),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: blackColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: orangeColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: blackColor),
      ),
      hintStyle: const TextStyle(
        fontFamily: sofia,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
      ),
    ),
  );

  // define dark theme
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: blackColor, onPrimary: whiteColor,
      //secondary: orangeColor
    ),
    scaffoldBackgroundColor: blackColor,
    textTheme: textTheme.apply(
        bodyColor: whiteColor,
        decorationColor: whiteColor,
        displayColor: whiteColor),
    iconTheme: const IconThemeData(
      color: whiteColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all(orangeColor),
        foregroundColor: MaterialStateProperty.all(orangeColor),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: whiteColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: orangeColor),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: whiteColor),
      ),
      hintStyle: const TextStyle(
        fontFamily: sofia,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
      ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(Colors.blue[800]),
      trackColor: MaterialStateProperty.all(Colors.blue[800]),
      overlayColor: MaterialStateProperty.all(grayColor),
    ),

    // define dark theme
    // darkTheme: ThemeData.dark().copyWith(
    //   colorScheme: ColorScheme.fromSwatch().copyWith(
    //       primary: blackColor, onPrimary: whiteColor, secondary: orangeColor),
    //   scaffoldBackgroundColor: blackColor,
  );
}
