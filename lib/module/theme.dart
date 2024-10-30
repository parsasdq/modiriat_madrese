import 'package:flutter/material.dart';

enum Themeenum { Dark, light }

final Map<Themeenum, ThemeData> AppThemeData = {
  Themeenum.light: ThemeData(
    hintColor: Colors.grey[650],
    brightness: Brightness.light,
    primaryColor: Colors.grey[800],
    scaffoldBackgroundColor: Colors.white,
    bottomAppBarTheme:BottomAppBarTheme(color:Colors.grey[100] ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(color: Colors.grey[100])
    )
  ),
    Themeenum.Dark: ThemeData(
    hintColor: Colors.grey[300],
    brightness: Brightness.dark,
    primaryColor: Colors.grey[400],
    scaffoldBackgroundColor: Colors.blueGrey.shade900,
    bottomAppBarTheme:BottomAppBarTheme(color:Colors.grey[400] ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(color: Colors.white70)
    )
  )
};
