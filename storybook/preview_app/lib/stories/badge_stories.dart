import 'package:reflect_ui/reflect_ui.dart';
import 'package:storybook_dart/annotations.dart' as storybook;
import 'package:storybook_dart/storybook_dart.dart';

part 'badge_stories.g.dart';

@storybook.Meta(
  title: 'Widgets/Badge',
  argTypes: [],
)
class BadgeMeta extends Meta with _$BadgeMeta {
  String radioValue = '1';
  @override
  Widget buildWidget(BuildContext context, List<Arg> args) {
    return StatefulBuilder(
      builder: (context, setState) {
        return GappedRow(
          gap: 8,
          mainAxisSize: MainAxisSize.min,
          children: const [
            Badge(
              variant: BadgeVariant.filled,
              child: Text('Badge'),
            ),
            Badge(
              variant: BadgeVariant.outlined,
              child: Text('Badge'),
            ),
          ],
        );
      },
    );
  }
}

@storybook.Story('Default')
class BadgeDefaultStory extends StoryObj<BadgeMeta> with _$BadgeDefaultStory {}
