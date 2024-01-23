import 'package:flutter/widgets.dart';

class DesignShadow {
  static final s2 = [
    shadowFrom(opacity: 0.05, y: 1, blur: 2, spread: 0)
  ];
  static final s3 = [
    shadowFrom(opacity: 0.1, y: 1, blur: 3, spread: 0),
    shadowFrom(opacity: 0.06, y: 1, blur: 2, spread: 0)
  ];
  static final s8 = [
    shadowFrom(opacity: 0.1, y: 4, blur: 8, spread: -2),
    shadowFrom(opacity: 0.06, y: 2, blur: 4, spread: -2)
  ];
  static final s16 = [
    shadowFrom(opacity: 0.08, y: 12, blur: 16, spread: -4),
    shadowFrom(opacity: 0.03, y: 4, blur: 6, spread: -2)
  ];
  static final s24 = [
    shadowFrom(opacity: 0.08, y: 20, blur: 24, spread: -4),
    shadowFrom(opacity: 0.03, y: 8, blur: 8, spread: -4)
  ];
  static final s48 = [
    shadowFrom(opacity: 0.18, y: 24, blur: 48, spread: -12)
  ];
  static final s64 = [
    shadowFrom(opacity: 0.14, y: 32, blur: 64, spread: -12)
  ];

  static BoxShadow shadowFrom({required double opacity, required double y, required double blur, required double spread}) {
    const shadowColor = Color(0xFF101828);
    return BoxShadow(
        color: shadowColor.withOpacity(opacity), offset: Offset(0, y), blurRadius: blur, spreadRadius: spread);
  }
}

class DesignBlur {
  static const b8 = 8.0;
  static const b16 = 16.0;
  static const b24 = 24.0;
  static const b40 = 40.0;
}
