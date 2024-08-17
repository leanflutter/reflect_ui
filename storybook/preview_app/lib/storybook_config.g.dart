import 'package:preview_app/stories/button_stories.dart';
import 'package:preview_app/stories/checkbox_stories.dart';
import 'package:preview_app/stories/loader_stories.dart';
import 'package:preview_app/stories/radio_stories.dart';
import 'package:preview_app/stories/slider_stories.dart';
import 'package:preview_app/stories/switch_stories.dart';
import 'package:preview_app/stories/text_field_stories.dart';
import 'package:storybook_dart/storybook_dart.dart';

final StorybookConfig storybookConfig = StorybookConfig(
  stories: [
    ButtonDefaultStory(),
    CheckboxDefaultStory(),
    LoaderDefaultStory(),
    RadioDefaultStory(),
    SliderDefaultStory(),
    SwitchDefaultStory(),
    TextFieldDefaultStory(),
  ],
);
