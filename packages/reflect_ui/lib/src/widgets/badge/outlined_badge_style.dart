import 'package:flutter/material.dart' show Colors, Theme, ThemeData;
import 'package:flutter/widgets.dart';
import 'package:reflect_ui/src/widgets/badge/badge_style.dart';

/// A style for outlined badges.
class OutlinedBadgeStyle extends BadgeStyle {
  OutlinedBadgeStyle(this.context) : super();

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
        return Colors.white;
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

  @override
  WidgetStateProperty<BorderSide?>? get side {
    return WidgetStateProperty.resolveWith<BorderSide?>(
      (Set<WidgetState> states) {
        return BorderSide(
          color: _themeData.colorScheme.primary,
          width: 1,
        );
      },
    );
  }

  @override
  WidgetStateProperty<OutlinedBorder?>? get shape {
    return WidgetStateProperty.resolveWith<OutlinedBorder?>(
      (Set<WidgetState> states) {
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        );
      },
    );
  }
}
