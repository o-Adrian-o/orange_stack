import 'package:orange_design_system/design_system/foundation/colors.dart';
import 'package:flutter/material.dart';

import 'default_app_bar.dart';

class DefaultScaffold extends StatefulWidget {
  final Widget? child;
  final Widget? drawer;
  final ScrollController? scrollController;
  final Color background;
  final AppBarConfig? appBarConfig;

  const DefaultScaffold(
      {this.appBarConfig,
      this.scrollController,
      this.child,
      this.drawer,
      this.background = DesignColor.white,
      super.key});

  @override
  State<StatefulWidget> createState() {
    return DefaultScaffoldState();
  }
}

class DefaultScaffoldState extends State<DefaultScaffold> {
  final scaffoldState = GlobalKey<ScaffoldState>();
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = widget.scrollController ?? ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    final body = widget.scrollController == null
        ? SingleChildScrollView(
            controller: scrollController,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [widget.child ?? Container()]))
        : widget.child;

    return Material(
        child: Scaffold(
      backgroundColor: widget.background,
      key: scaffoldState,
      appBar: widget.appBarConfig == null ? null : DefaultAppBar(
          appBarConfig: widget.appBarConfig,
          scaffoldState: scaffoldState,
          scrollController: scrollController),
      drawer: widget.drawer,
      body: body,
    ));
  }
}
