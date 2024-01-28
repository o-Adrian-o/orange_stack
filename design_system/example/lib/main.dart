import 'package:orange_design_box/box.dart';
import 'package:orange_design_system/orange_design_system.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    DesignColor.neutral = DesignColor.fromColor(color: const Color(0xff667A8E));
    DesignColor.primary = DesignColor.fromColor(color: const Color(0xff2BA4E0));
    DesignColor.error = DesignColor.fromColor(color: const Color(0xffF54720));
    DesignColor.warning = DesignColor.fromColor(color: const Color(0xffFAD21E));
    DesignColor.success = DesignColor.fromColor(color: const Color(0xff73E167));
    return MaterialApp(
      title: 'Flutter Demo',
      home: page([
        separator(),
        container([
          mainHeader("Canvas Design System"),
        ]),
        separator(),
        container([
          sectionHeader("Colors"),
          colorPalette(DesignColor.neutral, "Neutral"),
          colorPalette(DesignColor.primary, "Primary"),
          colorPalette(DesignColor.error, "Error"),
          colorPalette(DesignColor.warning, "Warning"),
          colorPalette(DesignColor.success, "Success"),
          colorShadeMeasure()
        ].insertBetween(const Box(height: DesignSpacing.s16))),
        separator(),
        container([
          sectionHeader("Dimensions"),
          dimension(0, "Spacing"),
          dimension(DesignSpacing.s4, "s4"),
          dimension(DesignSpacing.s8, "s8"),
          dimension(DesignSpacing.s12, "s12"),
          dimension(DesignSpacing.s16, "s16"),
          dimension(DesignSpacing.s20, "s20"),
          dimension(DesignSpacing.s24, "s24"),
          dimension(DesignSpacing.s32, "s32"),
          dimension(DesignSpacing.s40, "s40"),
          dimension(DesignSpacing.s48, "s48"),
          dimension(DesignSpacing.s64, "s64"),
          dimension(DesignSpacing.s80, "s80"),
          dimension(DesignSpacing.s96, "s96"),
          dimension(DesignSpacing.s128, "s128"),
          dimension(DesignSpacing.s256, "s256"),
          dimension(0, ""),
          dimension(0, "Container (1/10)"),
          dimension(DesignContainer.c640 / 10, "c640"),
          dimension(DesignContainer.c768 / 10, "c768"),
          dimension(DesignContainer.c1024 / 10, "c1024"),
          dimension(DesignContainer.c1280 / 10, "c1280"),
        ].insertBetween(const Box(height: DesignSpacing.s16))),
        endPadding()
      ]),
    );
  }

  Widget mainHeader(String title) {
    return Box(
        color: DesignColor.white,
        padding: const EdgeInsets.all(DesignSpacing.s4),
        child: Text(title, style: DesignFontSize.s36.style));
  }

  Widget sectionHeader(String title) {
    return Box(margin: const EdgeInsets.only(bottom: DesignSpacing.s8), child: Text(title, style: DesignFontSize.s30.style));
  }

  Widget propertyHeader(String title) {
    return Text(title, style: DesignFontSize.s16.bold);
  }

  Widget colorPalette(DesignColor designColor, String name) {
    final children = designColor.shades
        .map((shade) => colorBox(shade))
        .toList()
        .insertBetween(const Box(width: DesignSpacing.s16))
        .insertAtStart(Box(width: DesignSpacing.s128, child: propertyHeader(name)));
    return Row(mainAxisSize: MainAxisSize.min, children: children);
  }

  Widget dimension(double size, String name) {
    return Box(width: 32 * 11 + 16 * 11 + 128, child: Row(
        children: [
      Box(width: DesignSpacing.s128, child: propertyHeader(name)),
      const Box(width: DesignSpacing.s24),
      Box(width: size, height: DesignSpacing.s24, color: DesignColor.primary.shade400)
    ]));
  }

  Widget colorShadeMeasure() {
    final List<Widget> children = [
      shadeText(25),
      shadeText(50),
      shadeText(100),
      shadeText(200),
      shadeText(300),
      shadeText(400),
      shadeText(500),
      shadeText(600),
      shadeText(700),
      shadeText(800),
      shadeText(900)
    ]
        .toList()
        .insertBetween(const Box(width: DesignSpacing.s16))
        .insertAtStart(Box(width: DesignSpacing.s128, child: propertyHeader("")));
    return Row(mainAxisSize: MainAxisSize.min, children: children);
  }

  Widget shadeText(int shade) {
    return Box(
        margin: const EdgeInsets.only(top: DesignSpacing.s12),
        width: 32,
        height: 32,
        child: Text(
          shade.toString(),
          textAlign: TextAlign.center,
          style: DesignFontSize.s12.bold,
        ));
  }

  Widget colorBox(Color color) {
    return Box(
      radius: DesignRadius.r16.all,
      shadow: DesignShadow.s8,
      width: DesignSpacing.s32,
      height: DesignSpacing.s32,
      color: color,
    );
  }

  Widget page(List<Widget> children) {
    return Scaffold(
        body: Box(
            color: DesignColor.white,
            child: SingleChildScrollView(child: Column(
              children: children,
            ))));
  }

  Widget container(List<Widget> children) {
    return Box(
        padding: const EdgeInsets.all(DesignSpacing.s32),
        color: DesignColor.white,
        child: Column(
          children: children,
        ));
  }

  Widget separator() {
    return Box(
      color: DesignColor.neutral.shade50,
      height: DesignSpacing.s48,
      width: double.infinity,
    );
  }

  Widget endPadding() {
    return Box(
        color: DesignColor.neutral.shade50,
        height: DesignSpacing.s128,
        width: double.infinity,
      );
  }
}

extension ListExtension<T> on List<T> {
  List<T> insertBetween(T element) {
    final newList = List<T>.from(this);
    var index = 1;
    for (var i = 0; i < length; i++) {
      newList.insert(index, element);
      index += 2;
    }
    return newList;
  }

  List<T> insertAtStart(T element) {
    insert(0, element);
    return this;
  }

  List<T> insertAtEnd(T element) {
    add(element);
    return this;
  }
}
