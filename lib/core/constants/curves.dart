import 'package:flutter/animation.dart';

abstract final class AppCurves {
  static const Curve standard = Curves.easeOutCubic;
  static const Curve enter = Curves.easeOut;
  static const Curve exit = Curves.easeIn;
}
