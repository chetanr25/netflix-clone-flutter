import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quadb/models/movies.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(8)),
              child: movie.imageUrl != null
                  ? CachedNetworkImage(
                      imageUrl: movie.imageUrl!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      errorWidget: (context, url, error) => const Icon(
                        Icons.movie,
                        size: 100,
                        color: Colors.red,
                      ),
                    )
                  : Container(
                      color: Colors.grey[800],
                      child: const Icon(Icons.movie,
                          size: 50, color: Colors.white),
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              movie.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
