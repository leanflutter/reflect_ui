import 'package:flutter/material.dart'
    show ColorScheme, Colors, MaterialColor, Theme, ThemeData;
import 'package:flutter/widgets.dart';
import 'package:reflect_ui/src/widgets/button/button_style.dart';

class SubtleButtonStyle extends ButtonStyle {
  SubtleButtonStyle(this.context) : super();

  final BuildContext context;
  late final ThemeData _themeData = Theme.of(context);

  ColorScheme get _colorScheme => _themeData.colorScheme;

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
    Color color = _colorScheme.primary;
    return WidgetStateProperty.resolveWith<Color?>(
      (Set<WidgetState> states) {
        if (color is MaterialColor) {
          if (states.contains(WidgetState.hovered)) {
            return color.shade50;
          }
        }
        return Colors.transparent;
      },
    );
  }

  @override
  WidgetStateProperty<Color?>? get foregroundColor {
    Color color = _colorScheme.primary;
    return WidgetStateProperty.resolveWith<Color?>(
      (Set<WidgetState> states) {
        if (color is MaterialColor) return color.shade600;
        return _themeData.colorScheme.primary;
      },
    );
  }
}
