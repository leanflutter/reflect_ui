import 'package:flutter/material.dart' show Colors;
import 'package:flutter/widgets.dart';
import 'package:reflect_ui/reflect_ui.dart';
import 'package:storybook_dart/annotations.dart' as storybook;
import 'package:storybook_dart/storybook_dart.dart';

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
        return Row(
          children: [
            Button(
              child: const Text('Text Button'),
              onPressed: () {},
            ),
            const SizedBox(width: 8),
            Button(
              variant: ButtonVariant.outlined,
              child: const Text('Text Button'),
              onPressed: () {},
            ),
            const SizedBox(width: 8),
            Container(
              color: Colors.grey,
              height: 28,
              width: 28,
            ),
          ],
        );
      },
    );
  }
}

@storybook.Story('Default')
class ButtonDefaultStory extends StoryObj<ButtonMeta>
    with _$ButtonDefaultStory {}
