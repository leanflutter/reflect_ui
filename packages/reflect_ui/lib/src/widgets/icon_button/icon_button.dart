import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reflect_ui/src/painting/widget_variant.dart';
import 'package:reflect_ui/src/widgets/button/button.dart';

enum IconButtonVariant with WidgetVariant {
  filled,
  tinted,
  outlined,
  subtle,
  transparent,
}

class IconButton extends Button {
  IconButton(
    IconData icon, {
    super.key,
    Function(BuildContext? context, IconData icon)? iconBuilder,
    Color? iconColor,
    double? iconSize,
    super.style,
    IconButtonVariant variant = IconButtonVariant.filled,
    super.kind,
    super.padding = const EdgeInsets.all(2),
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
                  size: iconSize ?? 22,
                  color: iconColor,
                ),
          variant: ButtonVariant.values.firstWhere(
            (e) => e.name == variant.name,
          ),
        );
}
