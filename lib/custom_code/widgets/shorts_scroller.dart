// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:tiktoklikescroller/tiktoklikescroller.dart'; // Import the TikTok-style scroller

class ShortsScroller extends StatefulWidget {
  const ShortsScroller({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _ShortsScrollerState createState() => _ShortsScrollerState();
}

class _ShortsScrollerState extends State<ShortsScroller> {
  final List<Color> colors = <Color>[Colors.red, Colors.blue, Colors.green];
  final Controller controller = Controller()
    ..addListener((event) {
      _handleCallbackEvent(event.direction, event.success,
          currentIndex: event.currentIndex);
    });

  @override
  Widget build(BuildContext context) {
    return TikTokStyleFullPageScroller(
      contentSize: colors.length,
      swipePositionThreshold: 0.2,
      swipeVelocityThreshold: 2000,
      animationDuration: const Duration(milliseconds: 400),
      controller: controller,
      snap: true, // Enable snapping behavior
      builder: (BuildContext context, int index) {
        return Container(
          color: colors[index],
          child: Text(
            '$index',
            style: const TextStyle(fontSize: 48, color: Colors.white),
          ),
        );
      },
    );
  }

  void _handleCallbackEvent(ScrollDirection direction, ScrollSuccess success,
      {int? currentIndex}) {
    print(
        "Scroll callback received with data: {direction: $direction, success: $success and index: ${currentIndex ?? 'not given'}}");
  }
}
