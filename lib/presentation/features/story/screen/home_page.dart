import 'package:berbagi_app/presentation/features/auth/provider/auth_provider.dart';
import 'package:berbagi_app/presentation/features/story/provider/story_provider.dart';
import 'package:berbagi_app/presentation/widgets/card_story.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final Function() onLogout;
  final Function() onAdd;
  final Function(String) storyId;

  // ignore: use_super_parameters
  const HomePage({
    Key? key,
    required this.onLogout,
    required this.storyId,
    required this.onAdd,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    final homeProvider = context.read<StoryProvider>();
    scrollController.addListener(
      () {
        if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent) {
          if (homeProvider.pageItems != null) {
            homeProvider.getAllStories();
          }
        }
      },
    );
    Future.microtask(() async => homeProvider.getAllStories());
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authWatch = context.watch<AuthProvider>();
    final refrseh = context.watch<StoryProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Sreen'),
      ),
      body: _buildList(),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            tooltip: "Post",
            child: const Icon(Icons.add),
            onPressed: () {
              widget.onAdd();
            },
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () async {
              final authRead = context.read<AuthProvider>();
              final result = await authRead.logout();
              if (result) widget.onLogout();
            },
            tooltip: "Logout",
            child: authWatch.isLoadingLogout
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : const Icon(Icons.logout),
          ),
        ],
      ),
    );
  }

  Widget _buildList() {
    return Consumer<StoryProvider>(
      builder: (context, values, child) {
        final state = values.storiesState;
        final homeProvider = context.read<StoryProvider>();
        if (state == ApiState.loading && values.pageItems == 1) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state == ApiState.loaded) {
          final stories = values.stories;

          return RefreshIndicator(
            onRefresh: () async {
              homeProvider.reload();
            },
            child: ListView.builder(
              controller: scrollController,
              itemCount: stories.length + (values.pageItems != null ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == stories.length && values.pageItems != null) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                var story = stories[index];
                return CardStory(
                  story: story,
                  onTapped: () {
                    widget.storyId(story.id ?? '');
                  },
                );
              },
            ),
          );
        } else if (state == ApiState.noData) {
          return const Center(
            child: Material(
              child: Text("No Data"),
            ),
          );
        } else if (state == ApiState.error) {
          return Center(
            child: Material(
              child: Text(values.storiesMessage),
            ),
          );
        } else {
          return const Center(
            child: Material(
              child: Text(''),
            ),
          );
        }
      },
    );
  }
}
