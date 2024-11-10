import 'package:http/http.dart' as http;
import 'package:quadb/models/movies.dart';
import 'dart:convert';

class ApiService {
  static const String baseUrl = 'https://api.tvmaze.com';

  Future<List<Movie>> fetchAllMovies() async {
    final response = await http.get(Uri.parse('$baseUrl/search/shows?q=all'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Movie.fromJson(json)).toList();
    }
    throw Exception('Failed to fetch movies');
  }

  Future<List<Movie>> searchMovies(String query) async {
    if (query.isEmpty) return [];
    final response =
        await http.get(Uri.parse('$baseUrl/search/shows?q=$query'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Movie.fromJson(json)).toList();
    }
    throw Exception('Failed to search movies');
  }
}
