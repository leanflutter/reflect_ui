// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart' show CupertinoColors;
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:reflect_ui/src/constants.dart';
import 'package:reflect_ui/src/widgets/button/button_kind.dart';
import 'package:reflect_ui/src/widgets/button/button_style.dart';
import 'package:reflect_ui/src/widgets/button/button_variant.dart';
import 'package:reflect_ui/src/widgets/button/filled_button_style.dart';
import 'package:reflect_ui/src/widgets/button/outlined_button_style.dart';
import 'package:reflect_ui/src/widgets/button/subtle_button_style.dart';
import 'package:reflect_ui/src/widgets/button/tinted_button_style.dart';
import 'package:reflect_ui/src/widgets/button/transparent_button_style.dart';

export 'package:reflect_ui/src/widgets/button/button_variant.dart';

// Measured against iOS 12 in Xcode.
const EdgeInsets _kButtonPadding = EdgeInsets.all(16.0);
const EdgeInsets _kBackgroundButtonPadding = EdgeInsets.symmetric(
  vertical: 5.0,
  horizontal: 7.0,
);

/// An iOS-style button.
///
/// Takes in a text or an icon that fades out and in on touch. May optionally have a
/// background.
///
/// The [padding] defaults to 16.0 pixels. When using a [Button] within
/// a fixed height parent, like a [CupertinoNavigationBar], a smaller, or even
/// [EdgeInsets.zero], should be used to prevent clipping larger [child]
/// widgets.
///
/// Preserves any parent [IconThemeData] but overwrites its [IconThemeData.color]
/// with the [CupertinoThemeData.primaryColor] (or
/// [CupertinoThemeData.primaryContrastingColor] if the button is disabled).
///
/// {@tool dartpad}
/// This sample shows produces an enabled and disabled [Button] and
/// [Button.filled].
///
/// ** See code in examples/api/lib/cupertino/button/cupertino_button.0.dart **
/// {@end-tool}
///
/// See also:
///
///  * <https://developer.apple.com/design/human-interface-guidelines/buttons/>
class Button extends StatefulWidget {
  /// Creates an iOS-style button.
  const Button({
    super.key,
    required this.child,
    this.style,
    this.variant = ButtonVariant.filled,
    this.kind = ButtonKind.primary,
    this.padding,
    this.color,
    this.disabledColor = CupertinoColors.quaternarySystemFill,
    this.minSize = kMinInteractiveDimensionReflect,
    this.pressedOpacity = 0.8,
    this.borderRadius = const BorderRadius.all(Radius.circular(6.0)),
    this.alignment = Alignment.center,
    this.focusColor,
    this.focusNode,
    this.onFocusChange,
    this.autofocus = false,
    required this.onPressed,
  }) : assert(
          pressedOpacity == null ||
              (pressedOpacity >= 0.0 && pressedOpacity <= 1.0),
        );

  /// The widget below this widget in the tree.
  ///
  /// Typically a [Text] widget.
  final Widget child;

  final ButtonStyle? style;

  final ButtonVariant variant;

  final ButtonKind kind;

  /// The amount of space to surround the child inside the bounds of the button.
  ///
  /// Defaults to 16.0 pixels.
  final EdgeInsetsGeometry? padding;

  /// The color of the button's background.
  ///
  /// Defaults to null which produces a button with no background or border.
  ///
  /// Defaults to the [CupertinoTheme]'s `primaryColor` when the
  /// [Button.filled] constructor is used.
  final Color? color;

  /// The color of the button's background when the button is disabled.
  ///
  /// Ignored if the [Button] doesn't also have a [color].
  ///
  /// Defaults to [CupertinoColors.quaternarySystemFill] when [color] is
  /// specified.
  final Color disabledColor;

  /// The callback that is called when the button is tapped or otherwise activated.
  ///
  /// If this is set to null, the button will be disabled.
  final VoidCallback? onPressed;

  /// Minimum size of the button.
  ///
  /// Defaults to kMinInteractiveDimensionCupertino which the iOS Human
  /// Interface Guidelines recommends as the minimum tappable area.
  final double? minSize;

  /// The opacity that the button will fade to when it is pressed.
  /// The button will have an opacity of 1.0 when it is not pressed.
  ///
  /// This defaults to 0.4. If null, opacity will not change on pressed if using
  /// your own custom effects is desired.
  final double? pressedOpacity;

  /// The radius of the button's corners when it has a background color.
  ///
  /// Defaults to round corners of 8 logical pixels.
  final BorderRadius? borderRadius;

  /// The alignment of the button's [child].
  ///
  /// Typically buttons are sized to be just big enough to contain the child and its
  /// [padding]. If the button's size is constrained to a fixed size, for example by
  /// enclosing it with a [SizedBox], this property defines how the child is aligned
  /// within the available space.
  ///
  /// Always defaults to [Alignment.center].
  final AlignmentGeometry alignment;

  /// The color to use for the focus highlight for keyboard interactions.
  ///
  /// Defaults to a slightly transparent [color]. If [color] is null, defaults
  /// to a slightly transparent [CupertinoColors.activeBlue]. Slightly
  /// transparent in this context means the color is used with an opacity of
  /// 0.80, a brightness of 0.69 and a saturation of 0.835.
  final Color? focusColor;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// Handler called when the focus changes.
  ///
  /// Called with true if this widget's node gains focus, and false if it loses
  /// focus.
  final ValueChanged<bool>? onFocusChange;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// Whether the button is enabled or disabled. Buttons are disabled by default. To
  /// enable a button, set its [onPressed] property to a non-null value.
  bool get enabled => onPressed != null;

