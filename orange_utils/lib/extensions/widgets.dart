import 'package:flutter/widgets.dart';

extension EdgeInsetsGeometryExtensions on EdgeInsetsGeometry? {
  EdgeInsetsGeometry orZero() {
    return this ?? EdgeInsets.zero;
  }
}