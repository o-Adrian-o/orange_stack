import 'package:flutter/material.dart';

class DesignSpacing {
  static const s4 = 4.0;
  static const s8 = 8.0;
  static const s12 = 12.0;
  static const s16 = 16.0;
  static const s20 = 20.0;
  static const s24 = 24.0;
  static const s32 = 32.0;
  static const s40 = 40.0;
  static const s48 = 48.0;
  static const s64 = 64.0;
  static const s80 = 80.0;
  static const s96 = 96.0;
  static const s128 = 128.0;
  static const s256 = 256.0;
}

class DesignContainer {
  static const c640 = 640.0;
  static const c768 = 768.0;
  static const c1024 = 1024.0;
  static const c1280 = 1280.0;
}

class DesignRadius {
  static const r2 = DesignRadius(2.0);
  static const r4 = DesignRadius(4.0);
  static const r8 = DesignRadius(8.0);
  static const r12 = DesignRadius(12.0);
  static const r16 = DesignRadius(16.0);
  static const rI = DesignRadius(double.infinity);

  final double value;

  const DesignRadius(this.value);

  Radius get radius => Radius.circular(value);
  BorderRadius get all => BorderRadius.all(radius);
  BorderRadius get top => BorderRadius.only(topLeft: radius, topRight: radius);
  BorderRadius get bottom => BorderRadius.only(bottomLeft: radius, bottomRight: radius);
  BorderRadius get left => BorderRadius.only(topLeft: radius, bottomLeft: radius);
  BorderRadius get right => BorderRadius.only(topRight: radius, bottomRight: radius);
}

extension SpaceExtension on double {
  Widget asWidget() {
    return Container(margin: EdgeInsets.all(this));
  }

  EdgeInsets get edgeHorizontal => EdgeInsets.symmetric(horizontal: this);
  EdgeInsets get edgeVertical => EdgeInsets.symmetric(horizontal: this);
  EdgeInsets get edgeAll => EdgeInsets.all(this);
}