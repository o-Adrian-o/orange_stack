import 'package:orange_design_system/design_system/fondation/colors.dart';
import 'package:flutter/material.dart';

class DesignFontWeight {
  static const regular = FontWeight.w400;
  static const medium = FontWeight.w500;
  static const semibold = FontWeight.w600;
  static const bold = FontWeight.w700;
}

class DesignFontSize {
  static const s72 = DesignFontSize(fontSize: 72, lineHeight: 90);
  static const s60 = DesignFontSize(fontSize: 60, lineHeight: 72);
  static const s48 = DesignFontSize(fontSize: 48, lineHeight: 60);
  static const s36 = DesignFontSize(fontSize: 36, lineHeight: 44);
  static const s30 = DesignFontSize(fontSize: 30, lineHeight: 38);
  static const s24 = DesignFontSize(fontSize: 24, lineHeight: 32);
  static const s20 = DesignFontSize(fontSize: 20, lineHeight: 30);
  static const s18 = DesignFontSize(fontSize: 18, lineHeight: 28);
  static const s16 = DesignFontSize(fontSize: 16, lineHeight: 24);
  static const s14 = DesignFontSize(fontSize: 14, lineHeight: 20);
  static const s12 = DesignFontSize(fontSize: 12, lineHeight: 18);

  final double fontSize;
  final double lineHeight;
  double get lineHeightMultiple => lineHeight / fontSize;

  TextStyle get style => TextStyle(fontSize: fontSize, height: lineHeightMultiple, color: DesignColor.neutral.shadeText);
  TextStyle get regular => style.copyWith(fontWeight: DesignFontWeight.regular);
  TextStyle get medium => style.copyWith(fontWeight: DesignFontWeight.medium);
  TextStyle get semibold => style.copyWith(fontWeight: DesignFontWeight.semibold);
  TextStyle get bold => style.copyWith(fontWeight: DesignFontWeight.bold);

  const DesignFontSize({required this.fontSize, required this.lineHeight});
}

extension Styling on String {
  Widget style(TextStyle textStyle) {
    return Text(this, style: textStyle);
  }
}