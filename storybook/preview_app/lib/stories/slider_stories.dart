import 'package:reflect_ui/reflect_ui.dart';
import 'package:storybook_dart/annotations.dart' as storybook;
import 'package:storybook_dart/storybook_dart.dart';

part 'slider_stories.g.dart';

@storybook.Meta(
  title: 'Widgets/Slider',
  argTypes: [],
)
class SliderMeta extends Meta with _$SliderMeta {
  double value = 0;
  @override
  Widget buildWidget(BuildContext context, List<Arg> args) {
    return StatefulBuilder(
      builder: (context, setState) {
        return SizedBox(
          width: 300,
          child: Slider(
            value: value,
            min: 0,
            max: 100,
            onChanged: (newValue) => setState(() {
              value = newValue;
            }),
          ),
        );
      },
    );
  }
}

@storybook.Story('Default')
class SliderDefaultStory extends StoryObj<SliderMeta>
    with _$SliderDefaultStory {}
