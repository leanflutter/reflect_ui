import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class BadgeStyle with Diagnosticable {
  BadgeStyle({
    this.textStyle,
    this.backgroundColor,
    this.foregroundColor,
    this.iconColor,
    this.iconSize,
    this.side,
    this.shape,
  });

  /// The style for a badge's [Text] widget descendants.
  ///
  /// The color of the [textStyle] is typically not used directly, the
  /// [foregroundColor] is used instead.
  final WidgetStateProperty<TextStyle?>? textStyle;

  /// The badge's background fill color.
  final WidgetStateProperty<Color?>? backgroundColor;

  /// The color for the badge's [Text] and [Icon] widget descendants.
  ///
  /// This color is typically used instead of the color of the [textStyle]. All
  /// of the components that compute defaults from [BadgeStyle] values
  /// compute a default [foregroundColor] and use that instead of the
  /// [textStyle]'s color.
  final WidgetStateProperty<Color?>? foregroundColor;

  /// The icon's color inside of the badge.
  ///
  /// If this is null, the icon color will be [foregroundColor].
  final WidgetStateProperty<Color?>? iconColor;

  /// The icon's size inside of the badge.
  final WidgetStateProperty<double?>? iconSize;

  /// The color and weight of the badge's outline.
  ///
  /// This value is combined with [shape] to create a shape decorated
  /// with an outline.
  final WidgetStateProperty<BorderSide?>? side;

  /// The shape of the badge's outline.
  ///
  /// This shape is combined with [side] to create a shape decorated
  /// with an outline.
  final WidgetStateProperty<OutlinedBorder?>? shape;
}
