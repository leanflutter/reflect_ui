import 'package:flutter/widgets.dart';

/// A column that divides its children with a divider.
class DividedRow extends Flex {
  DividedRow({
    super.key,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline,
    required Widget divider,
    List<Widget> children = const <Widget>[],
  }) : super(
          direction: Axis.horizontal,
          children: children.expand((widget) => [widget, divider]).toList()
            ..removeLast(),
        );
}
