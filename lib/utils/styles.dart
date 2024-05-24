import 'package:flutter/material.dart';

class Styles {
  static const deepBlue = Color(0xFF203461);
  static const creamyWhite = Color(0xFFEFEBEB);
  static const pink = Color(0xFFFE0547);
  static const lightPink = Color(0xFFF9E1E7);
  static const grey = Color(0xFFF9F9F9);
  static const grey2 = Color(0xFFF2F2F2);

  static InputDecoration kInputDecoration1 = const InputDecoration(
    constraints: BoxConstraints(),
    isDense: true,
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
    ),
  );

  static const LinearGradient storyGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    tileMode: TileMode.decal,
    colors: [
      Styles.pink,
      Colors.redAccent,
      Colors.yellowAccent,
    ],
  );
}
