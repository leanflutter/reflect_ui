import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:reflect_ui/src/widgets/menu/menu.dart';

class ContextMenuRegion extends StatefulWidget {
  const ContextMenuRegion({
    super.key,
    required this.menu,
    required this.child,
  });

  final Menu menu;
  final Widget child;

  @override
  State<ContextMenuRegion> createState() => _ContextMenuRegionState();
}

class _ContextMenuRegionState extends State<ContextMenuRegion> {
  MenuController get _menuController => widget.menu.controller!;
  bool _menuWasEnabled = false;

  @override
  void initState() {
    super.initState();
    _disableContextMenu();
  }

  @override
  void dispose() {
    _reenableContextMenu();
    super.dispose();
  }

  Future<void> _disableContextMenu() async {
    if (!kIsWeb) {
      // Does nothing on non-web platforms.
      return;
    }
    _menuWasEnabled = BrowserContextMenu.enabled;
    if (_menuWasEnabled) {
      await BrowserContextMenu.disableContextMenu();
    }
  }

  void _reenableContextMenu() {
    if (!kIsWeb) {
      // Does nothing on non-web platforms.
      return;
    }
    if (_menuWasEnabled && !BrowserContextMenu.enabled) {
      BrowserContextMenu.enableContextMenu();
    }
  }

  void _handleSecondaryTapDown(TapDownDetails details) {
    _menuController.open(position: details.localPosition);
  }

  void _handleTapDown(TapDownDetails details) {
    if (_menuController.isOpen) {
      _menuController.close();
      return;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        // Don't open the menu on these platforms with a Ctrl-tap (or a
        // tap).
        break;
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        // Only open the menu on these platforms if the control button is down
        // when the tap occurs.
        if (HardwareKeyboard.instance.logicalKeysPressed
                .contains(LogicalKeyboardKey.controlLeft) ||
            HardwareKeyboard.instance.logicalKeysPressed
                .contains(LogicalKeyboardKey.controlRight)) {
          _menuController.open(position: details.localPosition);
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: GestureDetector(
        onTapDown: _handleTapDown,
        onSecondaryTapDown: _handleSecondaryTapDown,
        child: Stack(
          children: [
            widget.menu,
            widget.child,
          ],
        ),
      ),
    );
  }
}
