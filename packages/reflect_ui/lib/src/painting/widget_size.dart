import 'package:flutter/widgets.dart';

class WidgetSize extends Size {
  const WidgetSize(this.name) : super(0.0, 0.0);

  final String name;

  @override
  int get hashCode => Object.hash(width, height, name);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is WidgetSize && other.name == name;
  }

  /// The size of the widget is small.
  static const WidgetSize small = WidgetSize('small');

  /// The size of the widget is medium.
  static const WidgetSize medium = WidgetSize('medium');

  /// The size of the widget is large.
  static const WidgetSize large = WidgetSize('large');
}
