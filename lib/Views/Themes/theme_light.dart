import 'package:flutter/material.dart';

class LightTheme {
  static final ThemeData theme = ThemeData(
    colorScheme: const ColorScheme.light().copyWith(
      primary: Colors.deepPurpleAccent,
      secondary: const Color.fromARGB(255, 240, 98, 146),
      background: const Color.fromARGB(255, 253, 240, 241),
      primaryContainer: Colors.purple,
      error: Colors.red,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontFamily: "OpenSans",
        fontSize: 20,
        color: Colors.black,
      ),
    ),
    splashColor: Colors.white,
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 219, 72, 153),
    ),
  );
}
