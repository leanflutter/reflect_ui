import 'package:flutter/widgets.dart';
import 'package:reflect_ui/reflect_ui.dart';
import 'package:storybook_dart/storybook_dart.dart';
import 'package:storybook_dart_annotation/storybook_dart_annotation.dart'
    as storybook;

part 'button_stories.g.dart';

@storybook.Meta(
  title: 'Widgets/Button',
  argTypes: [],
)
class ButtonMeta extends Meta with _$ButtonMeta {
  @override
  Widget buildWidget(BuildContext context, List<Arg> args) {
    return StatefulBuilder(
      builder: (context, setState) {
        return const Button();
      },
    );
  }
}

@storybook.Story('Default')
class ButtonDefaultStory extends StoryObj<ButtonMeta>
    with _$ButtonDefaultStory {}
