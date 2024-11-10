import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quadb/models/movies.dart';

class DetailsScreen extends StatelessWidget {
  final Movie movie;

  const DetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: movie.originalImageUrl != null
                  ? CachedNetworkImage(
                      imageUrl: movie.originalImageUrl!,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      color: Colors.grey[800],
                      child: const Icon(Icons.movie,
                          size: 100, color: Colors.white),
                    ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (movie.genres.isNotEmpty)
                    Wrap(
                      spacing: 8,
                      children: movie.genres
                          .map(
                            (genre) => Chip(
                              label: Text(genre),
                              backgroundColor: Colors.red,
                              labelStyle: const TextStyle(color: Colors.white),
                            ),
                          )
                          .toList(),
                    ),
                  const SizedBox(height: 16),
                  Text(
                    'Summary',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[300],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    movie.summary?.replaceAll(RegExp(r'<[^>]*>'), '') ??
                        'No summary available',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[300],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
