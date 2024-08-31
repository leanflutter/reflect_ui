// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart' show CupertinoColors;
import 'package:flutter/material.dart' show TextTheme, Theme, ThemeData;
import 'package:flutter/widgets.dart';

// Margin on top of the list section. This was eyeballed from iOS 14.4 Simulator
// and should be always present on top of the edge-to-edge variant.
const double _kMarginTop = 12.0;

// Header margin for inset grouped variant, determined from iOS 14.4 Simulator.
const EdgeInsetsDirectional _kInsetGroupedDefaultHeaderMargin =
    EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 20.0, 6.0);

// Footer margin for inset grouped variant, determined from iOS 14.4 Simulator.
const EdgeInsetsDirectional _kInsetGroupedDefaultFooterMargin =
    EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 10.0);

// Used for iOS "Inset Grouped" margin, determined from SwiftUI's Forms in
// iOS 14.2 SDK.
const EdgeInsetsDirectional _kDefaultRowsMargin =
    EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 10.0);

// Used for iOS "Inset Grouped" margin, determined from SwiftUI's Forms in
// iOS 14.2 SDK.
const EdgeInsetsDirectional _kDefaultRowsMarginWithHeader =
    EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 10.0);

// Used for iOS "Inset Grouped" border radius, estimated from SwiftUI's Forms in
// iOS 14.2 SDK.
const BorderRadius _kDefaultInsetGroupedBorderRadius =
    BorderRadius.all(Radius.circular(10.0));

// The margin of divider used in base list section. Estimated from iOS 14.4 SDK
// Settings app.
const double _kDefaultDividerMargin = 12.0;

// Additional margin of divider used in inset grouped version of list section.
// Estimated from iOS 14.4 SDK Reminders app.
const double _kDefaultAdditionalDividerMargin = 28.0;

// Additional margin of divider used in inset grouped version of list section
// when there is no leading widgets. Estimated from iOS 14.4 SDK Notes app.
const double _kDefaultAdditionalDividerMarginWithoutLeading = 0.0;

/// An iOS-style list section.
///
/// The [ListSection] is a container for children widgets. These are
/// most often [ListTile]s.
///
/// The base constructor for [ListSection] constructs an
/// edge-to-edge style section which includes an iOS-style header, the dividers
/// between rows, and borders on top and bottom of the rows. An example of such
/// list section are sections in iOS Settings app.
///
/// The [ListSection.insetGrouped] constructor creates a round-edged
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
/// The [decoration] of [children] specifies how they should be decorated. If it
/// is not provided in constructor, the background color of [children] defaults
/// to [CupertinoColors.secondarySystemGroupedBackground] and border radius of
/// children group defaults to 10.0 circular radius when constructing with
/// [ListSection.insetGrouped]. Defaults to zero radius for the
/// standard [ListSection] constructor.
///
/// The [dividerMargin] and [additionalDividerMargin] specify the starting
/// margin of the divider between list tiles. The [dividerMargin] is always
/// present, but [additionalDividerMargin] is only added to the [dividerMargin]
/// if `hasLeading` is set to true in the constructor, which is the default
/// value.
///
/// The [backgroundColor] of the section defaults to
/// [CupertinoColors.systemGroupedBackground].
///
/// {@macro flutter.material.Material.clipBehavior}
///
/// {@tool dartpad}
/// Creates a base [ListSection] containing [ListTile]s with
/// `leading`, `title`, `additionalInfo` and `trailing` widgets.
///
/// ** See code in examples/api/lib/cupertino/list_section/list_section_base.0.dart **
/// {@end-tool}
///
/// {@tool dartpad}
/// Creates an "Inset Grouped" [ListSection] containing
/// notched [ListTile]s with `leading`, `title`, `additionalInfo` and
/// `trailing` widgets.
///
/// ** See code in examples/api/lib/cupertino/list_section/list_section_inset.0.dart **
/// {@end-tool}
///
/// See also:
///
///  * [ListTile], an iOS-style list tile, a typical child of
///    [ListSection].
///  * [CupertinoFormSection], an iOS-style form section.
class ListSection extends StatelessWidget {
  /// Creates a section that mimics standard iOS forms.
  ///
  /// The base constructor for [ListSection] constructs an
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
  /// The [decoration] parameter sets the decoration around [children].
  /// If null, defaults to [CupertinoColors.secondarySystemGroupedBackground].
  /// If null, defaults to 10.0 circular radius when constructing with
  /// [ListSection.insetGrouped]. Defaults to zero radius for the
  /// standard [ListSection] constructor.
  ///
  /// The [backgroundColor] parameter sets the background color behind the
  /// section. If null, defaults to [CupertinoColors.systemGroupedBackground].
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
  const ListSection({
    super.key,
    this.children,
    this.header,
    this.footer,
    EdgeInsetsGeometry? margin,
    this.backgroundColor = CupertinoColors.systemGroupedBackground,
    this.decoration,
    this.clipBehavior = Clip.hardEdge,
    this.dividerMargin = _kDefaultDividerMargin,
    double? additionalDividerMargin,
    this.topMargin = _kMarginTop,
    bool hasLeading = true,
    this.separatorColor,
  })  : assert((children != null && children.length > 0) || header != null),
        additionalDividerMargin = additionalDividerMargin ??
            (hasLeading
                ? _kDefaultAdditionalDividerMargin
                : _kDefaultAdditionalDividerMarginWithoutLeading),
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
  /// [ListSection] constructor. Defaults to the standard notched-style
  /// iOS margin when constructing with [ListSection.insetGrouped].
  final EdgeInsetsGeometry margin;

