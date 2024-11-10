import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quadb/screens/movie_grid.dart';
import 'package:quadb/providers/providers.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchResultsAsync = ref.watch(searchResultsProvider);
    final focusNode = ref.watch(searchFocusNodeProvider);

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   focusNode.requestFocus();
    // });

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            focusNode: focusNode,
            onChanged: (value) {
              ref.read(searchQueryProvider.notifier).state = value;
            },
            keyboardAppearance: Brightness.dark,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Search movies...',
              hintStyle: TextStyle(color: Colors.grey[400]),
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              filled: true,
              fillColor: Colors.grey[800],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onHorizontalDragDown: (d) {
              focusNode.unfocus();
            },
            onHorizontalDragUpdate: (d) {
              focusNode.unfocus();
            },
            child: CustomScrollView(
              slivers: [
                searchResultsAsync.when(
                  data: (movies) => MovieGrid(movies: movies),
                  loading: () => const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  error: (error, stack) => SliverFillRemaining(
                    child: Center(child: Text('Error: $error')),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
