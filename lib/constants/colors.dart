// import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:foodwallfy/services/responses.dart';

class FzColors {
  FzColors._();

  //* Light Theme
  static const Color appColor = Color(0xFF000000);
  static const Color canvasColor = Color(0xFFFFFFFF);
  static const Color textColor = Color(0xFFFFFFFF);
  static const Color iconColor = Color(0xFFFFFFFF);
  static const Color blackColor = Color(0xFF000000);

  //* Dark Theme
  static const Color darkAppColor = Color(0xFF2C3E50);
  static const Color darkCanvasColor = Color(0xFF000000);
  static const Color darkTextColor = Color(0xFFFFFFFF);
  static const Color darkIconColor = Color(0xFF000000);
  static const Color darkIconColorClone = Color(0xFF00000);
  //* Gradients
  // static const Color pinkGradient = Color(0xFFCC0099);
  // static const Color blueGradient = Color(0xFF6600FF);

  //* Hex to Color
  //* Construct a color from a hex code string, of the format #RRGGBB
  static Color hexToColor(String code) =>
      Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);

  //* Get Colors in a List
  static List<Color> getListColors(List<String> colors) =>
      colors.map((color) => FzColors.hexToColor(color)).toList();

  //* Loader Colors
  static List<Color> getLoaderColors() => FzColors.getListColors(
        ["#FF512F", "#DD2476"], // Bloody Mary
      );
  static List<double> getLoaderStops() => [
        0.0,
        0.5,
      ];
}
