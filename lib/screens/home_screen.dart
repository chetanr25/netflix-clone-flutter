import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quadb/providers/providers.dart';
import 'package:quadb/widgets/search_bar_widget.dart';

import 'movie_grid.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moviesAsync = ref.watch(moviesProvider);

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          backgroundColor: Colors.black,
          title: SearchBarWidget(),
        ),
        moviesAsync.when(
          data: (movies) => MovieGrid(movies: movies),
          loading: () => SliverFillRemaining(
            child: Center(child: CircularProgressIndicator()),
          ),
          error: (error, stack) => SliverFillRemaining(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  "Please enable internet connection and restart the app",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