  @override
  State<Button> createState() => _ButtonState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(FlagProperty('enabled', value: enabled, ifFalse: 'disabled'));
  }
}

class _ButtonState extends State<Button> with SingleTickerProviderStateMixin {
  // Eyeballed values. Feel free to tweak.
  static const Duration kFadeOutDuration = Duration(milliseconds: 120);
  static const Duration kFadeInDuration = Duration(milliseconds: 180);
  final Tween<double> _opacityTween = Tween<double>(begin: 1.0);

  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  late bool _isHovered;
  late bool _isFocused;

  @override
  void initState() {
    super.initState();
    _isHovered = false;
    _isFocused = false;
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      value: 0.0,
      vsync: this,
    );
    _opacityAnimation = _animationController
        .drive(CurveTween(curve: Curves.decelerate))
        .drive(_opacityTween);
    _setTween();
  }

  @override
  void didUpdateWidget(Button old) {
    super.didUpdateWidget(old);
    _setTween();
  }

  void _setTween() {
    _opacityTween.end = widget.pressedOpacity ?? 1.0;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  bool _buttonHeldDown = false;

  void _handleTapDown(TapDownDetails event) {
    if (!_buttonHeldDown) {
      _buttonHeldDown = true;
      _animate();
    }
  }

  void _handleTapUp(TapUpDetails event) {
    if (_buttonHeldDown) {
      _buttonHeldDown = false;
      _animate();
    }
  }

  void _handleTapCancel() {
    if (_buttonHeldDown) {
      _buttonHeldDown = false;
      _animate();
    }
  }

  void _animate() {
    if (_animationController.isAnimating) {
      return;
    }
    final bool wasHeldDown = _buttonHeldDown;
    final TickerFuture ticker = _buttonHeldDown
        ? _animationController.animateTo(
            1.0,
            duration: kFadeOutDuration,
            curve: Curves.easeInOutCubicEmphasized,
          )
        : _animationController.animateTo(
            0.0,
            duration: kFadeInDuration,
            curve: Curves.easeOutCubic,
          );
    ticker.then<void>((void value) {
      if (mounted && wasHeldDown != _buttonHeldDown) {
        _animate();
      }
    });
  }

  void _onShowFocusHighlight(bool showHighlight) {
    setState(() {
      _isFocused = showHighlight;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool enabled = widget.enabled;

    ButtonStyle? style = widget.style;
    if (style == null) {
      switch (widget.variant) {
        case ButtonVariant.filled:
          style = FilledButtonStyle(context);
        case ButtonVariant.tinted:
          style = TintedButtonStyle(context);
        case ButtonVariant.outlined:
          style = OutlinedButtonStyle(context);
        case ButtonVariant.subtle:
          style = SubtleButtonStyle(context);
        case ButtonVariant.transparent:
          style = TransparentButtonStyle(context);
      }
    }

    Set<WidgetState> states = <WidgetState>{
      if (_isHovered) WidgetState.hovered,
      if (_isFocused) WidgetState.focused,
      if (_buttonHeldDown) WidgetState.pressed,
      if (!enabled) WidgetState.disabled,
    };

    final Color? backgroundColor = style.backgroundColor?.resolve(states);
    final Color? foregroundColor = style.foregroundColor?.resolve(states);
    final BorderSide? side = style.side?.resolve(states);
    final TextStyle? textStyle =
        style.textStyle?.resolve(states)?.copyWith(color: foregroundColor);

    final IconThemeData iconTheme =
        IconTheme.of(context).copyWith(color: foregroundColor);

    return MouseRegion(
      cursor: enabled && kIsWeb ? SystemMouseCursors.click : MouseCursor.defer,
      onEnter: (event) {
        _isHovered = true;
        setState(() {});
      },
      onExit: (event) {
        _isHovered = false;
        setState(() {});
      },
      onHover: (event) {
        if (!_isHovered) {
          _isHovered = true;
          setState(() {});
        }
      },
      child: FocusableActionDetector(
        focusNode: widget.focusNode,
        autofocus: widget.autofocus,
        onFocusChange: widget.onFocusChange,
        onShowFocusHighlight: _onShowFocusHighlight,
        enabled: enabled,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTapDown: enabled ? _handleTapDown : null,
          onTapUp: enabled ? _handleTapUp : null,
          onTapCancel: enabled ? _handleTapCancel : null,
          onTap: widget.onPressed,
          child: Semantics(
            button: true,
            child: ConstrainedBox(
              constraints: widget.minSize == null
                  ? const BoxConstraints()
                  : BoxConstraints(
                      minWidth: widget.minSize!,
                      minHeight: widget.minSize!,
                    ),
              child: FadeTransition(
                opacity: _opacityAnimation,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: side != null ? Border.fromBorderSide(side) : null,
                    borderRadius: widget.borderRadius,
                    color: backgroundColor,
                  ),
                  child: Padding(
                    padding: widget.padding ??
                        (backgroundColor != null
                            ? _kBackgroundButtonPadding
                            : _kButtonPadding),
                    child: Align(
                      alignment: widget.alignment,
                      widthFactor: 1.0,
                      heightFactor: 1.0,
                      child: DefaultTextStyle(
                        style: textStyle!,
                        child: IconTheme(
                          data: iconTheme,
                          child: widget.child,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
