import 'package:reflect_ui/reflect_ui.dart';
import 'package:storybook_dart/annotations.dart' as storybook;
import 'package:storybook_dart/storybook_dart.dart';

part 'switch_stories.g.dart';

@storybook.Meta(
  title: 'Widgets/Switch',
  argTypes: [],
)
class SwitchMeta extends Meta with _$SwitchMeta {
  bool value = false;
  @override
  Widget buildWidget(BuildContext context, List<Arg> args) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Switch(
          value: value,
          onChanged: (newValue) => setState(() {
            value = newValue;
          }),
        );
      },
    );
  }
}

@storybook.Story('Default')
class SwitchDefaultStory extends StoryObj<SwitchMeta>
    with _$SwitchDefaultStory {}
