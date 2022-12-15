import 'package:flutter/material.dart';

class AppColor {
  // appcolors._();

  static const Color transparent = Color(0xFF00000000);

// ! App Colors
  static const Color primarycolor = Color(0xFF4aa3af);
  static const Color secondarycolor = Color(0xFFf0c042);
  static const Color backgroundcolor = Color(0xFFffffff);

// !Rendom Colors
  static const Color white = Color(0xFFffffff);
  static const Color black = Color(0xFF000000);
  static const Color green = Colors.greenAccent;
  static const Color red = Color(0xFFF2272C);

  static const Color lightgrey = Color(0xFFf2f2f2);
  static const Color grey = Color(0xFFcccccc);

// ! Text Colors
  static const Color whiteText = Color(0xFFFFFFFF);
  static const Color darkText = Color(0xFF000000);
  static const Color pinkText = Color(0xFFFF65C5);
  static const Color greyText = Color(0xFF979796);
  static const Color redText = Color(0xFFF2272C);
  static const Color greenText = Color(0xFF00C569);
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 8) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 32);
  }
}