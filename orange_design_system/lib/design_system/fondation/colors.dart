import 'package:flutter/painting.dart';
import 'package:material_color_generator/material_color_generator.dart';

/// It is highly encouraged to create a secondary **ColorPalette**, in order to integrate secondary colors.
/// - [neutral] is a neutral color and is the foundation of the color system. Almost everything in UI design — text, form fields, backgrounds, dividers — are usually gray.
/// - [primary] is your "brand" color, and is used across all interactive elements such as buttons, links, inputs, etc. This color can define the overall feel and can elicit emotion.
/// - [error] are used across error states and in "destructive" actions. They communicate a destructive/negative action, such as removing a user from your team.
/// - [warning] can communicate that an action is potentially destructive or "on-hold". These colors are commonly used in confirmations to grab the users' attention.
/// - [success] communicate a positive action, positive trend, or a successful confirmation. If you're using green as your primary color, it can be helpful to introduce a different hue for your success green.
class DesignColor extends ColorSwatch<int> {

  static const magenta = Color(0xffff00ff);
  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff000000);
  static const Color transparent = Color(0x00000000);

  static DesignColor neutral = fromColor(color: magenta);
  static DesignColor primary = fromColor(color: magenta);
  static DesignColor error = fromColor(color: magenta);
  static DesignColor warning = fromColor(color: magenta);
  static DesignColor success = fromColor(color: magenta);

  const DesignColor(super.primary, super.swatch);
  Color get shade25 => this[25]!;
  Color get shade50 => this[50]!;
  Color get shade100 => this[100]!;
  Color get shade200 => this[200]!;
  Color get shade300 => this[300]!;
  Color get shade400 => this[400]!;
  Color get shade500 => this[500]!;
  Color get shade600 => this[600]!;
  Color get shade700 => this[700]!;
  Color get shade800 => this[800]!;
  Color get shade900 => this[900]!;

  Color get shadeIconHighlight => shade100;
  Color get shadeIcon => shade900;
  Color get shadeText => shade900;
  Color get shadeSeparator => shade100;
  Color get shadeBackground => shade50;
  Color get shadeNeutral => shade500;

  List<Color> get shades => [
    shade25,
    shade50,
    shade100,
    shade200,
    shade300,
    shade400,
    shade500,
    shade600,
    shade700,
    shade800,
    shade900
  ];

  static DesignColor fromColor({required Color color}) {
    return DesignColor(color.value, {
      25: tintColor(color, 0.95),
      50: tintColor(color, 0.9),
      100: tintColor(color, 0.8),
      200: tintColor(color, 0.6),
      300: tintColor(color, 0.4),
      400: tintColor(color, 0.2),
      500: color,
      600: shadeColor(color, 0.1),
      700: shadeColor(color, 0.2),
      800: shadeColor(color, 0.3),
      900: shadeColor(color, 0.4),
    });
  }
}