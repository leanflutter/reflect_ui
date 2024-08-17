import 'package:reflect_ui/reflect_ui.dart';
import 'package:storybook_dart/annotations.dart' as storybook;
import 'package:storybook_dart/storybook_dart.dart';

part 'divider_stories.g.dart';

@storybook.Meta(
  title: 'Widgets/Divider',
  argTypes: [],
)
class DividerMeta extends Meta with _$DividerMeta {
  @override
  Widget buildWidget(BuildContext context, List<Arg> args) {
    return StatefulBuilder(
      builder: (context, setState) {
        return const SizedBox(
          width: 300,
          child: Divider(),
        );
      },
    );
  }
}

@storybook.Story('Default')
class DividerDefaultStory extends StoryObj<DividerMeta>
    with _$DividerDefaultStory {}