  /// The list of rows in the section. Usually a list of [ListTile]s.
  ///
  /// This takes a list, as opposed to a more efficient builder function that
  /// lazy builds, because such lists are intended to be short in row count.
  /// It is recommended that only [ListTile] widget be included in the
  /// [children] list in order to retain the iOS look.
  final List<Widget>? children;

  /// Sets the decoration around [children].
  ///
  /// If null, background color defaults to
  /// [CupertinoColors.secondarySystemGroupedBackground].
  ///
  /// If null, border radius defaults to 10.0 circular radius when constructing
  /// with [ListSection.insetGrouped]. Defaults to zero radius for the
  /// standard [ListSection] constructor.
  final BoxDecoration? decoration;

  /// Sets the background color behind the section.
  ///
  /// Defaults to [CupertinoColors.systemGroupedBackground].
  final Color backgroundColor;

  /// {@macro flutter.material.Material.clipBehavior}
  ///
  /// Defaults to [Clip.hardEdge].
  final Clip clipBehavior;

  /// The starting offset of a margin between two list tiles.
  final double dividerMargin;

  /// Additional starting inset of the divider used between rows. This is used
  /// when adding a leading icon to children and a divider should start at the
  /// text inset instead of the icon.
  final double additionalDividerMargin;

  /// Margin above the list section. Only used in edge-to-edge variant and it
  /// matches iOS style by default.
  final double? topMargin;

  /// Sets the color for the dividers between rows, and borders on top and
  /// bottom of the rows.
  ///
  /// If null, defaults to [CupertinoColors.separator].
  final Color? separatorColor;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    TextTheme textTheme = themeData.textTheme;

    final Color dividerColor =
        separatorColor ?? themeData.colorScheme.outlineVariant;

    // Short divider is used between rows.
    final Widget shortDivider = Container(
      margin: EdgeInsetsDirectional.only(
        start: dividerMargin + additionalDividerMargin,
      ),
      color: dividerColor,
      height: 1,
    );

    Widget? headerWidget, footerWidget;

    if (header != null) {
      headerWidget = DefaultTextStyle(
        style: textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),
        child: header!,
      );
    }
    if (footer != null) {
      footerWidget = DefaultTextStyle(
        style: textTheme.bodySmall!.copyWith(fontWeight: FontWeight.normal),
        child: footer!,
      );
    }

    Widget? decoratedChildrenGroup;
    if (children != null && children!.isNotEmpty) {
      // We construct childrenWithDividers as follows:
      // Insert a short divider between all rows.
      final List<Widget> childrenWithDividers = <Widget>[];

      children!.sublist(0, children!.length - 1).forEach((Widget widget) {
        childrenWithDividers.add(widget);
        childrenWithDividers.add(shortDivider);
      });

      childrenWithDividers.add(children!.last);

      const BorderRadius childrenGroupBorderRadius =
          _kDefaultInsetGroupedBorderRadius;

      decoratedChildrenGroup = DecoratedBox(
        decoration: decoration ??
            BoxDecoration(
              color: decoration?.color ??
                  themeData.colorScheme.surfaceContainerLow,
              borderRadius: childrenGroupBorderRadius,
            ),
        child: Column(children: childrenWithDividers),
      );

      decoratedChildrenGroup = Padding(
        padding: margin,
        child: clipBehavior == Clip.none
            ? decoratedChildrenGroup
            : ClipRRect(
                borderRadius: childrenGroupBorderRadius,
                clipBehavior: clipBehavior,
                child: decoratedChildrenGroup,
              ),
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
                padding: _kInsetGroupedDefaultHeaderMargin,
                child: headerWidget,
              ),
            ),
          if (decoratedChildrenGroup != null) decoratedChildrenGroup,
          if (footerWidget != null)
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                padding: _kInsetGroupedDefaultFooterMargin,
                child: footerWidget,
              ),
            ),
        ],
      ),
    );
  }
}
