// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show Theme, ThemeData;
import 'package:flutter/widgets.dart';
import 'package:reflect_ui/src/extensions/color.dart';
import 'package:reflect_ui/src/widgets/extended_theme/extended_theme.dart';

export 'radio_list_tile.dart';
export 'switch_list_tile.dart';

// These constants were eyeballed from iOS 14.4 Settings app for base, Notes for
// notched without leading, and Reminders app for notched with leading.
const double _kLeadingSize = 28.0;
const double _kMinHeight = _kLeadingSize + 2 * 8.0;
const double _kMinHeightWithSubtitle = _kLeadingSize + 2 * 10.0;
const EdgeInsetsDirectional _kPadding =
    EdgeInsetsDirectional.only(start: 12.0, end: 12.0);
const EdgeInsetsDirectional _kPaddingWithSubtitle =
    EdgeInsetsDirectional.only(start: 12.0, end: 12.0);
const double _kLeadingToTitle = 12.0;
const double _kNotchedTitleToSubtitle = 3.0;
const double _kAdditionalInfoToTrailing = 6.0;
const double _kNotchedTitleWithSubtitleFontSize = 16.0;
const double _kSubtitleFontSize = 12.0;

/// An iOS-style list tile.
///
/// The [ListTile] is a Cupertino equivalent of Material [ListTile].
/// It comes in two forms, an old-fashioned edge-to-edge variant known from iOS
/// Settings app and in a new, "Inset Grouped" form, known from either iOS Notes
/// or Reminders app. The first is constructed using default constructor, and
/// the latter using named constructor [ListTile.notched].
///
/// The [title], [subtitle], and [additionalInfo] are usually [Text] widgets.
/// They are all limited to one line so it is a responsibility of the caller to
/// take care of text wrapping.
///
/// The size of [leading] is by default constrained to match the iOS size,
/// depending of the type of list tile. This can however be overridden by
/// providing [leadingSize]. The [trailing] widget is not constrained and is
/// therefore a responsibility of the caller to ensure reasonable size of the
/// [trailing] widget.
///
/// The background color of the tile can be set with [backgroundColor] for the
/// state before tile was tapped and with [backgroundColorActivated] for the
/// state after the tile was tapped. By default, both values are set to match
/// the default iOS appearance.
///
/// The [padding] and [leadingToTitle] are by default set to match iOS but can
/// be overwritten if necessary.
///
/// The [onTap] callback provides an option to react to taps anywhere inside the
/// list tile. This can be used to navigate routes and according to iOS
/// behavior it should not be used for example to toggle the [CupertinoSwitch]
/// in the trailing widget.
///
/// See also:
///
///  * [ListSection], an iOS-style list that is a typical container for
///    [ListTile].
///  * [ListTile], a Material Design list tile.
class ListTile extends StatefulWidget {
  /// Creates an edge-to-edge iOS-style list tile like the tiles in iOS Settings
  /// app.
  ///
  /// The [title] parameter is required. It is used to convey the most important
  /// information of list tile. It is typically a [Text].
  ///
  /// The [subtitle] parameter is used to display additional information. It is
  /// placed below the [title].
  ///
  /// The [additionalInfo] parameter is used to display additional information.
  /// It is placed at the end of the tile, before the [trailing] if supplied.
  ///
  /// The [leading] parameter is typically an [Icon] or an [Image] and it comes
  /// at the start of the tile. If omitted in all list tiles, a `hasLeading` of
  /// enclosing [ListSection] should be set to `false` to ensure
  /// correct margin of divider between tiles.
  ///
  /// The [trailing] parameter is typically a [ListTileChevron], an
  /// [Icon], or a [Button]. It is placed at the very end of the tile.
  ///
  /// The [onTap] parameter is used to provide an action that is called when the
  /// tile is tapped. It is mainly used for navigating to a new route. It should
  /// not be used to toggle a trailing [CupertinoSwitch] and similar use cases
  /// because when tile is tapped, it switches the background color and remains
  /// changed. This is according to iOS behavior.
  ///
  /// The [backgroundColor] provides a custom background color for the tile in
  /// a state before tapped. By default, it matches the theme's background color
  /// which is by default a [CupertinoColors.systemBackground].
  ///
  /// The [backgroundColorActivated] provides a custom background color for the
  /// tile after it was tapped. By default, it matches the theme's background
  /// color which is by default a [CupertinoColors.systemGrey4].
  ///
  /// The [padding] parameter sets the padding of the content inside the tile.
  /// It defaults to a value that matches the iOS look, depending on a type of
  /// [ListTile]. For native look, it should not be provided.
  ///
  /// The [leadingSize] constrains the width and height of the leading widget.
  /// By default, it is set to a value that matches the iOS look, depending on a
  /// type of [ListTile]. For native look, it should not be provided.
  ///
  /// The [leadingToTitle] specifies the horizontal space between [leading] and
  /// [title] widgets. By default, it is set to a value that matched the iOS
  /// look, depending on a type of [ListTile]. For native look, it
  /// should not be provided.
  const ListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.additionalInfo,
    this.leading,
    this.trailing,
    this.onTap,
    this.backgroundColor,
    this.backgroundColorActivated,
    this.padding,
    this.leadingSize = _kLeadingSize,
    this.leadingToTitle = _kLeadingToTitle,
  });

  /// A [title] is used to convey the central information. Usually a [Text].
  final Widget title;

  /// A [subtitle] is used to display additional information. It is located
  /// below [title]. Usually a [Text] widget.
  final Widget? subtitle;

  /// Similar to [subtitle], an [additionalInfo] is used to display additional
  /// information. However, instead of being displayed below [title], it is
  /// displayed on the right, before [trailing]. Usually a [Text] widget.
  final Widget? additionalInfo;

  /// A widget displayed at the start of the [ListTile]. This is
  /// typically an `Icon` or an `Image`.
  final Widget? leading;

  /// A widget displayed at the end of the [ListTile]. This is usually
  /// a right chevron icon (e.g. `ListTileChevron`), or an `Icon`.
  final Widget? trailing;

  /// The [onTap] function is called when a user taps on [ListTile]. If
  /// left `null`, the [ListTile] will not react on taps. If this is a
  /// `Future<void> Function()`, then the [ListTile] remains activated
  /// until the returned future is awaited. This is according to iOS behavior.
  /// However, if this function is a `void Function()`, then the tile is active
  /// only for the duration of invocation.
  final FutureOr<void> Function()? onTap;

  /// The [backgroundColor] of the tile in normal state. Once the tile is
  /// tapped, the background color switches to [backgroundColorActivated]. It is
  /// set to match the iOS look by default.
  final Color? backgroundColor;

  /// The [backgroundColorActivated] is the background color of the tile after
  /// the tile was tapped. It is set to match the iOS look by default.
  final Color? backgroundColorActivated;

  /// Padding of the content inside [ListTile].
  final EdgeInsetsGeometry? padding;

  /// The [leadingSize] is used to constrain the width and height of [leading]
  /// widget.
  final double leadingSize;

  /// The horizontal space between [leading] widget and [title].
  final double leadingToTitle;

  @override
  State<ListTile> createState() => _ListTileState();
}

