import 'package:flutter/widgets.dart';
import 'package:reflect_ui/reflect_ui.dart';
import 'package:storybook_dart/storybook_dart.dart';
import 'package:storybook_dart_annotation/storybook_dart_annotation.dart'
    as storybook;

part 'checkbox_stories.g.dart';

@storybook.Meta(
  title: 'Widgets/Checkbox',
  argTypes: [],
)
class CheckboxMeta extends Meta with _$CheckboxMeta {
  @override
  Widget buildWidget(BuildContext context, List<Arg> args) {
    bool value = false;
    return StatefulBuilder(
      builder: (context, setState) {
        return ReflectCheckbox(
          value: value,
          onChanged: (newValue) => setState(() {
            value = newValue!;
          }),
        );
      },
    );
  }
}

@storybook.Story('Default')
class CheckboxDefaultStory extends StoryObj<CheckboxMeta>
    with _$CheckboxDefaultStory {}
