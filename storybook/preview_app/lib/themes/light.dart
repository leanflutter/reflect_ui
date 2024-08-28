import 'package:reflect_ui/reflect_ui.dart';
import 'package:reflect_colors/reflect_colors.dart';

const String _kDefaultFontFamily = 'Inter';

const TextStyle _kBodyLargeTextStyle = TextStyle(
  fontFamily: _kDefaultFontFamily,
  color: ReflectColors.black,
  fontSize: 16,
  height: 20 / 16,
);

const TextStyle _kBodyMediumTextStyle = TextStyle(
  fontFamily: _kDefaultFontFamily,
  color: ReflectColors.black,
  fontSize: 14,
  height: 18 / 14,
);

const TextStyle _kBodySmallTextStyle = TextStyle(
  fontFamily: _kDefaultFontFamily,
  color: ReflectColors.black,
  fontSize: 12,
  height: 16 / 12,
);

const TextStyle _kLabelLargeTextStyle = TextStyle(
  fontFamily: _kDefaultFontFamily,
  fontWeight: FontWeight.w600,
  color: ReflectColors.black,
  fontSize: 14,
  height: 18 / 14,
);

const TextStyle _kLabelMediumTextStyle = TextStyle(
  fontFamily: _kDefaultFontFamily,
  fontWeight: FontWeight.w600,
  color: ReflectColors.black,
  fontSize: 12,
  height: 16 / 12,
);

const TextStyle _kLabelSmallTextStyle = TextStyle(
  fontFamily: _kDefaultFontFamily,
  fontWeight: FontWeight.w600,
  color: ReflectColors.black,
  fontSize: 10,
  height: 14 / 10,
);

final _lightThemeBase = ThemeData.light();

final lightTheme = _lightThemeBase.copyWith(
  colorScheme: _lightThemeBase.colorScheme.copyWith(
    primary: ReflectColors.blue,
    // onPrimary,
    // primaryContainer,
    // onPrimaryContainer,
    // primaryFixed,
    // primaryFixedDim,
    // onPrimaryFixed,
    // onPrimaryFixedVariant,
    // secondary,
    // onSecondary,
    // secondaryContainer,
    // onSecondaryContainer,
    // secondaryFixed,
    // secondaryFixedDim,
    // onSecondaryFixed,
    // onSecondaryFixedVariant,
    // tertiary,
    // onTertiary,
    // tertiaryContainer,
    // onTertiaryContainer,
    // tertiaryFixed,
    // tertiaryFixedDim,
    // onTertiaryFixed,
    // onTertiaryFixedVariant,
    // error,
    // onError,
    // errorContainer,
    // onErrorContainer,
    // surface,
    // onSurface,
    // surfaceDim,
    // surfaceBright,
    // surfaceContainerLowest,
    surfaceContainerLow: ReflectColors.white,
    // surfaceContainer,
    // surfaceContainerHigh,
    // surfaceContainerHighest,
    // onSurfaceVariant,
    outline: ReflectColors.gray.shade300,
    outlineVariant: ReflectColors.gray.shade300,
    // shadow,
    // scrim,
    // inverseSurface,
    // onInverseSurface,
    // inversePrimary,
    // surfaceTint,
  ),
  scaffoldBackgroundColor: ReflectColors.gray.shade100,
  textTheme: _lightThemeBase.textTheme.copyWith(
    bodyLarge: _kBodyLargeTextStyle,
    bodyMedium: _kBodyMediumTextStyle,
    bodySmall: _kBodySmallTextStyle,
    labelLarge: _kLabelLargeTextStyle,
    labelMedium: _kLabelMediumTextStyle,
    labelSmall: _kLabelSmallTextStyle,
  ),
);
