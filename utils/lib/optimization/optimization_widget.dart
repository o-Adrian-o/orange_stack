import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

class OptimizationWidget extends StatefulWidget {
  const OptimizationWidget({super.key, required this.child});

  final Widget child;

  @override
  createState() => OptimizationWidgetState();
}

class OptimizationWidgetState extends State<OptimizationWidget> {
  final ScreenshotController screenshotController = ScreenshotController();
  Uint8List? screenshotData;

  @override
  void initState() {
    super.initState();
    screenshotController.captureFromWidget(widget.child, targetSize: const Size(400, 600)).then((value) => {
          setState(() {
            screenshotData = value;
          }),
        });
  }

  @override
  Widget build(BuildContext context) {
    if (screenshotData != null) {
      return Image.memory(screenshotData!);
    } else {
      return const CircularProgressIndicator();
    }
  }
}
