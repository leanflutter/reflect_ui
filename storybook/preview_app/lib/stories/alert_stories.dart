import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:reflect_ui/reflect_ui.dart';
import 'package:storybook_dart/annotations.dart' as storybook;
import 'package:storybook_dart/storybook_dart.dart';

part 'alert_stories.g.dart';

@storybook.Meta(
  title: 'Widgets/Alert',
  argTypes: [
    storybook.ArgType('label'),
  ],
)
class AlertMeta extends Meta with _$AlertMeta {
  @override
  Widget buildWidget(BuildContext context, List<Arg> args) {
    return StatefulBuilder(
      builder: (context, setState) {
        return SizedBox(
          width: 640,
          child: GappedColumn(
            gap: 20,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Alert(
                kind: AlertKind.success,
                variant: AlertVariant.filled,
                icon: Icon(FluentIcons.info_20_regular),
                title: Text('Order completed'),
                message: Text(
                  'Lorem ipsum dolor sit amet consectetur adipisicing elit. '
                  'Aliquid pariatur, ipsum similique veniam.',
                ),
              ),
              Alert(
                kind: AlertKind.success,
                variant: AlertVariant.tinted,
                icon: Icon(FluentIcons.info_20_regular),
                title: Text('Title'),
                message: Text(
                  'A new software update is available. '
                  'See what’s new in version 2.0.4.',
                ),
              ),
              Alert(
                kind: AlertKind.success,
                variant: AlertVariant.outlined,
                icon: Icon(FluentIcons.info_20_regular),
                title: Text('There were 2 errors with your submission'),
                message: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Your password must be at least 8 characters'),
                    Text(
                      'Your password must include at least '
                      'one pro wrestling finishing move',
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

@storybook.Story('Default')
class AlertDefaultStory extends StoryObj<AlertMeta> with _$AlertDefaultStory {}

@storybook.Story('With Variant')
class AlertWithVariantStory extends StoryObj<AlertMeta>
    with _$AlertWithVariantStory {
  @override
  Widget build(BuildContext context, List<Arg> args) {
    return GappedColumn(
      gap: 16,
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final variant in AlertVariant.values)
          GappedRow(
            gap: 16,
            mainAxisSize: MainAxisSize.min,
            children: [
              for (final kind in AlertKind.values)
                SizedBox(
                  width: 260,
                  child: Alert(
                    kind: kind,
                    variant: variant,
                    icon: const Icon(FluentIcons.info_12_regular),
                    title: const Text('New software update'),
                    message: const Text(
                      'A new software update is available. '
                      'See what’s new in version 2.0.4.',
                    ),
                  ),
                ),
            ],
          ),
      ],
    );
  }
}
