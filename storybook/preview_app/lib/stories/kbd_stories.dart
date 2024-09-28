// import 'package:flutter/material.dart'hide Kbd;
import 'package:reflect_ui/reflect_ui.dart';
import 'package:storybook_dart/annotations.dart' as storybook;
import 'package:storybook_dart/storybook_dart.dart';

part 'kbd_stories.g.dart';

@storybook.Meta(
  title: 'Widgets/Kbd',
  argTypes: [],
)
class KbdMeta extends Meta with _$KbdMeta {
  @override
  Widget buildWidget(BuildContext context, List<Arg> args) {
    return StatefulBuilder(
      builder: (context, setState) {
        return const Kbd('Ctrl');
      },
    );
  }
}

@storybook.Story('Default')
class KbdDefaultStory extends StoryObj<KbdMeta> with _$KbdDefaultStory {}
