import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:reflect_ui/src/widgets/list_tile/list_tile.dart';
import 'package:reflect_ui/src/widgets/radio/radio.dart';

class RadioListTile<T> extends ListTile {
  RadioListTile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    bool useCheckmarkStyle = false,
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
          additionalInfo: Radio<T>(
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
            useCheckmarkStyle: useCheckmarkStyle,
          ),
          onTap: () {
            onTap?.call();
            if (onTap == null && onChanged != null) {
              onChanged.call(value);
            }
          },
        );

  final T value;

  final T? groupValue;

  final ValueChanged<T?>? onChanged;
}
