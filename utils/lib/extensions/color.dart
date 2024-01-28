import 'package:flutter/widgets.dart';

extension ColorExtension on Color {
  double get grayscale => (0.299 * red) + (0.587 * green) + (0.114 * blue);
  bool get isDark => grayscale < 128;
  bool get isLight => grayscale >= 128;

  /// Returns a copy of this color with the given luminance multiplier.
  Color luminance(double multiplier) {
    final hsl = HSLColor.fromColor(this);
    final luminance = hsl.withLightness((hsl.lightness * multiplier).clamp(0.0, 1.0));
    return luminance.toColor();
  }
}