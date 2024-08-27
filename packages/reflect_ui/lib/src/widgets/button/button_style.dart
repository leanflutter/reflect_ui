import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:reflect_ui/src/painting/widget_base_style_resolver.dart';
import 'package:reflect_ui/src/widgets/button/button_kind.dart';
import 'package:reflect_ui/src/widgets/button/button_variant.dart';

class ButtonStyle with Diagnosticable {
  ButtonStyle({
    this.textStyle,
    this.backgroundColor,
    this.foregroundColor,
    this.iconColor,
    this.iconSize,
    this.side,
    this.shape,
  });

  factory ButtonStyle.resolveWith(
    WidgetBaseStyleResolver resolver,
    ButtonKind kind,
    ButtonVariant variant, {
    Color? color,
    required BuildContext context,
  }) {
    final baseStyle = resolver.resolve(
      context,
      kind,
      variant,
      color: color,
    );
    return ButtonStyle(
      // textStyle: resolver.resolve(kind, variant, color: color).textStyle,
      backgroundColor: baseStyle.backgroundColor,
      foregroundColor: baseStyle.foregroundColor,
      iconColor: baseStyle.foregroundColor,
      // iconSize: resolver.resolve(kind, variant, color: color).iconSize,
      side: baseStyle.side,
      // shape: resolver.resolve(kind, variant, color: color).shape,
    );
  }

  /// The style for a button's [Text] widget descendants.
  ///
  /// The color of the [textStyle] is typically not used directly, the
  /// [foregroundColor] is used instead.
  final WidgetStateProperty<TextStyle?>? textStyle;

  /// The button's background fill color.
  final WidgetStateProperty<Color?>? backgroundColor;

  /// The color for the button's [Text] and [Icon] widget descendants.
  ///
  /// This color is typically used instead of the color of the [textStyle]. All
  /// of the components that compute defaults from [ButtonStyle] values
  /// compute a default [foregroundColor] and use that instead of the
  /// [textStyle]'s color.
  final WidgetStateProperty<Color?>? foregroundColor;

  /// The icon's color inside of the button.
  ///
  /// If this is null, the icon color will be [foregroundColor].
  final WidgetStateProperty<Color?>? iconColor;

  /// The icon's size inside of the button.
  final WidgetStateProperty<double?>? iconSize;

  /// The color and weight of the button's outline.
  ///
  /// This value is combined with [shape] to create a shape decorated
  /// with an outline.
  final WidgetStateProperty<BorderSide?>? side;

  /// The shape of the button's outline.
  ///
  /// This shape is combined with [side] to create a shape decorated
  /// with an outline.
  final WidgetStateProperty<OutlinedBorder?>? shape;
}
