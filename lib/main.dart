import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

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
          primaryTextTheme: GoogleFonts.exo2TextTheme(),
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
