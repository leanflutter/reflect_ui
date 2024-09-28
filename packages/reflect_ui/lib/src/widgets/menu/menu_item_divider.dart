import 'package:flutter/widgets.dart';
import 'package:reflect_ui/src/widgets/divider/divider.dart';

class MenuItemDivider extends StatelessWidget {
  const MenuItemDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Divider(height: 1),
    );
  }
}
