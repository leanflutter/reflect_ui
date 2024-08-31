// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'extended_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$ExtendedThemeDataTailorMixin
    on ThemeExtension<ExtendedThemeData>, DiagnosticableTreeMixin {
  ThemeBaseColors get colors;
  ThemeBaseCorners get corners;
  ThemeBaseShadows get shadows;
  ThemeBaseSpacing get spacing;
  ThemeBaseIcons get icons;
  WidgetBaseStyleResolver get baseStyleResolver;
  Color get primaryColor;

  @override
  ExtendedThemeData copyWith({
    ThemeBaseColors? colors,
    ThemeBaseCorners? corners,
    ThemeBaseShadows? shadows,
    ThemeBaseSpacing? spacing,
    ThemeBaseIcons? icons,
    WidgetBaseStyleResolver? baseStyleResolver,
    Color? primaryColor,
  }) {
    return ExtendedThemeData(
      colors: colors ?? this.colors,
      corners: corners ?? this.corners,
      shadows: shadows ?? this.shadows,
      spacing: spacing ?? this.spacing,
      icons: icons ?? this.icons,
      baseStyleResolver: baseStyleResolver ?? this.baseStyleResolver,
    );
  }

  @override
  ExtendedThemeData lerp(
      covariant ThemeExtension<ExtendedThemeData>? other, double t) {
    if (other is! ExtendedThemeData) return this as ExtendedThemeData;
    return ExtendedThemeData(
      colors: t < 0.5 ? colors : other.colors,
      corners: t < 0.5 ? corners : other.corners,
      shadows: t < 0.5 ? shadows : other.shadows,
      spacing: t < 0.5 ? spacing : other.spacing,
      icons: t < 0.5 ? icons : other.icons,
      baseStyleResolver: t < 0.5 ? baseStyleResolver : other.baseStyleResolver,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExtendedThemeData &&
            const DeepCollectionEquality().equals(colors, other.colors) &&
            const DeepCollectionEquality().equals(corners, other.corners) &&
            const DeepCollectionEquality().equals(shadows, other.shadows) &&
            const DeepCollectionEquality().equals(spacing, other.spacing) &&
            const DeepCollectionEquality().equals(icons, other.icons) &&
            const DeepCollectionEquality()
                .equals(baseStyleResolver, other.baseStyleResolver) &&
            const DeepCollectionEquality()
                .equals(primaryColor, other.primaryColor));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(colors),
      const DeepCollectionEquality().hash(corners),
      const DeepCollectionEquality().hash(shadows),
      const DeepCollectionEquality().hash(spacing),
      const DeepCollectionEquality().hash(icons),
      const DeepCollectionEquality().hash(baseStyleResolver),
      const DeepCollectionEquality().hash(primaryColor),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ExtendedThemeData'))
      ..add(DiagnosticsProperty('colors', colors))
      ..add(DiagnosticsProperty('corners', corners))
      ..add(DiagnosticsProperty('shadows', shadows))
      ..add(DiagnosticsProperty('spacing', spacing))
      ..add(DiagnosticsProperty('icons', icons))
      ..add(DiagnosticsProperty('baseStyleResolver', baseStyleResolver))
      ..add(DiagnosticsProperty('primaryColor', primaryColor));
  }
}

extension ExtendedThemeDataBuildContextProps on BuildContext {
  ExtendedThemeData get extendedThemeData =>
      Theme.of(this).extension<ExtendedThemeData>()!;
  ThemeBaseColors get colors => extendedThemeData.colors;
  ThemeBaseCorners get corners => extendedThemeData.corners;
  ThemeBaseShadows get shadows => extendedThemeData.shadows;
  ThemeBaseSpacing get spacing => extendedThemeData.spacing;
  ThemeBaseIcons get icons => extendedThemeData.icons;
  WidgetBaseStyleResolver get baseStyleResolver =>
      extendedThemeData.baseStyleResolver;
  Color get primaryColor => extendedThemeData.primaryColor;
}
