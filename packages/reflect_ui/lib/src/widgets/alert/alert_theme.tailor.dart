// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'alert_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$AlertThemeDataTailorMixin
    on ThemeExtension<AlertThemeData>, DiagnosticableTreeMixin {
  @override
  AlertThemeData copyWith() {
    return AlertThemeData();
  }

  @override
  AlertThemeData lerp(
      covariant ThemeExtension<AlertThemeData>? other, double t) {
    if (other is! AlertThemeData) return this as AlertThemeData;
    return AlertThemeData();
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AlertThemeData);
  }

  @override
  int get hashCode {
    return runtimeType.hashCode;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AlertThemeData'));
  }
}

extension AlertThemeDataBuildContextProps on BuildContext {
  AlertThemeData get alertThemeData =>
      Theme.of(this).extension<AlertThemeData>()!;
}
