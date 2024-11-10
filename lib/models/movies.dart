class Movie {
  final int id;
  final String name;
  final String? summary;
  final String? imageUrl;
  final String? originalImageUrl;
  final List<String> genres;

  Movie({
    required this.id,
    required this.name,
    this.summary,
    this.imageUrl,
    this.originalImageUrl,
    required this.genres,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    final show = json['show'] ?? json;
    return Movie(
      id: show['id'],
      name: show['name'],
      summary: show['summary'],
      imageUrl: show['image']?['medium'],
      originalImageUrl: show['image']?['original'],
      genres: List<String>.from(show['genres'] ?? []),
    );
  }
}
