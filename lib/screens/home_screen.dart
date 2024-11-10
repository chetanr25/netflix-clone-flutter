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
          loading: () => const SliverFillRemaining(
            child: Center(child: CircularProgressIndicator()),
          ),
          error: (error, stack) => SliverFillRemaining(
            child: Center(child: Text('Error: $error')),
          ),
        ),
      ],
    );
  }
}
