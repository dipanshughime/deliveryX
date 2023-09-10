import "package:flutter/material.dart";

class MyThemes {
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: Color.fromARGB(255, 249, 249, 249),
      colorScheme: ColorScheme.light());

  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white, colorScheme: ColorScheme.light());
}
