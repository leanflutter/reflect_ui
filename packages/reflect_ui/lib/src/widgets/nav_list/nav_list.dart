import 'package:flutter/material.dart';

export 'nav_list_item.dart';
export 'nav_list_section.dart';

class NavList extends StatelessWidget {
  const NavList({
    super.key,
    required this.children,
    this.padding,
  });

  final EdgeInsetsGeometry? padding;

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: padding,
      child: Column(
        children: children,
      ),
    );
  }
}
