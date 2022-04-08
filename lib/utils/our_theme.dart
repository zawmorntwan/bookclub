import 'package:flutter/material.dart';

class OurTheme {
  final Color _lightGreen = const Color(0xffD5EBDC);
  final Color lightGrey = const Color(0xffA4A4A4);
  final Color _darkerGrey = const Color(0xff777C87);

  ThemeData buildTheme() {
    return ThemeData(
      canvasColor: _lightGreen,
      primaryColor: _lightGreen,
      secondaryHeaderColor: _darkerGrey,
      // ignore: deprecated_member_use
      accentColor: lightGrey,
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: lightGrey),
      hintColor: lightGrey,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: lightGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: _lightGreen),
        ),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: _darkerGrey,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        minWidth: 200,
        height: 40,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
