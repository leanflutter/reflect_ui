import 'package:flutter/material.dart';

/// The base style for a widget.
class WidgetBaseStyle {
  const WidgetBaseStyle({
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.side,
  });

  final WidgetStateProperty<Color?>? backgroundColor;
  final WidgetStateProperty<Color?>? foregroundColor;
  final WidgetStateProperty<Color?>? borderColor;
  final WidgetStateProperty<BorderSide?>? side;
}
