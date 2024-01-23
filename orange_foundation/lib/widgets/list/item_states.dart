import 'package:orange_design_system/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';

class ItemState {}
class ItemSeparatorState extends ItemState {}
class ItemButtonState extends ItemState {
  final Widget? title;
  final Function? onPressed;
  final SvgGenImage? icon;
  ItemButtonState({this.title, this.icon, this.onPressed});
}