import 'package:flutter/widgets.dart';
import 'package:reflect_ui/reflect_ui.dart';
import 'package:storybook_dart/annotations.dart' as storybook;
import 'package:storybook_dart/storybook_dart.dart';

part 'radio_stories.g.dart';

@storybook.Meta(
  title: 'Widgets/Radio',
  argTypes: [],
)
class RadioMeta extends Meta with _$RadioMeta {
  String radioValue = '1';
  @override
  Widget buildWidget(BuildContext context, List<Arg> args) {
    return StatefulBuilder(
      builder: (context, setState) {
        return ReflectRadio<String>(
          value: '1',
          groupValue: radioValue,
          onChanged: (newValue) => setState(() {
            radioValue = newValue!;
          }),
        );
      },
    );
  }
}

@storybook.Story('Default')
class RadioDefaultStory extends StoryObj<RadioMeta> with _$RadioDefaultStory {}
