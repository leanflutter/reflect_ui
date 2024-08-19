import 'package:flutter/material.dart' show MaterialColor, Theme, ThemeData;
import 'package:flutter/widgets.dart';
import 'package:reflect_ui/src/widgets/button/button_style.dart';

/// A style for filled buttons.
class TintedButtonStyle extends ButtonStyle {
  TintedButtonStyle(this.context);

  final BuildContext context;
  late final ThemeData _themeData = Theme.of(context);

  @override
  WidgetStateProperty<TextStyle?>? get textStyle {
    return WidgetStateProperty.resolveWith<TextStyle?>(
      (Set<WidgetState> states) {
        return _themeData.textTheme.labelMedium;
      },
    );
  }

  @override
  WidgetStateProperty<Color?>? get backgroundColor {
    Color color = _themeData.colorScheme.primary;
    return WidgetStateProperty.resolveWith<Color?>(
      (Set<WidgetState> states) {
        if (color is MaterialColor) {
          if (states.contains(WidgetState.hovered)) {
            return color.shade100;
          }
          if (states.contains(WidgetState.pressed)) {
            return color.shade200;
          }
          return color.shade50;
        }
        return color;
      },
    );
  }

  @override
  WidgetStateProperty<Color?>? get foregroundColor {
    return WidgetStateProperty.resolveWith<Color?>(
      (Set<WidgetState> states) {
        return _themeData.colorScheme.primary;
      },
    );
  }
}
