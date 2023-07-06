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

const Color whiteColor = Colors.white;

const String sofia = 'sofia';

const TextTheme textTheme = TextTheme(
  displayLarge: TextStyle(
    fontFamily: sofia,
    fontSize: 40,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.25,
    color: Colors.black,
  ),
  headlineMedium: TextStyle(
    fontFamily: sofia,
    fontSize: 28,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.25,
  ),
  headlineSmall: TextStyle(
    fontFamily: sofia,
    fontSize: 24,
    fontWeight: FontWeight.w700,
  ),
  titleLarge: TextStyle(
    fontFamily: sofia,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.15,
  ),
  titleMedium: TextStyle(
    fontFamily: sofia,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  ),
  titleSmall: TextStyle(
    fontFamily: sofia,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  ),
  bodyLarge: TextStyle(
    fontFamily: sofia,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  ),
  bodySmall: TextStyle(
    fontFamily: sofia,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  ),
  labelLarge: TextStyle(
    fontFamily: sofia,
    fontSize: 14,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.25,
  ),
);
