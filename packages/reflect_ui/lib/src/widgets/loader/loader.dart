import 'package:flutter/widgets.dart';
import 'package:reflect_ui/src/widgets/extended_theme/extended_theme.dart';
import 'package:reflect_ui/src/widgets/loader/loaders/oval_loader.dart';

enum LoaderVariant {
  oval,
}

class Loader extends StatelessWidget {
  const Loader({
    super.key,
    this.variant = LoaderVariant.oval,
    this.color,
  });

  final LoaderVariant variant;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    ExtendedThemeData extendedThemeData = ExtendedTheme.of(context);
    Color resolvedColor = color ?? extendedThemeData.primaryColor;
    Size resolvedSize = const Size.square(16);
    return SizedBox(
      width: resolvedSize.width,
      height: resolvedSize.height,
      child: OvalLoader(
        size: resolvedSize.width,
        color: resolvedColor,
      ),
    );
  }
}
