import 'package:flutter/widgets.dart';

class ThemeBaseCorners {
  const ThemeBaseCorners({
    this.none = BorderRadius.zero,
    this.tiny = const BorderRadius.all(Radius.circular(2)),
    this.small = const BorderRadius.all(Radius.circular(4)),
    this.medium = const BorderRadius.all(Radius.circular(6)),
    this.large = const BorderRadius.all(Radius.circular(8)),
    this.full = const BorderRadius.all(Radius.circular(9999)),
  });

  final BorderRadius none;
  final BorderRadius tiny;
  final BorderRadius small;
  final BorderRadius medium;
  final BorderRadius large;
  final BorderRadius full;
}
