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
                  MenuItemButton(
                    child: const Text('Reset'),
                    onPressed: () => print('Reset'),
                  ),
                  const Text('AAA'),
                  SubmenuButton(
                    children: <Widget>[
                      MenuItemButton(
                        onPressed: () => print('Cut'),
                        child: const Text('Cut'),
                      ),
                      MenuItemButton(
                        onPressed: () => print('Copy'),
                        child: const Text('Copy'),
                      ),
                      MenuItemButton(
                        onPressed: () => print('Paste'),
                        child: const Text('Paste'),
                      ),
                    ],
                    child: const Text('Background Color'),
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
