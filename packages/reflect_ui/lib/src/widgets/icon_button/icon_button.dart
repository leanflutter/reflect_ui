import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reflect_ui/src/widgets/button/button.dart';

enum IconButtonVariant {
  /// Filled button
  filled,

  /// Outlined button
  outlined,

  /// Subtle button
  subtle,

  /// Transparent button
  transparent,
}

class IconButton extends Button {
  IconButton(
    IconData icon, {
    Function(BuildContext? context, IconData icon)? iconBuilder,
    super.key,
    super.style,
    IconButtonVariant variant = IconButtonVariant.filled,
    super.kind,
    super.padding = const EdgeInsets.all(1),
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
          child: iconBuilder != null
              ? iconBuilder(null, icon)
              : Icon(
                  icon,
                  size: 20,
                ),
          variant: ButtonVariant.values.firstWhere(
            (e) => e.name == variant.name,
          ),
        );
}
