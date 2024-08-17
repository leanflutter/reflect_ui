import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reflect_ui/src/widgets/button/button.dart';

enum IconButtonVariant {
  /// Filled button
  filled,

  /// Outlined button
  outlined,
}

class IconButton extends Button {
  IconButton(
    IconData icon, {
    Function(BuildContext? context, IconData icon)? iconBuilder,
    super.key,
    super.style,
    IconButtonVariant variant = IconButtonVariant.filled,
    super.kind,
    super.padding,
    super.color,
    super.disabledColor,
    super.minSize,
    super.pressedOpacity,
    super.borderRadius,
    super.alignment,
    super.focusColor,
    super.focusNode,
    super.onFocusChange,
    super.autofocus = false,
    required super.onPressed,
  }) : super(
          child: iconBuilder != null ? iconBuilder(null, icon) : Icon(icon),
          variant: ButtonVariant.values.firstWhere(
            (e) => e.name == variant.name,
          ),
        );
}
