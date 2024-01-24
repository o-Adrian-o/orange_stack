import 'package:flutter/material.dart';
import 'package:orange_design_system/design_system/fondation/colors.dart';
import 'package:orange_design_system/design_system/fondation/dimensions.dart';

class DefaultTextField extends StatelessWidget {
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
      this.errorText, this.hintColor, this.focusColor});

  @override
  Widget build(BuildContext context) {
    final textStyle = this.textStyle ?? TextStyle(color: DesignColor.primary.shadeTextSoft);
    final errorStyle = this.errorStyle ?? textStyle.copyWith(color: DesignColor.error.shadeTextSoft);
    final borderRadius = this.borderRadius ?? DesignRadius.r4.all;
    final borderWidth = this.borderWidth ?? DesignLines.s2;
    final isErrorVisible = errorText != null;
    final errorColor = errorStyle.color ?? DesignColor.error.shadeTextSoft;
    final fillColor = this.fillColor ?? DesignColor.neutral.shadeTextFieldBackground;
    final hintColor = this.hintColor ?? DesignColor.neutral.shadeTextExtraSoft;
    final focusColor = this.focusColor ?? DesignColor.primary.shadeTextSoft;

    return Stack(children: [
      TextField(
        style: textStyle,
        textAlign: TextAlign.center,
        cursorColor: focusColor,
        textInputAction: TextInputAction.none,
        decoration: InputDecoration(
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: focusColor, width: borderWidth),
            borderRadius: borderRadius,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: borderRadius,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: errorColor, width: borderWidth),
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
                      style: errorStyle.copyWith(
                          color: DesignColor.error.shadeTextSoft))))
        ],
      )
    ]);
  }
}
