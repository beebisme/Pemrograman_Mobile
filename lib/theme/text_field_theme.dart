import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TTextFormFieldTheme {
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
      border: OutlineInputBorder(),
      prefixIconColor: HexColor('#000000'),
      floatingLabelStyle: TextStyle(
        color: HexColor('#000000'),
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: HexColor('#000000'))));
}
