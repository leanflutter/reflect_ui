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

@storybook.Story('With Kind')
class ButtonWithKindStory extends StoryObj<ButtonMeta>
    with _$ButtonWithKindStory {
  @override
  Widget build(BuildContext context, List<Arg> args) {
    return GappedColumn(
      gap: 16,
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final kind in ButtonKind.values)
          GappedRow(
            gap: 16,
            mainAxisSize: MainAxisSize.min,
            children: [
              for (final variant in ButtonVariant.values)
                Button(
                  kind: kind,
                  variant: variant,
                  onPressed: () {},
                  child: const Text('Text Button'),
                ),
            ],
          ),
      ],
    );
  }
}

@storybook.Story('With Variant')
class ButtonWithVariantStory extends StoryObj<ButtonMeta>
    with _$ButtonWithVariantStory {
  @override
  Widget build(BuildContext context, List<Arg> args) {
    return GappedColumn(
      gap: 16,
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final variant in ButtonVariant.values)
          GappedRow(
            gap: 16,
            mainAxisSize: MainAxisSize.min,
            children: [
              for (final kind in ButtonKind.values)
                Button(
                  kind: kind,
                  variant: variant,
                  onPressed: () {},
                  child: const Text('Text Button'),
                ),
            ],
          ),
      ],
    );
  }
}

@storybook.Story('With Size')
class ButtonWithSizeStory extends StoryObj<ButtonMeta>
    with _$ButtonWithSizeStory {}