class _ListTileState extends State<ListTile> {
  bool _tapped = false;

  @override
  Widget build(BuildContext context) {
    final ExtendedThemeData extendedTheme = ExtendedTheme.of(context);
    final ThemeData themeData = Theme.of(context);
    final TextStyle textStyle =
        themeData.textTheme.bodyMedium ?? const TextStyle();
    final TextStyle coloredStyle = textStyle.copyWith(
      color: themeData.colorScheme.onSurfaceVariant,
    );

    final Widget title = DefaultTextStyle(
      style: widget.subtitle == null
          ? textStyle
          : textStyle.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: widget.leading == null
                  ? _kNotchedTitleWithSubtitleFontSize
                  : null,
            ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      child: widget.title,
    );

    final EdgeInsetsGeometry padding = widget.padding ??
        (widget.subtitle != null ? _kPaddingWithSubtitle : _kPadding);

    // The color for default state tile is set to either what user provided or
    // null and it will resolve to the correct color provided by context. But if
    // the tile was tapped, it is set to what user provided or if null to the
    // default color that matched the iOS-style.
    Color? backgroundColor = widget.backgroundColor;
    if (_tapped) {
      backgroundColor = widget.backgroundColorActivated ??
          extendedTheme.colors.gray
              .withShade(themeData.brightness == Brightness.dark ? 800 : 200);
    }

    final double minHeight =
        widget.subtitle != null ? _kMinHeightWithSubtitle : _kMinHeight;

    final Widget child = Container(
      constraints: BoxConstraints(
        minWidth: double.infinity,
        minHeight: minHeight,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            if (widget.leading case final Widget leading) ...<Widget>[
              SizedBox.square(
                dimension: widget.leadingSize,
                child: Center(child: leading),
              ),
              SizedBox(width: widget.leadingToTitle),
            ] else
              SizedBox(height: widget.leadingSize),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  title,
                  if (widget.subtitle case final Widget subtitle) ...<Widget>[
                    const SizedBox(height: _kNotchedTitleToSubtitle),
                    DefaultTextStyle(
                      style: coloredStyle.copyWith(
                        fontSize: _kSubtitleFontSize,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      child: subtitle,
                    ),
                  ],
                ],
              ),
            ),
            if (widget.additionalInfo
                case final Widget additionalInfo) ...<Widget>[
              DefaultTextStyle(
                style: coloredStyle,
                maxLines: 1,
                child: additionalInfo,
              ),
              if (widget.trailing != null)
                const SizedBox(width: _kAdditionalInfoToTrailing),
            ],
            if (widget.trailing != null) widget.trailing!,
          ],
        ),
      ),
    );

    if (widget.onTap == null) {
      return child;
    }

    return GestureDetector(
      onTapDown: (_) => setState(() {
        _tapped = true;
      }),
      onTapCancel: () => setState(() {
        _tapped = false;
      }),
      onTap: () async {
        await widget.onTap!();
        if (mounted) {
          setState(() {
            _tapped = false;
          });
        }
      },
      behavior: HitTestBehavior.opaque,
      child: child,
    );
  }
}

/// A typical iOS trailing widget used to denote that a `ListTile` is a
/// button with an action.
///
/// The [ListTileChevron] is meant as a convenience implementation of
/// trailing right chevron.
class ListTileChevron extends StatelessWidget {
  /// Creates a typical widget used to denote that a `ListTile` is a
  /// button with action.
  const ListTileChevron({super.key});

  @override
  Widget build(BuildContext context) {
    final extendedThemeData = ExtendedTheme.of(context);

    return Icon(
      extendedThemeData.icons.chevronRight,
      size: 18.0,
      color: extendedThemeData.colors.gray.withShade(400),
    );
  }
}
