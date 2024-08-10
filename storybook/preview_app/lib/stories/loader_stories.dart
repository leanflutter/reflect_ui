import 'package:flutter/widgets.dart';
import 'package:reflect_ui/reflect_ui.dart';
import 'package:storybook_dart/annotations.dart' as storybook;
import 'package:storybook_dart/storybook_dart.dart';

part 'loader_stories.g.dart';

@storybook.Meta(
  title: 'Widgets/Loader',
  argTypes: [],
)
class LoaderMeta extends Meta with _$LoaderMeta {
  @override
  Widget buildWidget(BuildContext context, List<Arg> args) {
    return StatefulBuilder(
      builder: (context, setState) {
        return const Loader();
      },
    );
  }
}

@storybook.Story('Default')
class LoaderDefaultStory extends StoryObj<LoaderMeta>
    with _$LoaderDefaultStory {}
