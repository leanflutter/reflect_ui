import 'package:flutter/material.dart' show Colors, Theme, ThemeData;
import 'package:flutter/widgets.dart';
import 'package:reflect_ui/src/widgets/button/button_style.dart';

class TransparentButtonStyle extends ButtonStyle {
  TransparentButtonStyle(this.context) : super();

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
    return WidgetStateProperty.resolveWith<Color?>(
      (Set<WidgetState> states) {
        return Colors.transparent;
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
