import 'package:flutter/material.dart';
import 'package:orange_design_box/box.dart';
import 'package:orange_design_system/gen/assets.gen.dart';
import 'package:orange_design_system/orange_design_system.dart';

import '../list/item_states.dart';

class DefaultDrawer extends StatelessWidget {
  final Widget title;
  final List<ItemState> items;
  final Widget? copyright;

  const DefaultDrawer(
      {super.key, required this.title, required this.items, this.copyright});

  @override
  Widget build(BuildContext context) {
    var widgets = <Widget>[];
    for (var element in items) {
      if (element is ItemSeparatorState) {
        widgets.add(separator());
      } else if (element is ItemButtonState) {
        widgets.add(drawerItem(element.title, element.icon));
      }
    }

    return Material(
        child: Box(
            width: 250,
            color: DesignColor.white,
            child: Scaffold(
                appBar: AppBar(
                    title:  Box(
                        padding: const EdgeInsets.all(DesignSpacing.s8),
                        child: title)),
                body: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: DesignSpacing.s16),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: widgets),
                          Padding(
                              padding: const EdgeInsets.only(
                                  bottom: DesignSpacing.s16),
                              child: copyright)
                        ])))));
  }

  Widget separator() {
    return Box(
        height: DesignSpacing.s4, color: DesignColor.neutral.shadeBackground);
  }

  Widget drawerItem(Widget? title, SvgGenImage? icon) {
    var widgets = <Widget>[];
    if (icon != null) {
      widgets.add(icon.asIconSmall());
      widgets.add(DesignSpacing.s4.asWidget());
    }
    if (title != null) {
      widgets.add(title);
    }
    return Box(
        padding: const EdgeInsets.all(DesignSpacing.s8),
        onPressed: (context) {},
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: widgets));
  }
}
