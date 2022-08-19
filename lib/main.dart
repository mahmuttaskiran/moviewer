import 'package:flutter/material.dart';
import 'package:moviewer/di/di.dart';
import 'package:moviewer/screens/movies/movie_search_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moviewer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MovieSearchPage(movieNotifier: MovieNotifierModule().provideMovieNotifier()),
    );
  }
}
