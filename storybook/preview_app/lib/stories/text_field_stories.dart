// import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:reflect_ui/reflect_ui.dart';
import 'package:storybook_dart/storybook_dart.dart';
import 'package:storybook_dart_annotation/storybook_dart_annotation.dart'
    as storybook;

part 'text_field_stories.g.dart';

@storybook.Meta(
  title: 'Widgets/TextField',
  argTypes: [],
)
class TextFieldMeta extends Meta with _$TextFieldMeta {
  @override
  Widget buildWidget(BuildContext context, List<Arg> args) {
    return StatefulBuilder(
      builder: (context, setState) {
        return const TextField(
          placeholder: 'Type something...',
        );
      },
    );
  }
}

@storybook.Story('Default')
class TextFieldDefaultStory extends StoryObj<TextFieldMeta>
    with _$TextFieldDefaultStory {}
