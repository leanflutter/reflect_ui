// ignore_for_file: annotate_overrides

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'
    show MaterialColor, Theme, ThemeExtension;
import 'package:reflect_ui/reflect_ui.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

export 'theme_base_colors.dart';
export 'theme_base_corners.dart';
export 'theme_base_icons.dart';
export 'theme_base_shadows.dart';
export 'theme_base_spacing.dart';

part 'extended_theme.tailor.dart';

@TailorMixin()
class ExtendedThemeData extends ThemeExtension<ExtendedThemeData>
    with DiagnosticableTreeMixin, _$ExtendedThemeDataTailorMixin {
  const ExtendedThemeData({
    required this.colors,
    required this.corners,
    required this.shadows,
    required this.spacing,
    required this.icons,
    required this.baseStyleResolver,
  });

  final ThemeBaseColors colors;
  final ThemeBaseCorners corners;
  final ThemeBaseShadows shadows;
  final ThemeBaseSpacing spacing;
  final ThemeBaseIcons icons;
  final WidgetBaseStyleResolver baseStyleResolver;

  Color get primaryColor {
    if (colors.primary is MaterialColor) {
      return (colors.primary as MaterialColor).shade600;
    }
    return colors.primary;
  }
}

class ExtendedTheme extends InheritedTheme {
  const ExtendedTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final ExtendedThemeData data;

  static ExtendedThemeData of(BuildContext context) {
    final theme = context.dependOnInheritedWidgetOfExactType<ExtendedTheme>();
    return theme?.data ?? Theme.of(context).extension<ExtendedThemeData>()!;
  }

  @override
  bool updateShouldNotify(ExtendedTheme oldWidget) => data != oldWidget.data;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return ExtendedTheme(data: data, child: child);
  }
}
