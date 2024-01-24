import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orange_design_system/design_system/fondation/colors.dart';
import 'package:orange_design_system/design_system/fondation/dimensions.dart';

class DefaultTextField extends StatelessWidget {
  final Color? focusColor;
  final Color? errorColor;
  final Color? fillColor;
  final Color? hintColor;
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
      this.focusColor,
      this.errorColor,
      this.fillColor,
      this.textStyle,
      this.errorStyle,
        this.borderRadius, required this.borderWidth, this.hintColor, this.onChanged, this.onSubmitted, this.hintText, this.errorText});

  @override
  Widget build(BuildContext context) {
    final focusColor = this.focusColor ?? DesignColor.primary.shadeTextSoft;
    final errorColor = this.errorColor ?? DesignColor.error.shadeTextSoft;
    final fillColor = this.fillColor ?? DesignColor.neutral.shade100;
    final textStyle = this.textStyle ?? const TextStyle();
    final errorStyle = this.errorStyle ?? const TextStyle();
    final borderRadius = this.borderRadius ?? DesignRadius.r4.all;
    final borderWidth = this.borderWidth ?? DesignLines.s2;
    final isErrorVisible = errorText != null;

    return Stack(children: [
      TextField(
        style: textStyle,
        textAlign: TextAlign.center,
        cursorColor: focusColor,
        textInputAction: TextInputAction.none,
        decoration: InputDecoration(
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: focusColor, width: borderWidth),
            borderRadius: borderRadius,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: borderRadius,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: errorColor, width: borderWidth),
            borderRadius: borderRadius,
          ),
          focusColor: focusColor,
          fillColor: fillColor,
          hoverColor: fillColor,
          labelStyle: textStyle,
          hintStyle: textStyle.copyWith(color: hintColor),
          hintText: hintText,
        ),
        onSubmitted: onSubmitted,
        onChanged: onChanged,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedOpacity(
              opacity: isErrorVisible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 100),
              child: Transform.translate(
                  offset: const Offset(0, DesignSpacing.s64),
                  child: Text(errorText ?? "",
                      style: errorStyle.copyWith(color: DesignColor.error.shadeTextSoft))))
        ],
      )
    ]);
  }
}
