import 'package:preview_app/stories/alert_stories.dart';
import 'package:preview_app/stories/badge_stories.dart';
import 'package:preview_app/stories/button_stories.dart';
import 'package:preview_app/stories/card_stories.dart';
import 'package:preview_app/stories/checkbox_stories.dart';
import 'package:preview_app/stories/context_menu_region_stories.dart';
import 'package:preview_app/stories/divider_stories.dart';
import 'package:preview_app/stories/kbd_stories.dart';
import 'package:preview_app/stories/loader_stories.dart';
import 'package:preview_app/stories/menu_stories.dart';
import 'package:preview_app/stories/nav_list_stories.dart';
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
    ContextMenuRegionDefaultStory(),
    DividerDefaultStory(),
    KbdDefaultStory(),
    LoaderDefaultStory(),
    MenuDefaultStory(),
    NavListDefaultStory(),
    RadioDefaultStory(),
    SliderDefaultStory(),
    SwitchDefaultStory(),
    TextFieldDefaultStory(),
  ],
);
