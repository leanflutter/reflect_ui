import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:reflect_ui/reflect_ui.dart';
import 'package:storybook_dart/annotations.dart' as storybook;
import 'package:storybook_dart/storybook_dart.dart';

part 'nav_list_stories.g.dart';

@storybook.Meta(
  title: 'Widgets/NavList',
  argTypes: [
    storybook.ArgType('label'),
  ],
)
class NavListMeta extends Meta with _$NavListMeta {
  int _selectedIndex = 0;

  @override
  Widget buildWidget(BuildContext context, List<Arg> args) {
    return StatefulBuilder(
      builder: (context, setState) {
        return SizedBox(
          width: 200,
          child: GappedColumn(
            gap: 20,
            mainAxisSize: MainAxisSize.min,
            children: [
              NavList(
                children: [
                  NavListSection(
                    children: [
                      NavListItem(
                        selected: _selectedIndex == 0,
                        leading: const Icon(FluentIcons.home_24_regular),
                        title: const Text('Home'),
                        onTap: () {
                          setState(() {
                            _selectedIndex = 0;
                          });
                        },
                      ),
                      NavListItem(
                        selected: _selectedIndex == 1,
                        leading: const Icon(FluentIcons.info_24_regular),
                        title: const Text('About'),
                        onTap: () {
                          setState(() {
                            _selectedIndex = 1;
                          });
                        },
                      ),
                      NavListItem(
                        selected: _selectedIndex == 2,
                        leading: const Icon(FluentIcons.settings_24_regular),
                        title: const Text('Settings'),
                        onTap: () {
                          setState(() {
                            _selectedIndex = 2;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

@storybook.Story('Default')
class NavListDefaultStory extends StoryObj<NavListMeta>
    with _$NavListDefaultStory {}
