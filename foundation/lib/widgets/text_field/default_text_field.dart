import 'package:flutter/material.dart';
import 'package:orange_design_system/design_system/foundation/colors.dart';
import 'package:orange_design_system/design_system/foundation/dimensions.dart';
import 'package:simple_animations/simple_animations.dart';

class DefaultTextField extends StatefulWidget {
  final Color? fillColor;
  final Color? hintColor;
  final Color? focusColor;
  final TextStyle? textStyle;
  final TextStyle? errorStyle;
  final BorderRadius? borderRadius;
  final double? borderWidth;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final String? hintText;
  final String? errorText;

  const DefaultTextField(
      {super.key,
      this.fillColor,
      this.textStyle,
      this.errorStyle,
      this.borderRadius,
      this.borderWidth,
      this.onChanged,
      this.onSubmitted,
      this.hintText,
      this.errorText,
      this.hintColor,
      this.focusColor});

  @override
  State<StatefulWidget> createState() {
    return DefaultTextFieldState();
  }
}

class DefaultTextFieldState extends State<DefaultTextField>
    with AnimationMixin {
  late Animation<double> errorTransition;
  String? errorMessage;

  @override
  void initState() {
    controller.duration = const Duration(milliseconds: 200);
    errorTransition = Tween<double>(begin: 0.0, end: 200.0).animate(controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.errorText != null) {
      errorMessage = widget.errorText;
      controller.play();
    }

    final textStyle =
        widget.textStyle ?? TextStyle(color: DesignColor.primary.shadeTextSoft);
    final errorStyle = widget.errorStyle ??
        textStyle.copyWith(color: DesignColor.error.shadeTextSoft);
    final borderRadius = widget.borderRadius ?? DesignRadius.r4.all;
    final borderWidth = widget.borderWidth ?? DesignLines.s2;
    final errorColor = errorStyle.color ?? DesignColor.error.shadeTextSoft;
    final fillColor =
        widget.fillColor ?? DesignColor.neutral.shadeTextFieldBackground;
    final hintColor =
        widget.hintColor ?? DesignColor.neutral.shadeTextExtraSoft;
    final focusColor = widget.focusColor ?? DesignColor.primary.shadeTextSoft;
    final animatedColor =
        Color.lerp(focusColor, errorColor, errorTransition.value / 200) ??
            focusColor;

    return Stack(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Opacity(
              opacity: errorTransition.value / 200,
              child: Transform.translate(
                  offset: const Offset(0, DesignSpacing.s64),
                  child: Text(errorMessage ?? "",
                      style: errorStyle.copyWith(
                          color: DesignColor.error.shadeTextSoft))))
        ],
      ),
      TextField(
        style: textStyle,
        textAlign: TextAlign.center,
        cursorColor: animatedColor,
        textInputAction: TextInputAction.none,
        decoration: InputDecoration(
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: animatedColor, width: borderWidth),
            borderRadius: borderRadius,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: borderRadius,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: animatedColor, width: borderWidth),
            borderRadius: borderRadius,
          ),
          focusColor: focusColor,
          fillColor: fillColor,
          hoverColor: fillColor,
          labelStyle: textStyle,
          hintStyle: textStyle.copyWith(color: hintColor),
          hintText: widget.hintText,
        ),
        onSubmitted: widget.onSubmitted,
        onChanged: (value) {
          controller.reverse();
          widget.onChanged?.call(value);
        },
      ),
    ]);
  }
}
