import 'package:flutter/material.dart';

class Constants {
  static const OUTER_CIRCLE_SIZE = 35.0;
  static const INNER_MARGIN_CIRCLE_SIZE = 37.0;
  static const INNER_CIRCLE_SIZE = 33.0;
  static const INNER_LINE_SIZE = 40.0;
  static const BLACK_CIRCLE_SIZE = 10.0;
  static const HAND_WIDTH = 3.5;
  static const NUMBER_OFFSET = 40.0;
  static const HOUR_ANGLE_IN_DEGREE = 30.0;
  static const MINUTE_HAND_LENGTH = 150.0;
  static const HOUR_HAND_LENGTH = 110.0;
  static const MINUTE_HAND_OFFSET = -52.0;
  static const HOUR_HAND_OFFSET = -25.0;

  static final defaultTextStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 35,
    color: Colors.black,
  );

  static final lightTheme = ThemeData(
    accentColor: Color(0xffff5e2b),
    primaryColor: Colors.black,
    secondaryHeaderColor: Color(0x80d8d8d8),
    highlightColor: Colors.black,
    backgroundColor: Colors.white,
    textTheme: TextTheme(
      display1: defaultTextStyle,
    ),
  );

  static final darkTheme = ThemeData(
    accentColor: Color(0xffff5e2b),
    primaryColor: Colors.white,
    secondaryHeaderColor: Color(0x80d8d8d8),
    highlightColor: Color(0xffd8d8d8),
    backgroundColor: Colors.black,
    textTheme: TextTheme(
      display1: defaultTextStyle.copyWith(color: Colors.white),
    ),
  );
}
