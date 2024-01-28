import 'package:flutter/cupertino.dart';
import 'package:orange_design_box/box.dart';
import 'package:orange_design_system/design_system/fondation/colors.dart';
import 'package:orange_design_system/design_system/fondation/dimensions.dart';
import 'package:orange_design_system/design_system/fondation/effects.dart';

class DefaultDialog extends StatelessWidget {
  final Widget child;
  final double? width;

  const DefaultDialog({super.key, required this.child, this.width});

  @override
  Widget build(BuildContext context) {
    return Box(
        radius: DesignRadius.r16.all,
        shadow: DesignShadow.s8,
        width: width,
        margin: DesignSpacing.s128.edgeBottom,
        color: DesignColor.neutral.shadeBackground,
        padding: DesignSpacing.s48.edgeAll,
        child: child);
  }
}
