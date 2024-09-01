import 'package:collection/collection.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart'
    show Colors, MaterialApp, SelectableText, Theme, ThemeData;
import 'package:preview_app/storybook_config.g.dart';
import 'package:preview_app/themes/light.dart';
import 'package:reflect_colors/reflect_colors.dart';
import 'package:reflect_ui/reflect_ui.dart';
import 'package:storybook_dart/annotations.dart' as storybook;
import 'package:storybook_dart/storybook_dart.dart';

part 'storybook_preview_app.g.dart';

class _HomePage extends StatefulWidget {
  const _HomePage({
    required this.config,
  });

  final StorybookConfig config;

  @override
  State<_HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage> {
  String _selectedStoryId = '';

  Widget _buildBodyWithSingleStory(
    BuildContext context, {
    required String storyId,
  }) {
    final story =
        widget.config.stories.firstWhereOrNull((e) => e.id == storyId);
    return ColoredBox(
      color: Colors.white,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          constraints: const BoxConstraints(maxWidth: 1440),
          child: Builder(
            builder: (context) {
              if (story == null) {
                return const Text('Not found');
              }
              return story.build(context, []);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: 240,
            child: ListView.separated(
              itemCount: widget.config.stories.length,
              itemBuilder: (context, index) {
                final story = widget.config.stories[index];
                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    setState(() {
                      _selectedStoryId = story.id;
                    });
                  },
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      decoration: BoxDecoration(
                        color: _selectedStoryId == story.id
                            ? Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.1)
                            : null,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(story.meta.title),
                          SelectableText(story.name),
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
            ),
          ),
          const Divider(),
          Expanded(
            child: _buildBodyWithSingleStory(
              context,
              storyId: _selectedStoryId,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final storyId = Uri.base.queryParameters['id'];

    return Scaffold(
      body: storyId != null
          ? _buildBodyWithSingleStory(context, storyId: storyId)
          : _buildBody(context),
    );
  }
}

@storybook.StorybookPreviewer()
class StorybookPreviewApp extends StorybookPreviewer
    with _$StorybookPreviewApp {
  const StorybookPreviewApp({super.key});

  @override
  ThemeData get theme => lightTheme;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StorybookPreviewer',
      theme: theme,
      home: _HomePage(
        config: config,
      ),
      builder: (context, child) {
        child = ExtendedTheme(
          data: ExtendedThemeData(
            colors: ThemeBaseColors(
              primary: ReflectColors.indigo,
              secondary: ReflectColors.neutral,
              success: ReflectColors.green,
              danger: ReflectColors.red,
              warning: ReflectColors.amber,
              info: ReflectColors.sky,
            ),
            corners: const ThemeBaseCorners(),
            shadows: const ThemeBaseShadows(),
            spacing: const ThemeBaseSpacing(),
            icons: const ThemeBaseIcons(
              chevronLeft: FluentIcons.chevron_left_16_regular,
              chevronRight: FluentIcons.chevron_right_16_regular,
            ),
            baseStyleResolver: WidgetBaseStyleResolver(),
          ),
          child: child!,
        );
        return child;
      },
    );
  }
}
