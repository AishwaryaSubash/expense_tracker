import 'package:flutter/material.dart';

class CustomTheme {
  static final darkTheme = ThemeData(
    fontFamily: "Nunito",
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
    ),
    scaffoldBackgroundColor: const Color(0xFF1E1F28),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E1F28),
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.white,
      ),
    ),
  );
  static final lightTheme = ThemeData(
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
    ),
    fontFamily: "Nunito",
    scaffoldBackgroundColor: const Color(0xFFf6f6f6),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFf6f6f6),
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Color(0xFF979797),
      ),
    ),
  );
}
