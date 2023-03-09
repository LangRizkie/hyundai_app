import 'package:flutter/material.dart';

class Palette {
  static const Color primaryColor = Color(0xFF002C5F);
  static const Color secondaryColor = Color(0xFF00AAD2);
  static const Color backgroundColor = Color(0xFFF6F3F2);
  static const Color backgroundSecondaryColor = Color(0xFFE4DCD3);
}

class Constant {
  static const fontFamilyHead = 'HyundaiSansHead';
  static const fontFamilyText = 'HyundaiSansText';
}

class CustomTheme {
  static final ThemeData theme = ThemeData(
    fontFamily: Constant.fontFamilyHead,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: Constant.fontFamilyHead,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Palette.primaryColor,
          width: 2,
        ),
      ),
    ),
  );
}
