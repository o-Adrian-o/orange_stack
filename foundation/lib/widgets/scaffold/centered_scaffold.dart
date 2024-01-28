import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orange_design_system/design_system/foundation/colors.dart';

import 'default_app_bar.dart';

class CenteredScaffold extends StatelessWidget {
  final AppBarConfig? appBarConfig;
  final Widget child;
  final Color? background;

  const CenteredScaffold(
      {super.key, required this.child, this.appBarConfig, this.background});

  @override
  Widget build(BuildContext context) {
    final appBar = appBarConfig == null
        ? null
        : DefaultAppBar(
            appBarConfig: appBarConfig,
            scaffoldState: null,
            scrollController: null);
    return Scaffold(
        backgroundColor: background ?? DesignColor.neutral.shadeBackground,
        appBar: appBar,
        body: Center(
          child: child,
        ));
  }
}
