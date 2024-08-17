import 'package:flutter/material.dart' show Theme, ThemeData;
import 'package:flutter/widgets.dart';
import 'package:reflect_ui/src/widgets/badge/badge_style.dart';

/// A style for filled badges.
class FilledBadgeStyle extends BadgeStyle {
  FilledBadgeStyle(this.context) : super();

  final BuildContext context;
  late final ThemeData _themeData = Theme.of(context);

  @override
  WidgetStateProperty<TextStyle?>? get textStyle {
    return WidgetStateProperty.resolveWith<TextStyle?>(
      (Set<WidgetState> states) {
        return _themeData.textTheme.labelSmall?.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 10,
          height: 12 / 10,
        );
      },
    );
  }

  @override
  WidgetStateProperty<Color?>? get backgroundColor {
    return WidgetStateProperty.resolveWith<Color?>(
      (Set<WidgetState> states) {
        return _themeData.colorScheme.primary;
      },
    );
  }

  @override
  WidgetStateProperty<Color?>? get foregroundColor {
    return WidgetStateProperty.resolveWith<Color?>(
      (Set<WidgetState> states) {
        return _themeData.colorScheme.onPrimary;
      },
    );
  }
}
