import 'package:flutter/material.dart';
import 'package:reflect_ui/src/painting/widget_base_style.dart';
import 'package:reflect_ui/src/widgets/alert/alert_kind.dart';
import 'package:reflect_ui/src/widgets/alert/alert_style.dart';
import 'package:reflect_ui/src/widgets/alert/alert_variant.dart';
import 'package:reflect_ui/src/widgets/extended_theme/extended_theme.dart';
import 'package:reflect_ui/src/widgets/gapped_column/gapped_column.dart';
import 'package:reflect_ui/src/widgets/gapped_row/gapped_row.dart';

export 'alert_kind.dart';
export 'alert_variant.dart';

class Alert extends StatefulWidget {
  const Alert({
    super.key,
    required this.kind,
    required this.variant,
    this.style,
    this.title,
    this.message,
    this.actions,
  });

  final AlertKind kind;

  final AlertVariant variant;

  final AlertStyle? style;

  /// An optional title of the action sheet. When the [message] is non-null,
  /// the font of the [title] is bold.
  ///
  /// Typically a [Text] widget.
  final Widget? title;

  /// An optional descriptive message that provides more details about the
  /// reason for the alert.
  ///
  /// Typically a [Text] widget.
  final Widget? message;

  /// The set of actions that are displayed for the user to select.
  ///
  /// This must be a list of [CupertinoActionSheetAction] widgets.
  final List<Widget>? actions;

  @override
  State<Alert> createState() => _AlertState();
}

class _AlertState extends State<Alert> {
  @override
  Widget build(BuildContext context) {
    final ExtendedThemeData themeData = ExtendedTheme.of(context);
    final TextTheme textTheme = Theme.of(context).textTheme;
    final WidgetBaseStyle baseStyle = themeData.baseStyleResolver.resolve(
      context,
      widget.kind,
      widget.variant,
    );

    AlertStyle? style = widget.style;

    final Set<WidgetState> states = {};

    final Color? backgroundColor =
        (style?.backgroundColor ?? baseStyle.backgroundColor)?.resolve(states);
    final Color? foregroundColor =
        (style?.foregroundColor ?? baseStyle.foregroundColor)?.resolve(states);
    final Color? borderColor = (baseStyle.borderColor)?.resolve(states);
    final BorderSide? side =
        ((style?.side ?? baseStyle.side)?.resolve(states) ??
            (borderColor != null
                ? BorderSide(width: 1, color: borderColor)
                : null));
    final TextStyle? textStyle =
        (style?.textStyle?.resolve(states) ?? textTheme.bodySmall)?.copyWith(
      color: foregroundColor,
    );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: side != null ? Border.fromBorderSide(side) : null,
      ),
      child: GappedRow(
        gap: 4,
        children: [
          Expanded(
            child: GappedColumn(
              gap: 4,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.title != null)
                  DefaultTextStyle(
                    style: textStyle!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    child: widget.title!,
                  ),
                if (widget.message != null)
                  DefaultTextStyle(
                    style: textStyle!,
                    child: widget.message!,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
