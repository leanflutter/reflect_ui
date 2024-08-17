import 'package:collection/collection.dart';
import 'package:flutter/material.dart'
    show Colors, MaterialApp, SelectableText, Theme, ThemeData;
import 'package:flutter/widgets.dart';
import 'package:preview_app/storybook_config.g.dart';
import 'package:reflect_ui/reflect_ui.dart';
import 'package:storybook_dart/annotations.dart' as storybook;
import 'package:storybook_dart/storybook_dart.dart';

part 'storybook_preview_app.g.dart';

const String _kDefaultFontFamily = 'Inter';

const TextStyle _kBodyLargeTextStyle = TextStyle(
  fontFamily: _kDefaultFontFamily,
  color: Colors.black,
  fontSize: 16,
  height: 20 / 16,
);

const TextStyle _kBodyMediumTextStyle = TextStyle(
  fontFamily: _kDefaultFontFamily,
  color: Colors.black,
  fontSize: 14,
  height: 18 / 14,
);

const TextStyle _kBodySmallTextStyle = TextStyle(
  fontFamily: _kDefaultFontFamily,
  color: Colors.black,
  fontSize: 12,
  height: 16 / 12,
);

const TextStyle _kLabelLargeTextStyle = TextStyle(
  fontFamily: _kDefaultFontFamily,
  fontWeight: FontWeight.w600,
  color: Colors.black,
  fontSize: 14,
  height: 18 / 14,
);

const TextStyle _kLabelMediumTextStyle = TextStyle(
  fontFamily: _kDefaultFontFamily,
  fontWeight: FontWeight.w600,
  color: Colors.black,
  fontSize: 12,
  height: 16 / 12,
);

const TextStyle _kLabelSmallTextStyle = TextStyle(
  fontFamily: _kDefaultFontFamily,
  fontWeight: FontWeight.w600,
  color: Colors.black,
  fontSize: 10,
  height: 14 / 10,
);

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
          constraints: const BoxConstraints(maxWidth: 1200),
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
  ThemeData get theme {
    ThemeData themeData = ThemeData.light();
    return themeData.copyWith(
      textTheme: themeData.textTheme.copyWith(
        bodyLarge: _kBodyLargeTextStyle,
        bodyMedium: _kBodyMediumTextStyle,
        bodySmall: _kBodySmallTextStyle,
        labelLarge: _kLabelLargeTextStyle,
        labelMedium: _kLabelMediumTextStyle,
        labelSmall: _kLabelSmallTextStyle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StorybookPreviewer',
      theme: theme,
      home: _HomePage(
        config: config,
      ),
    );
  }
}
