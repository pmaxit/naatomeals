import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

// Orange Color with Opacity 20 - 80 %
Color orangeColor = HexColor('#FE724C');
Color orangeColor80 = HexColor('#FE8160');
Color orangeColor50 = HexColor('#FEA58D');
Color orangeColor20 = HexColor('#FED2C7');

// Yellow Color with Opacity 20 - 80 %
Color yellowColor = HexColor('#FFC529');
Color yellowColor80 = HexColor('#FFD050');
Color yellowColor50 = HexColor('#FFDF8B');
Color yellowColor20 = HexColor('#FFEFC3');

// Black Color with Opacity 20 - 80 %
Color blackColor = HexColor('#1A1D26');
Color blackColor80 = HexColor('#2A2F3D');
Color blackColor50 = HexColor('#4D5364');
Color blackColor20 = HexColor('#6E7489');

// Gray Color with Opacity 20 - 80 %
Color grayColor = HexColor('#9A9FAE');
Color grayColor80 = HexColor('#A8ACB9');
Color grayColor50 = HexColor('#C4C7D0');
Color grayColor20 = HexColor('#EBEBEB');
Color grayColor10 = HexColor("6C6B6A");

const Color whiteColor = Colors.white;

const String poppins = 'poppins';
Color inputBackgroundColor = HexColor("#F5F5F5");

TextTheme textTheme = TextTheme(
  displayLarge: const TextStyle(
    fontFamily: poppins,
    fontSize: 40,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.25,
    color: Colors.orange,
  ),
  headlineMedium: const TextStyle(
    fontFamily: poppins,
    fontSize: 28,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.25,
  ),
  headlineSmall: const TextStyle(
    fontFamily: poppins,
    fontSize: 24,
    fontWeight: FontWeight.w700,
  ),
  titleLarge: const TextStyle(
    fontFamily: poppins,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.15,
  ),
  titleMedium: const TextStyle(
    fontFamily: poppins,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  ),
  titleSmall: TextStyle(
    fontFamily: poppins,
    fontSize: 14,
    fontWeight: FontWeight.w300,
    letterSpacing: 0,
    color: grayColor,
  ),
  bodyLarge: const TextStyle(
    fontFamily: poppins,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  ),
  bodySmall: const TextStyle(
    fontFamily: poppins,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  ),
  labelLarge: const TextStyle(
    fontFamily: poppins,
    fontSize: 14,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.25,
  ),
);