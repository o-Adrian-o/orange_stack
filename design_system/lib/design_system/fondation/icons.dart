import 'package:orange_design_system/design_system/fondation/dimensions.dart';
import 'package:orange_design_system/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class DesignIcon {
  static const common = Assets.icons;
}

extension SvgGenImageExtension on SvgGenImage {
  IconButton asIconButton({DesignColor? designColor, @required void Function()? onPressed}) {
    final color = designColor ?? DesignColor.neutral;
    return IconButton(
        highlightColor: color.shadeIconHighlight,
        icon: svg(
            colorFilter:
            ColorFilter.mode(color.shadeIcon, BlendMode.srcIn)),
        onPressed: onPressed);
  }

  Widget asIcon({DesignColor? designColor}) {
    final color = designColor ?? DesignColor.neutral;
    return svg(
        width: DesignSpacing.s24,
        height: DesignSpacing.s24,
        colorFilter:
        ColorFilter.mode(color.shadeIcon, BlendMode.srcIn));
  }

  Widget asIconSmall({DesignColor? designColor}) {
    final color = designColor ?? DesignColor.neutral;
    return svg(
        width: DesignSpacing.s16,
        height: DesignSpacing.s16,
        colorFilter:
        ColorFilter.mode(color.shadeIcon, BlendMode.srcIn));
  }
}
