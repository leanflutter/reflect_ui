import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:reflect_ui/src/widgets/list_tile/list_tile.dart';
import 'package:reflect_ui/src/widgets/switch/switch.dart';

class SwitchListTile extends ListTile {
  SwitchListTile({
    super.key,
    required this.value,
    required this.onChanged,
    required super.title,
    super.subtitle,
    super.leading,
    super.trailing,
    FutureOr<void> Function()? onTap,
    super.backgroundColor,
    super.backgroundColorActivated,
    super.padding,
    super.leadingSize,
    super.leadingToTitle,
  }) : super(
          additionalInfo: Switch(
            value: value,
            onChanged: onChanged,
          ),
          onTap: () {
            onTap?.call();
            if (onTap == null && onChanged != null) {
              onChanged.call(!value);
            }
          },
        );

  final bool value;

  final ValueChanged<bool>? onChanged;
}
