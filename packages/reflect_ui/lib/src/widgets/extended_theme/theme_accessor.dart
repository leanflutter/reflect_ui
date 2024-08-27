import 'package:reflect_ui/src/widgets/extended_theme/extended_theme.dart';

class TailwindLikeThemeAccessor {
  const TailwindLikeThemeAccessor();

  static ExtendedThemeData? _themeData;

  static ExtendedThemeData? get themeData => _themeData;

  static void setThemeData(ExtendedThemeData themeData) {
    _themeData = themeData;
  }

  int get z0 => throw UnimplementedError();
  int get z10 => throw UnimplementedError();
  int get z20 => throw UnimplementedError();

  int get p0 => throw UnimplementedError();
  int get p1 => throw UnimplementedError();
  int get p2 => throw UnimplementedError();
  int get p3 => throw UnimplementedError();
  int get p4 => throw UnimplementedError();

  int get px0 => throw UnimplementedError();
  int get px1 => throw UnimplementedError();
  int get px2 => throw UnimplementedError();
  int get px3 => throw UnimplementedError();
  int get pt4 => throw UnimplementedError();
}

const $ = TailwindLikeThemeAccessor();
