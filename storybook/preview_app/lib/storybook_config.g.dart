import 'package:preview_app/stories/alert_stories.dart';
import 'package:preview_app/stories/badge_stories.dart';
import 'package:preview_app/stories/button_stories.dart';
import 'package:preview_app/stories/card_stories.dart';
import 'package:preview_app/stories/checkbox_stories.dart';
import 'package:preview_app/stories/divider_stories.dart';
import 'package:preview_app/stories/kbd_stories.dart';
import 'package:preview_app/stories/loader_stories.dart';
import 'package:preview_app/stories/menu_stories.dart';
import 'package:preview_app/stories/radio_stories.dart';
import 'package:preview_app/stories/slider_stories.dart';
import 'package:preview_app/stories/switch_stories.dart';
import 'package:preview_app/stories/text_field_stories.dart';
import 'package:storybook_dart/storybook_dart.dart';

final StorybookConfig storybookConfig = StorybookConfig(
  stories: [
    AlertDefaultStory(),
    AlertWithVariantStory(),
    BadgeDefaultStory(),
    ButtonDefaultStory(),
    ButtonWithKindStory(),
    ButtonWithVariantStory(),
    ButtonWithSizeStory(),
    CardDefaultStory(),
    CheckboxDefaultStory(),
    DividerDefaultStory(),
    KbdDefaultStory(),
    LoaderDefaultStory(),
    MenuDefaultStory(),
    RadioDefaultStory(),
    SliderDefaultStory(),
    SwitchDefaultStory(),
    TextFieldDefaultStory(),
  ],
);
