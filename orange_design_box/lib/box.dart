import 'package:flutter/material.dart';
import 'package:orange_utils/orange_utils.dart';

BorderRadius boxRadius(double radius) =>
    BorderRadius.all(Radius.circular(radius));

BoxShadow boxShadow(double elevation, {int alpha = 25}) => BoxShadow(
    color: Color.fromARGB(alpha, 0, 0, 0),
    offset: Offset(0, elevation / 3),
    blurRadius: elevation,
    spreadRadius: elevation);

BoxBorder boxBorder(Color color,
        {double width = 1, BorderStyle style = BorderStyle.solid}) =>
    Border.all(
        color: color,
        width: width,
        style: style,
        strokeAlign: BorderSide.strokeAlignOutside);

Gradient boxGradient(
        {required AlignmentGeometry begin,
        required AlignmentGeometry end,
        required Color beginColor,
        required Color endColor}) =>
    LinearGradient(
      begin: begin,
      end: end,
      colors: [
        beginColor,
        endColor,
      ],
    );

class Box extends StatelessWidget {
  final double? width;
  final double? height;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final Gradient? gradient;
  final BorderRadius? radius;
  final List<BoxShadow>? shadow;
  final BoxBorder? border;
  final void Function(BuildContext context)? onPressed;
  final Color? onPressedColor;
  final double onPressedColorIntensity;
  final Widget? child;
  final bool canClickThrough;

  const Box(
      {super.key,
      this.width,
      this.height,
      this.constraints,
      this.color,
      this.gradient,
      this.padding,
      this.margin,
      this.radius,
      this.shadow,
      this.border,
      this.onPressed,
      this.onPressedColor,
      this.onPressedColorIntensity = 1,
      this.child,
      this.canClickThrough = false});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin,
        width: width,
        height: height,
        constraints: constraints,
        decoration: buildDecoration(),
        child: withOptionalOnPressed(child));
  }

  Widget? withOptionalOnPressed(Widget? child) {
    if (onPressed == null) {
      return withOptionalPadding();
    }
    return Builder(builder: (BuildContext context) {
      return Material(
          color: const Color.fromARGB(0, 0, 0, 0),
          child: InkWell(
              hoverColor: onPressedColor
                  ?.withAlpha((10 * onPressedColorIntensity).floor()),
              focusColor: onPressedColor
                  ?.withAlpha((15 * onPressedColorIntensity).floor()),
              highlightColor: onPressedColor
                  ?.withAlpha((20 * onPressedColorIntensity).floor()),
              splashColor: onPressedColor
                  ?.withAlpha((20 * onPressedColorIntensity).floor()),
              splashFactory: InkRipple.splashFactory,
              customBorder: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(radius?.bottomLeft.x ?? 0)),
              onTap: () {
                onPressed?.call(context);
              },
              child: withOptionalPadding()));
    });
  }

  Widget? withOptionalPadding() {
    if (padding == null) {
      return child;
    }
    return Padding(padding: padding.orZero(), child: child);
  }

  Decoration? buildDecoration() {
    if (shadow == null && radius == null && color == null && gradient == null) {
      return null;
    }
    return GestureDecorationBox(
        canClickThrough: this.canClickThrough,
        color: gradient == null ? color : null,
        gradient: gradient,
        border: border,
        borderRadius: radius,
        boxShadow: shadow);
  }
}

class GestureDecorationBox extends BoxDecoration {
  final bool canClickThrough;

  const GestureDecorationBox({
    this.canClickThrough = false,
    Color? color,
    DecorationImage? image,
    BoxBorder? border,
    BorderRadiusGeometry? borderRadius,
    List<BoxShadow>? boxShadow,
    Gradient? gradient,
    BlendMode? backgroundBlendMode,
    BoxShape shape = BoxShape.rectangle,
  }) : super(
            color: color,
            image: image,
            border: border,
            borderRadius: borderRadius,
            boxShadow: boxShadow,
            gradient: gradient,
            backgroundBlendMode: backgroundBlendMode,
            shape: shape);

  @override
  bool hitTest(Size size, Offset position, {TextDirection? textDirection}) {
    return canClickThrough
        ? false
        : super.hitTest(size, position, textDirection: textDirection);
  }
}
