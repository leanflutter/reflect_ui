import 'package:flutter/material.dart' show Colors;
import 'package:reflect_ui/reflect_ui.dart';
import 'package:storybook_dart/annotations.dart' as storybook;
import 'package:storybook_dart/storybook_dart.dart';

part 'button_stories.g.dart';

@storybook.Meta(
  title: 'Widgets/Button',
  argTypes: [],
)
class ButtonMeta extends Meta with _$ButtonMeta {
  String radioValue = '1';
  @override
  Widget buildWidget(BuildContext context, List<Arg> args) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Colors.grey,
              height: 28,
              width: 28,
            ),
            Button(
              variant: ButtonVariant.filled,
              onPressed: () {},
              // borderRadius: BorderRadius.zero,
              child: const Text('Text Button'),
            ),
            const SizedBox(width: 8),
            Container(
              color: Colors.grey,
              height: 28,
              width: 28,
            ),
            Button(
              variant: ButtonVariant.tinted,
              // borderRadius: BorderRadius.zero,
              child: const Text('Text Button'),
              onPressed: () {},
            ),
            const SizedBox(width: 8),
            Container(
              color: Colors.grey,
              height: 28,
              width: 28,
            ),
            Button(
              variant: ButtonVariant.outlined,
              // borderRadius: BorderRadius.zero,
              child: const Text('Text Button'),
              onPressed: () {},
            ),
            const SizedBox(width: 8),
            Container(
              color: Colors.grey,
              height: 28,
              width: 28,
            ),
            Button(
              variant: ButtonVariant.subtle,
              // borderRadius: BorderRadius.zero,
              child: const Text('Text Button'),
              onPressed: () {},
            ),
            const SizedBox(width: 8),
            Container(
              color: Colors.grey,
              height: 28,
              width: 28,
            ),
            Button(
              variant: ButtonVariant.transparent,
              // borderRadius: BorderRadius.zero,
              child: const Text('Text Button'),
              onPressed: () {},
            ),
            const SizedBox(width: 8),
            const SizedBox(
              width: 140,
              child: TextField(
                placeholder: 'Type something...',
              ),
            ),
            const SizedBox(width: 8),
            Container(
              color: Colors.grey,
              height: 28,
              width: 28,
            ),
            Checkbox(
              value: true,
              onChanged: (newValue) => setState(() {
                // value = newValue!;
              }),
              // shape: CircleBorder(),
            ),
            Checkbox(
              value: false,
              onChanged: (newValue) => setState(() {
                // value = newValue!;
              }),
            ),
            Checkbox(
              value: null,
              tristate: true,
              onChanged: (newValue) => setState(() {
                // value = newValue!;
              }),
            ),
            const Badge(
              variant: BadgeVariant.filled,
              child: Text('1'),
            ),
            const SizedBox(width: 8),
            const Badge(
              variant: BadgeVariant.outlined,
              child: Text('99+'),
            ),
            Radio<String>(
              value: '1',
              groupValue: radioValue,
              onChanged: (newValue) => setState(() {
                radioValue = newValue!;
              }),
            ),
            Radio<String>(
              value: '2',
              groupValue: radioValue,
              onChanged: (newValue) => setState(() {
                radioValue = newValue!;
              }),
            ),
            Switch(
              value: true,
              onChanged: (newValue) => setState(() {
                // value = newValue!;
              }),
            ),
            Switch(
              value: false,
              onChanged: (newValue) => setState(() {
                // value = newValue!;
              }),
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
