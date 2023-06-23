import 'package:flutter/material.dart';

class ScreenSize {
  static double maxWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double maxHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double arithmeticAverage(BuildContext context) {
    return (MediaQuery.of(context).size.height + MediaQuery.of(context).size.width) / 2;
  }

  static double paddingTop(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  static double appBarHeight() {
    return AppBar().preferredSize.height;
  }
}
