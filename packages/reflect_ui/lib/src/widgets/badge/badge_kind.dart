import 'package:reflect_ui/src/painting/widget_kind.dart';

/// An enum to define the kind of a badge.
enum BadgeKind with WidgetKind {
  /// A badge indicating a primary action.
  primary,

  /// A badge indicating a secondary action.
  secondary,

  /// A badge indicating a success.
  success,

  /// A badge indicating a danger.
  danger,

  /// A badge indicating a warning.
  warning,

  /// A badge indicating an info.
  info,
}
