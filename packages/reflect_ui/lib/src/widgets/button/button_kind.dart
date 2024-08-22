import 'package:reflect_ui/src/painting/widget_kind.dart';

/// An enum to define the kind of a button.
enum ButtonKind with WidgetKind {
  /// A button indicating a primary action.
  primary,

  /// A button indicating a secondary action.
  secondary,

  /// A button indicating a success.
  success,

  /// A button indicating a danger.
  danger,

  /// A button indicating a warning.
  warning,

  /// A button indicating an info.
  info,

  /// A button indicating a light.
  light,

  /// A button indicating a dark.
  dark,
}
