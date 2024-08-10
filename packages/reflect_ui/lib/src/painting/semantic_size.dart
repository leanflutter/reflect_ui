import 'package:flutter/widgets.dart';

class SemanticSize extends Size {
  const SemanticSize(this.name) : super(0.0, 0.0);

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
    return other is SemanticSize && other.name == name;
  }

  /// The size of the widget is small.
  static const SemanticSize small = SemanticSize('small');

  /// The size of the widget is medium.
  static const SemanticSize medium = SemanticSize('medium');

  /// The size of the widget is large.
  static const SemanticSize large = SemanticSize('large');
}
