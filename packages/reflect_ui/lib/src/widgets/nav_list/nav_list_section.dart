// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart' show TextTheme, Theme, ThemeData;
import 'package:flutter/widgets.dart';
import 'package:reflect_ui/reflect_ui.dart';
import 'package:reflect_ui/src/extensions/color.dart';

// Margin on top of the list section. This was eyeballed from iOS 14.4 Simulator
// and should be always present on top of the edge-to-edge variant.
const double _kMarginTop = 8.0;

// Header margin for inset grouped variant, determined from iOS 14.4 Simulator.
const EdgeInsetsDirectional _kDefaultHeaderMargin =
    EdgeInsetsDirectional.fromSTEB(24.0, 6.0, 24.0, 6.0);

// Footer margin for inset grouped variant, determined from iOS 14.4 Simulator.
const EdgeInsetsDirectional _kDefaultFooterMargin =
    EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 6.0);

// Used for iOS "Inset Grouped" margin, determined from SwiftUI's Forms in
// iOS 14.2 SDK.
const EdgeInsetsDirectional _kDefaultRowsMargin =
    EdgeInsetsDirectional.fromSTEB(12.0, 6.0, 12.0, 6.0);

// Used for iOS "Inset Grouped" margin, determined from SwiftUI's Forms in
// iOS 14.2 SDK.
const EdgeInsetsDirectional _kDefaultRowsMarginWithHeader =
    EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 6.0);

/// An iOS-style list section.
///
/// The [NavListSection] is a container for children widgets. These are
/// most often [ListTile]s.
///
/// The base constructor for [NavListSection] constructs an
/// edge-to-edge style section which includes an iOS-style header, the dividers
/// between rows, and borders on top and bottom of the rows. An example of such
/// list section are sections in iOS Settings app.
///
/// The [NavListSection.insetGrouped] constructor creates a round-edged
/// and padded section that is seen in iOS Notes and Reminders apps. It creates
/// an iOS-style header, and the dividers between rows. Does not create borders
/// on top and bottom of the rows.
///
/// The section [header] lies above the [children] rows, with margins and style
/// that match the iOS style.
///
/// The section [footer] lies below the [children] rows and is used to provide
/// additional information for current list section.
///
/// The [children] is the list of widgets to be displayed in this list section.
/// Typically, the children are of type [ListTile], however these is
/// not enforced.
///
/// The [margin] is used to provide spacing around the content area of the
/// section encapsulating [children].
///
/// The [dividerMargin] and [additionalDividerMargin] specify the starting
/// margin of the divider between list tiles. The [dividerMargin] is always
/// present, but [additionalDividerMargin] is only added to the [dividerMargin]
/// if `hasLeading` is set to true in the constructor, which is the default
/// value.
///
/// {@macro flutter.material.Material.clipBehavior}
///
/// {@tool dartpad}
/// Creates a base [NavListSection] containing [ListTile]s with
/// `leading`, `title`, `additionalInfo` and `trailing` widgets.
///
/// ** See code in examples/api/lib/cupertino/list_section/list_section_base.0.dart **
/// {@end-tool}
///
/// {@tool dartpad}
/// Creates an "Inset Grouped" [NavListSection] containing
/// notched [ListTile]s with `leading`, `title`, `additionalInfo` and
/// `trailing` widgets.
///
/// ** See code in examples/api/lib/cupertino/list_section/list_section_inset.0.dart **
/// {@end-tool}
///
/// See also:
///
///  * [ListTile], an iOS-style list tile, a typical child of
///    [NavListSection].
///  * [CupertinoFormSection], an iOS-style form section.
class NavListSection extends StatelessWidget {
  /// Creates a section that mimics standard iOS forms.
  ///
  /// The base constructor for [NavListSection] constructs an
  /// edge-to-edge style section which includes an iOS-style header, the dividers
  /// between rows, and borders on top and bottom of the rows. An example of such
  /// list section are sections in iOS Settings app.
  ///
  /// The [header] parameter sets the form section header. The section header
  /// lies above the [children] rows, with margins that match the iOS style.
  ///
  /// The [footer] parameter sets the form section footer. The section footer
  /// lies below the [children] rows.
  ///
  /// The [children] parameter is required and sets the list of rows shown in
  /// the section. The [children] parameter takes a list, as opposed to a more
  /// efficient builder function that lazy builds, because forms are intended to
  /// be short in row count. It is recommended that only [CupertinoFormRow] and
  /// [CupertinoTextFormFieldRow] widgets be included in the [children] list in
  /// order to retain the iOS look.
  ///
  /// The [margin] parameter sets the spacing around the content area of the
  /// section encapsulating [children], and defaults to zero padding.
  ///
  /// The [dividerMargin] parameter sets the starting offset of the divider
  /// between rows.
  ///
  /// The [additionalDividerMargin] parameter adds additional margin to existing
  /// [dividerMargin] when [hasLeading] is set to true. By default, it offsets
  /// for the width of leading and space between leading and title of
  /// [ListTile], but it can be overwritten for custom look.
  ///
  /// The [hasLeading] parameter specifies whether children [ListTile]
  /// widgets contain leading or not. Used for calculating correct starting
  /// margin for the divider between rows.
  ///
  /// The [topMargin] is used to specify the margin above the list section. It
  /// matches the iOS look by default.
  ///
  /// {@macro flutter.material.Material.clipBehavior}
  const NavListSection({
    super.key,
    this.children,
    this.header,
    this.footer,
    EdgeInsetsGeometry? margin,
    double? additionalDividerMargin,
    this.topMargin = _kMarginTop,
  })  : assert((children != null && children.length > 0) || header != null),
        margin = margin ??
            (header == null
                ? _kDefaultRowsMargin
                : _kDefaultRowsMarginWithHeader);

