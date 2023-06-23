import 'package:flutter/material.dart';

class DarkTheme {
  static final ThemeData theme = ThemeData(
    colorScheme: const ColorScheme.light(
      secondary: Color.fromARGB(255, 39, 17, 24),
      primaryContainer: Color.fromARGB(255, 41, 27, 104)
    ),

    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontFamily: "OpenSans[700]",
        fontSize: 20,
        color: Color.fromARGB(255, 134, 134, 134),
      ),
    ),

    splashColor: Colors.black,

    iconTheme: const IconThemeData(
      color: Color.fromARGB(255, 109, 8, 84),
    ),
    
  );
}