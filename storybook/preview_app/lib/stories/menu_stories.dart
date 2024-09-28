// ignore_for_file: avoid_print

import 'package:reflect_ui/reflect_ui.dart';
import 'package:storybook_dart/annotations.dart' as storybook;
import 'package:storybook_dart/storybook_dart.dart';

part 'menu_stories.g.dart';

@storybook.Meta(
  title: 'Widgets/Menu',
  argTypes: [
    storybook.ArgType('label'),
  ],
)
class MenuMeta extends Meta with _$MenuMeta {
  final FocusNode _buttonFocusNode = FocusNode(debugLabel: 'Menu Button');

  bool _checked = false;

  @override
  Widget buildWidget(BuildContext context, List<Arg> args) {
    return StatefulBuilder(
      builder: (context, setState) {
        return SizedBox(
          width: 640,
          child: GappedColumn(
            gap: 20,
            mainAxisSize: MainAxisSize.min,
            children: [
              Menu(
                targetFocusNode: _buttonFocusNode,
                children: <Widget>[
                  const SizedBox(width: 200, height: 0),
                  MenuItemButton(
                    child: const Text('45%'),
                    onPressed: () => print('45%'),
                  ),
                  const MenuItemDivider(),
                  MenuItemButton(
                    child: const Text('Zoom in'),
                    onPressed: () => print('Zoom in'),
                  ),
                  MenuItemButton(
                    child: const Text('Zoom out'),
                    onPressed: () => print('Zoom out'),
                  ),
                  MenuItemButton(
                    child: const Text('Zoom to fit'),
                    onPressed: () => print('Zoom to fit'),
                  ),
                  MenuItemButton(
                    child: const Text('Zoom to 50%'),
                    onPressed: () => print('Zoom to 50%'),
                  ),
                  MenuItemButton(
                    child: const Text('Zoom to 100%'),
                    onPressed: () => print('Zoom to 100%'),
                  ),
                  MenuItemButton(
                    child: const Text('Zoom to 200%'),
                    onPressed: () => print('Zoom to 200%'),
                  ),
                  const MenuItemDivider(),
                  SubmenuButton(
                    children: <Widget>[
                      MenuItemButton(
                        onPressed: () => print('Submenu item 1'),
                        child: const Text('Submenu item 1'),
                      ),
                      MenuItemButton(
                        onPressed: () => print('Submenu item 2'),
                        child: const Text('Submenu item 2'),
                      ),
                      MenuItemButton(
                        onPressed: () => print('Submenu item 3'),
                        child: const Text('Submenu item 3'),
                      ),
                    ],
                    child: const Text('Pixel preview'),
                  ),
                  CheckboxMenuButton(
                    value: _checked,
                    onChanged: (value) {
                      _checked = value!;
                      setState(() {});
                    },
                    child: const Text('Pixel grid'),
                  ),
                ],
                targetBuilder: (
                  BuildContext context,
                  MenuController controller,
                  Widget? target,
                ) {
                  return Button(
                    focusNode: _buttonFocusNode,
                    onPressed: () {
                      if (controller.isOpen) {
                        controller.close();
                      } else {
                        controller.open();
                      }
                    },
                    child: const Text('OPEN MENU'),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

@storybook.Story('Default')
class MenuDefaultStory extends StoryObj<MenuMeta> with _$MenuDefaultStory {}