  /// Sets the form section header. The section header lies above the [children]
  /// rows. Usually a [Text] widget.
  final Widget? header;

  /// Sets the form section footer. The section footer lies below the [children]
  /// rows. Usually a [Text] widget.
  final Widget? footer;

  /// Margin around the content area of the section encapsulating [children].
  ///
  /// Defaults to zero padding if constructed with standard
  /// [NavListSection] constructor. Defaults to the standard notched-style
  /// iOS margin when constructing with [NavListSection.insetGrouped].
  final EdgeInsetsGeometry margin;

  /// The list of rows in the section. Usually a list of [ListTile]s.
  ///
  /// This takes a list, as opposed to a more efficient builder function that
  /// lazy builds, because such lists are intended to be short in row count.
  /// It is recommended that only [ListTile] widget be included in the
  /// [children] list in order to retain the iOS look.
  final List<Widget>? children;

  /// Margin above the list section. Only used in edge-to-edge variant and it
  /// matches iOS style by default.
  final double? topMargin;

  @override
  Widget build(BuildContext context) {
    ExtendedThemeData extendedThemeData = ExtendedTheme.of(context);
    ThemeData themeData = Theme.of(context);
    TextTheme textTheme = themeData.textTheme;

    Widget? headerWidget, footerWidget;

    if (header != null) {
      headerWidget = DefaultTextStyle(
        style: textTheme.bodySmall!.copyWith(
          color: extendedThemeData.colors.gray.withShade(500),
          fontWeight: FontWeight.w600,
        ),
        child: header!,
      );
    }
    if (footer != null) {
      footerWidget = DefaultTextStyle(
        style: textTheme.bodySmall!.copyWith(
          color: themeData.colorScheme.onSurfaceVariant,
        ),
        child: footer!,
      );
    }

    Widget? decoratedChildrenGroup;
    if (children != null && children!.isNotEmpty) {
      decoratedChildrenGroup = DecoratedBox(
        decoration: const BoxDecoration(),
        child: Column(children: children!),
      );

      decoratedChildrenGroup = Padding(
        padding: margin,
        child: decoratedChildrenGroup,
      );
    }

    return DecoratedBox(
      decoration: const BoxDecoration(),
      child: Column(
        children: <Widget>[
          SizedBox(height: topMargin),
          if (headerWidget != null)
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                padding: _kDefaultHeaderMargin,
                child: headerWidget,
              ),
            ),
          if (decoratedChildrenGroup != null) decoratedChildrenGroup,
          if (footerWidget != null)
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                padding: _kDefaultFooterMargin,
                child: footerWidget,
              ),
            ),
        ],
      ),
    );
  }
}
