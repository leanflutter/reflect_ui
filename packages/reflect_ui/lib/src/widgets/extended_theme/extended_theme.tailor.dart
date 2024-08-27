// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'extended_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$ExtendedThemeDataTailorMixin
    on ThemeExtension<ExtendedThemeData>, DiagnosticableTreeMixin {
  WidgetBaseStyleResolver get baseStyleResolver;
  ThemeBaseColors get colors;
  ThemeBaseCorners get corners;
  ThemeBaseShadows get shadows;
  ThemeBaseSpacing get spacing;
  Color get primaryColor;

  @override
  ExtendedThemeData copyWith({
    WidgetBaseStyleResolver? baseStyleResolver,
    ThemeBaseColors? colors,
    ThemeBaseCorners? corners,
    ThemeBaseShadows? shadows,
    ThemeBaseSpacing? spacing,
    Color? primaryColor,
  }) {
    return ExtendedThemeData(
      baseStyleResolver: baseStyleResolver ?? this.baseStyleResolver,
      colors: colors ?? this.colors,
      corners: corners ?? this.corners,
      shadows: shadows ?? this.shadows,
      spacing: spacing ?? this.spacing,
    );
  }

  @override
  ExtendedThemeData lerp(
      covariant ThemeExtension<ExtendedThemeData>? other, double t) {
    if (other is! ExtendedThemeData) return this as ExtendedThemeData;
    return ExtendedThemeData(
      baseStyleResolver: t < 0.5 ? baseStyleResolver : other.baseStyleResolver,
      colors: t < 0.5 ? colors : other.colors,
      corners: t < 0.5 ? corners : other.corners,
      shadows: t < 0.5 ? shadows : other.shadows,
      spacing: t < 0.5 ? spacing : other.spacing,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExtendedThemeData &&
            const DeepCollectionEquality()
                .equals(baseStyleResolver, other.baseStyleResolver) &&
            const DeepCollectionEquality().equals(colors, other.colors) &&
            const DeepCollectionEquality().equals(corners, other.corners) &&
            const DeepCollectionEquality().equals(shadows, other.shadows) &&
            const DeepCollectionEquality().equals(spacing, other.spacing) &&
            const DeepCollectionEquality()
                .equals(primaryColor, other.primaryColor));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(baseStyleResolver),
      const DeepCollectionEquality().hash(colors),
      const DeepCollectionEquality().hash(corners),
      const DeepCollectionEquality().hash(shadows),
      const DeepCollectionEquality().hash(spacing),
      const DeepCollectionEquality().hash(primaryColor),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ExtendedThemeData'))
      ..add(DiagnosticsProperty('baseStyleResolver', baseStyleResolver))
      ..add(DiagnosticsProperty('colors', colors))
      ..add(DiagnosticsProperty('corners', corners))
      ..add(DiagnosticsProperty('shadows', shadows))
      ..add(DiagnosticsProperty('spacing', spacing))
      ..add(DiagnosticsProperty('primaryColor', primaryColor));
  }
}

extension ExtendedThemeDataBuildContextProps on BuildContext {
  ExtendedThemeData get extendedThemeData =>
      Theme.of(this).extension<ExtendedThemeData>()!;
  WidgetBaseStyleResolver get baseStyleResolver =>
      extendedThemeData.baseStyleResolver;
  ThemeBaseColors get colors => extendedThemeData.colors;
  ThemeBaseCorners get corners => extendedThemeData.corners;
  ThemeBaseShadows get shadows => extendedThemeData.shadows;
  ThemeBaseSpacing get spacing => extendedThemeData.spacing;
  Color get primaryColor => extendedThemeData.primaryColor;
}
