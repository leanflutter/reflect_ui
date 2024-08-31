import 'package:flutter/material.dart';

class ThemeBaseColors {
  ThemeBaseColors({
    this.gray = Colors.grey,
    this.red = Colors.red,
    this.blue = Colors.blue,
    this.green = Colors.green,
    this.yellow = Colors.yellow,
    this.orange = Colors.orange,
    this.cyan = Colors.cyan,
    this.purple = Colors.purple,
    required this.primary,
    required this.secondary,
    required this.success,
    required this.danger,
    required this.warning,
    required this.info,
  });

  // #region Basic colors
  final Color gray;
  final Color red;
  final Color blue;
  final Color green;
  final Color yellow;
  final Color orange;
  final Color cyan;
  final Color purple;
  // #endregion

  // #region Semantic colors
  final Color primary;
  final Color secondary;
  final Color success;
  final Color danger;
  final Color warning;
  final Color info;
  // #endregion
}
