import 'package:flutter/material.dart';

extension ColorWithShade on Color {
  Color withShade(int shade) {
    if (this is MaterialColor) {
      return (this as MaterialColor)[shade] ?? this;
    } else {
      debugPrint('Color $this is not a MaterialColor');
    }
    return this;
  }
}
