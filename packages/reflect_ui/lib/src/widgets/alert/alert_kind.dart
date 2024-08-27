import 'package:reflect_ui/src/painting/widget_kind.dart';

enum AlertKind with WidgetKind {
  /// A success alert.
  success,

  /// A danger alert.
  danger,

  /// A warning alert.
  warning,

  /// An info alert.
  info,
}
