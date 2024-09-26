// ignore_for_file: avoid_print

import 'package:reflect_ui/reflect_ui.dart';
import 'package:storybook_dart/annotations.dart' as storybook;
import 'package:storybook_dart/storybook_dart.dart';

part 'context_menu_region_stories.g.dart';

@storybook.Meta(
  title: 'Widgets/ContextMenuRegion',
  argTypes: [
    storybook.ArgType('label'),
  ],
)
class ContextMenuRegionMeta extends Meta with _$ContextMenuRegionMeta {
  final FocusNode _buttonFocusNode = FocusNode(debugLabel: 'Menu Button');
  final MenuController _menuController = MenuController();

  @override
  Widget buildWidget(BuildContext context, List<Arg> args) {
    return StatefulBuilder(
      builder: (context, setState) {
        return SizedBox(
          width: 640,
          child: ContextMenuRegion(
            menu: Menu(
              controller: _menuController,
              targetFocusNode: _buttonFocusNode,
              children: <Widget>[
                MenuItemButton(
                  child: const Text('Reset'),
                  onPressed: () => print('Reset'),
                ),
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
            ),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.red,
            ),
          ),
        );
      },
    );
  }
}

@storybook.Story('Default')
class ContextMenuRegionDefaultStory extends StoryObj<ContextMenuRegionMeta>
    with _$ContextMenuRegionDefaultStory {}
