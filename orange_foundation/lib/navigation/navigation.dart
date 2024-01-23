
import 'package:flutter/material.dart';

extension NavigatorExtension on Navigator {
  static void pushNamedAndClear(BuildContext context, String route) {
    Navigator.pushNamedAndRemoveUntil(context, route, (param) { return false; });
  }
}