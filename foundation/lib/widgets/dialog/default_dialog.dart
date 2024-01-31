import 'package:flutter/cupertino.dart';
import 'package:orange_design_box/box.dart';
import 'package:orange_design_system/design_system/foundation/colors.dart';
import 'package:orange_design_system/design_system/foundation/dimensions.dart';
import 'package:orange_design_system/design_system/foundation/effects.dart';

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
        color: DesignColor.neutral.shadeBackground,
        padding: DesignSpacing.s48.edgeAll,
        child: child);
  }
}
