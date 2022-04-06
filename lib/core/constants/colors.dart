import 'package:flutter/material.dart';

/// A class that represents the color constant of the application
class AppColors {
  //The purple color
  static const purple = Color(0xff7765C4);
  //The dark purple color
  static const darkPurple = Color(0xff6C648E);

  // The background color
  static const background = Color(0xffE5E7EB);

  // The background2 color
  static const background2 = Color(0xffFAF9FF);

  // The dark text color
  static const darkText = Color(0xff3B3B3B);

  // The Light text color
  static const lightText = Color(0xff707070);

  // The green color
  static const green = Color(0xff65C4AD);

  // The blue color
  static const blue = Color(0xff65ADC4);

  // The brown color
  static const brown = Color(0xffE47673);

  // The  [colorScratch] of the application
  static const Map<int, Color> colorScratch = {
    50: Color.fromRGBO(119, 101, 196, .1),
    100: Color.fromRGBO(119, 101, 196, .2),
    200: Color.fromRGBO(119, 101, 196, .3),
    300: Color.fromRGBO(119, 101, 196, .4),
    400: Color.fromRGBO(119, 101, 196, .5),
    500: Color.fromRGBO(119, 101, 196, .6),
    600: Color.fromRGBO(119, 101, 196, .7),
    700: Color.fromRGBO(119, 101, 196, .8),
    800: Color.fromRGBO(119, 101, 196, .9),
    900: Color.fromRGBO(119, 101, 196, 1),
  };
}
