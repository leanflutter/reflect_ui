import 'package:flutter/material.dart';
import 'package:reflect_ui/src/painting/widget_base_style.dart';
import 'package:reflect_ui/src/painting/widget_kind.dart';
import 'package:reflect_ui/src/painting/widget_variant.dart';
import 'package:reflect_ui/src/widgets/extended_theme/extended_theme.dart';

class WidgetStateConfiguredColor extends WidgetStateProperty<Color> {
  WidgetStateConfiguredColor({
    required this.color,
    this.colorShade,
    this.colorOpacity,
    this.hoveredColor,
    this.hoveredColorShade,
    this.hoveredColorOpacity,
    this.pressedColor,
    this.pressedColorShade,
    this.pressedColorOpacity,
    this.disabledColor,
    this.disabledColorShade,
    this.disabledColorOpacity,
  });

  final Color? color;
  final int? colorShade;
  final double? colorOpacity;

  final Color? hoveredColor;
  final int? hoveredColorShade;
  final double? hoveredColorOpacity;

  final Color? pressedColor;
  final int? pressedColorShade;
  final double? pressedColorOpacity;

  final Color? disabledColor;
  final int? disabledColorShade;
  final double? disabledColorOpacity;

  @override
  Color resolve(Set<WidgetState> states) {
    Color? seedColor;
    int? seedColorShade;
    double? seedColorOpacity;
    if (states.contains(WidgetState.disabled)) {
      seedColor = disabledColor ?? color;
      seedColorShade = disabledColorShade;
      seedColorOpacity = disabledColorOpacity;
    } else if (states.contains(WidgetState.pressed)) {
      seedColor = pressedColor ?? color;
      seedColorShade = pressedColorShade;
      seedColorOpacity = pressedColorOpacity;
    } else if (states.contains(WidgetState.hovered)) {
      seedColor = hoveredColor ?? color;
      seedColorShade = hoveredColorShade;
      seedColorOpacity = hoveredColorOpacity;
    } else {
      seedColor = color;
      seedColorShade = colorShade;
      seedColorOpacity = colorOpacity;
    }
    Color resolvedColor = seedColor ?? Colors.black;
    if (seedColor is MaterialColor && seedColorShade != null) {
      if (seedColorShade != -1) {
        resolvedColor = seedColor[seedColorShade]!;
      } else {
        resolvedColor = Colors.transparent;
      }
    }
    if (seedColorOpacity != null) {
      resolvedColor = resolvedColor.withOpacity(seedColorOpacity);
    }
    return resolvedColor;
  }
}

/// A resolver for the base style of a widget.
class WidgetBaseStyleResolver {
  /// Resolve the base style for a widget.
  WidgetBaseStyle resolve(
    BuildContext context,
    WidgetKind kind,
    WidgetVariant variant, {
    Color? color,
  }) {
    Color primaryColor = color ?? ExtendedTheme.of(context).colors.primary;
    switch (variant.name) {
      case WidgetVariant.filled:
        return WidgetBaseStyle(
          backgroundColor: WidgetStateConfiguredColor(
            color: primaryColor,
            colorShade: 600,
            hoveredColorShade: 700,
            pressedColorShade: 700,
          ),
          foregroundColor: WidgetStateConfiguredColor(
            color: Colors.white,
          ),
        );
      case WidgetVariant.tinted:
        return WidgetBaseStyle(
          backgroundColor: WidgetStateConfiguredColor(
            color: primaryColor,
            colorShade: 50,
            hoveredColorShade: 100,
            pressedColorShade: 100,
          ),
          foregroundColor: WidgetStateConfiguredColor(
            color: primaryColor,
            colorShade: 600,
          ),
        );
      case WidgetVariant.outlined:
        return WidgetBaseStyle(
          backgroundColor: WidgetStateConfiguredColor(
            color: primaryColor,
            colorShade: -1,
            hoveredColorShade: 50,
            pressedColorShade: 50,
          ),
          foregroundColor: WidgetStateConfiguredColor(
            color: primaryColor,
            colorShade: 600,
          ),
          borderColor: WidgetStateConfiguredColor(
            color: primaryColor,
            colorShade: 600,
          ),
        );
      case WidgetVariant.subtle:
        return WidgetBaseStyle(
          backgroundColor: WidgetStateConfiguredColor(
            color: primaryColor,
            colorShade: -1,
            hoveredColorShade: 50,
            pressedColorShade: 50,
          ),
          foregroundColor: WidgetStateConfiguredColor(
            color: primaryColor,
            colorShade: 600,
          ),
        );
      case WidgetVariant.transparent:
        return WidgetBaseStyle(
          backgroundColor: WidgetStateConfiguredColor(
            color: Colors.transparent,
          ),
          foregroundColor: WidgetStateConfiguredColor(
            color: primaryColor,
            colorShade: 600,
          ),
        );
    }
    throw UnimplementedError('Unknown variant: ${variant.name}');
  }
}
