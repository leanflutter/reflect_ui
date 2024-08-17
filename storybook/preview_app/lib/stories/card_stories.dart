// import 'package:flutter/material.dart'hide Card;
import 'package:reflect_ui/reflect_ui.dart';
import 'package:storybook_dart/annotations.dart' as storybook;
import 'package:storybook_dart/storybook_dart.dart';

part 'card_stories.g.dart';

@storybook.Meta(
  title: 'Widgets/Card',
  argTypes: [],
)
class CardMeta extends Meta with _$CardMeta {
  @override
  Widget buildWidget(BuildContext context, List<Arg> args) {
    return StatefulBuilder(
      builder: (context, setState) {
        return const Card(
          child: Text('Card'),
        );
      },
    );
  }
}

@storybook.Story('Default')
class CardDefaultStory extends StoryObj<CardMeta> with _$CardDefaultStory {}
