import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/text_field_theme.dart';
import 'package:hexcolor/hexcolor.dart';

class AppsTheme {
  ThemeData themeData = ThemeData(
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: HexColor("000000"),
          backgroundColor: HexColor("#ffffff"),
          textStyle: const TextStyle(fontSize: 18),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          elevation: 0,
          foregroundColor: HexColor("#000000"),
          textStyle: const TextStyle(fontSize: 18),
        ),
      ),
      inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme);
}
