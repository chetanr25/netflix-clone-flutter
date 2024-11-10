// // lib/main.dart
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// void main() {
//   runApp(const MovieApp());
// }

// class MovieApp extends StatelessWidget {
//   const MovieApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Movie App',
//       theme: ThemeData(
//         primarySwatch: Colors.red,
//         scaffoldBackgroundColor: Colors.black,
//         textTheme: const TextTheme(
//           bodyLarge: TextStyle(color: Colors.white),
//           bodyMedium: TextStyle(color: Colors.white),
//           titleLarge: TextStyle(color: Colors.white),
//         ),
//       ),
//       home: const SplashScreen(),
//     );
//   }
// }

// // Splash Screen
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(const Duration(seconds: 3), () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const MainScreen()),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.network(
//               'https://via.placeholder.com/150',
//               width: 150,
//               height: 150,
//             ),
//             const SizedBox(height: 20),
//             const CircularProgressIndicator(color: Colors.red),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Main Screen with Bottom Navigation
// class MainScreen extends StatefulWidget {
//   const MainScreen({Key? key}) : super(key: key);

//   @override
//   _MainScreenState createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   int _selectedIndex = 0;
//   final List<Widget> _screens = [
//     const HomeScreen(),
//     const SearchScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _screens[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.black,
//         selectedItemColor: Colors.red,
//         unselectedItemColor: Colors.grey,
//         currentIndex: _selectedIndex,
//         onTap: (index) {
//           setState(() {
//             _selectedIndex = index;
//           });
//         },
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search),
//             label: 'Search',
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Home Screen
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   List<dynamic> movies = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchMovies();
//   }

//   Future<void> fetchMovies() async {
//     final response =
//         await http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=all'));
//     if (response.statusCode == 200) {
//       setState(() {
//         movies = json.decode(response.body);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CustomScrollView(
//       slivers: [
//         SliverAppBar(
//           floating: true,
//           backgroundColor: Colors.black.withOpacity(0.7),
//           title: GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const SearchScreen()),
//               );
//             },
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               height: 40,
//               decoration: BoxDecoration(
//                 color: Colors.grey[800],
//                 borderRadius: BorderRadius.circular(5),
//               ),
//               child: const Row(
//                 children: [
//                   Icon(Icons.search, color: Colors.grey),
//                   SizedBox(width: 8),
//                   Text(
//                     'Search movies...',
//                     style: TextStyle(color: Colors.grey, fontSize: 16),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         SliverPadding(
//           padding: const EdgeInsets.all(16),
//           sliver: SliverGrid(
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               childAspectRatio: 0.7,
//               crossAxisSpacing: 16,
//               mainAxisSpacing: 16,
//             ),
//             delegate: SliverChildBuilderDelegate(
//               (context, index) {
//                 final movie = movies[index]['show'];
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => DetailsScreen(movie: movie),
//                       ),
//                     );
//                   },
//                   child: MovieCard(movie: movie),
//                 );
//               },
//               childCount: movies.length,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// // Search Screen
// class SearchScreen extends StatefulWidget {
//   const SearchScreen({Key? key}) : super(key: key);

//   @override
//   _SearchScreenState createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   List<dynamic> searchResults = [];
//   final TextEditingController _searchController = TextEditingController();

//   Future<void> searchMovies(String query) async {
//     if (query.isEmpty) return;
//     final response = await http.get(
//       Uri.parse('https://api.tvmaze.com/search/shows?q=$query'),
//     );
//     if (response.statusCode == 200) {
//       setState(() {
//         searchResults = json.decode(response.body);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.all(16),
//             child: TextField(
//               controller: _searchController,
//               onChanged: (value) => searchMovies(value),
//               style: const TextStyle(color: Colors.white),
//               decoration: InputDecoration(
//                 hintText: 'Search movies...',
//                 hintStyle: TextStyle(color: Colors.grey[400]),
//                 prefixIcon: const Icon(Icons.search, color: Colors.grey),
//                 filled: true,
//                 fillColor: Colors.grey[800],
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: BorderSide.none,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Expanded(
//           child: GridView.builder(
//             padding: const EdgeInsets.all(16),
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               childAspectRatio: 0.7,
//               crossAxisSpacing: 16,
//               mainAxisSpacing: 16,
//             ),
//             itemCount: searchResults.length,
//             itemBuilder: (context, index) {
//               final movie = searchResults[index]['show'];
//               return GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => DetailsScreen(movie: movie),
//                     ),
//                   );
//                 },
//                 child: MovieCard(movie: movie),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }

// // Details Screen
// class DetailsScreen extends StatelessWidget {
//   final dynamic movie;

//   const DetailsScreen({Key? key, required this.movie}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             expandedHeight: 300,
//             pinned: true,
//             flexibleSpace: FlexibleSpaceBar(
//               background: movie['image'] != null
//                   ? Image.network(
//                       movie['image']['original'],
//                       fit: BoxFit.cover,
//                     )
//                   : Container(
//                       color: Colors.grey[800],
//                       child: const Icon(Icons.movie,
//                           size: 100, color: Colors.white),
//                     ),
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     movie['name'],
//                     style: const TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   if (movie['genres'] != null)
//                     Wrap(
//                       spacing: 8,
//                       children: List<Widget>.from(
//                         movie['genres'].map(
//                           (genre) => Chip(
//                             label: Text(genre),
//                             backgroundColor: Colors.red,
//                             labelStyle: const TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ),
//                     ),
//                   const SizedBox(height: 16),
//                   Text(
//                     'Summary',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.grey[300],
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     movie['summary'] != null
//                         ? movie['summary'].replaceAll(RegExp(r'<[^>]*>'), '')
//                         : 'No summary available',
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.grey[300],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Movie Card Widget
// class MovieCard extends StatelessWidget {
//   final dynamic movie;

//   const MovieCard({Key? key, required this.movie}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.grey[900],
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             child: ClipRRect(
//               borderRadius:
//                   const BorderRadius.vertical(top: Radius.circular(8)),
//               child: movie['image'] != null
//                   ? Image.network(
//                       movie['image']['medium'],
//                       fit: BoxFit.cover,
//                       width: double.infinity,
//                     )
//                   : Container(
//                       color: Colors.grey[800],
//                       child: const Icon(Icons.movie,
//                           size: 50, color: Colors.white),
//                     ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8),
//             child: Text(
//               movie['name'],
//               style: const TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:quadb/screens/splash_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MovieApp(),
    ),
  );
}

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movie App',
        theme: ThemeData(
          primarySwatch: Colors.red,
          scaffoldBackgroundColor: Colors.black,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Colors.white),
            titleLarge: TextStyle(color: Colors.white),
          ),
        ),
        home: const SafeArea(child: SplashScreen()),
      ),
    );
  }
}
