import 'package:flutter/material.dart';
import 'package:quadb/models/movies.dart';
import 'package:quadb/screens/details_screen.dart';
import 'package:quadb/widgets/movie_card.dart';

class MovieGrid extends StatelessWidget {
  final List<Movie> movies;

  const MovieGrid({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    var crossAxisCount = 0;
    if (width < 600) {
      crossAxisCount = 2;
    } else if (width < 800) {
      crossAxisCount = 3;
    } else if (width < 1200) {
      crossAxisCount = 4;
    } else {
      crossAxisCount = 5;
    }

    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: 0.7,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final movie = movies[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(movie: movie),
                  ),
                );
              },
              child: MovieCard(movie: movie),
            );
          },
          childCount: movies.length,
        ),
      ),
    );
  }
}
