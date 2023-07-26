import 'package:flutter/material.dart';
import 'package:naatomeals/utils/styles.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: orangeColor, onPrimary: blackColor, secondary: orangeColor),
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: appBarColor,
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
        elevation: MaterialStateProperty.all(2),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        textStyle: MaterialStateProperty.all(
          textTheme.headlineMedium?.copyWith(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 24,
            // google fonts
          ),
        ),
        minimumSize: MaterialStateProperty.all(const Size(200, 60)),
        backgroundColor: MaterialStateProperty.all(orangeColor),
        foregroundColor: MaterialStateProperty.all(blackColor),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: whiteColor),
        borderRadius: BorderRadius.circular(20),
      ),
      filled: true,
      fillColor: inputBackgroundColor,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: orangeColor),
        borderRadius: BorderRadius.circular(20),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: whiteColor),
      ),
      hintStyle: const TextStyle(
        fontFamily: poppins,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          textTheme.titleSmall?.copyWith(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16,
            // google fonts
          ),
        ),
        minimumSize: MaterialStateProperty.all(const Size(5, 0)),
        padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        foregroundColor: MaterialStateProperty.all(whiteColor),
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
        elevation: MaterialStateProperty.all(2),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        textStyle: MaterialStateProperty.all(
          textTheme.headlineMedium?.copyWith(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 24,
            // google fonts
          ),
        ),
        minimumSize: MaterialStateProperty.all(const Size(200, 50)),
        backgroundColor: MaterialStateProperty.all(orangeColor),
        foregroundColor: MaterialStateProperty.all(whiteColor),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      filled: true,
      fillColor: inputBackgroundColor,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: orangeColor),
      ),
      enabledBorder: InputBorder.none,
      hintStyle: const TextStyle(
        fontFamily: poppins,
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
