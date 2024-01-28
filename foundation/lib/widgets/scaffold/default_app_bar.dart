import 'package:orange_design_box/box.dart';
import 'package:orange_design_system/design_system/foundation/colors.dart';
import 'package:orange_design_system/design_system/foundation/effects.dart';
import 'package:orange_design_system/design_system/foundation/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_animations/simple_animations.dart';

const defaultAppBarHeight = 56.0;

class AppBarController {
  void Function()? hideShadow;
}

class AppBarConfig {
  final Widget? leading;
  final List<Widget>? actions;
  final Widget? title;
  final AppBarController? controller;

  const AppBarConfig({this.leading, this.title, this.actions, this.controller});
}

class DefaultAppBar extends StatefulWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState>? scaffoldState;
  final ScrollController? scrollController;
  final AppBarConfig? appBarConfig;

  const DefaultAppBar(
      {this.appBarConfig,
      this.scaffoldState,
      this.scrollController,
      super.key});

  @override
  State<StatefulWidget> createState() => DefaultAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(defaultAppBarHeight);

  ScaffoldState? getScaffoldState() => scaffoldState?.currentState;

  bool hasDrawer() => getScaffoldState()?.hasDrawer ?? false;

  void openDrawer() => getScaffoldState()?.openDrawer();
}

class DefaultAppBarState extends State<DefaultAppBar> with AnimationMixin {
  late Animation<double> shadowOpacity;

  @override
  void initState() {
    super.initState();

    shadowOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
    controller.duration = const Duration(milliseconds: 200);

    widget.appBarConfig?.controller?.hideShadow = () {
      controller.reverse();
    };

    widget.scrollController?.addListener(() {
      updateShadow();
    });
  }

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    final bool useCloseButton =
        parentRoute is PageRoute<dynamic> && parentRoute.fullscreenDialog;

    var leading = widget.appBarConfig?.leading;
    if (leading == null) {
      if (widget.hasDrawer()) {
        leading = DesignIcon.common.menu.asIconButton(onPressed: () {
          widget.openDrawer();
        });
      } else if (parentRoute?.impliesAppBarDismissal ?? false) {
        final button =
            useCloseButton ? DesignIcon.common.x : DesignIcon.common.arrowLeft;
        leading = button.asIconButton(onPressed: () {
          Navigator.maybePop(context);
        });
      }
    }

    return Stack(
      children: [
        Opacity(
            opacity: shadowOpacity.value,
            child: Box(
              height: defaultAppBarHeight + statusBarHeight,
              shadow: DesignShadow.s3,
            )),
        Box(
          height: defaultAppBarHeight + statusBarHeight,
          color: DesignColor.white,
        ),
        AppBar(
            elevation: 1,
            surfaceTintColor: DesignColor.transparent,
            backgroundColor: DesignColor.transparent,
            actions: widget.appBarConfig?.actions,
            leading: leading,
            centerTitle: true,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: DesignColor.transparent,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.light,
            ),
            title: widget.appBarConfig?.title),
      ],
    );
  }

  void updateShadow() {
    final offset = widget.scrollController?.offset ?? 0;
    if (offset > 0 && controller.value != 1) {
      controller.forward(from: controller.value);
    } else if (offset == 0 && controller.value != 0) {
      controller.reverse(from: controller.value);
    }
  }
}
