import 'package:flutter/material.dart';
import 'package:moviewer/models/models.dart';
import 'package:moviewer/notifiers/movie_notifier.dart';
import 'package:moviewer/screens/movies/movie.dart';
import 'package:provider/provider.dart';

class MovieList extends StatelessWidget {
  final MovieNotifier movieNotifier;
  final Function(Movie) onMovieClick;

  const MovieList({
    Key? key,
    required this.movieNotifier,
    required this.onMovieClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: movieNotifier,
      child: Consumer<MovieNotifier>(
        builder: (context, movieNotifier, child) {
          return ListView.builder(
            itemCount: movieNotifier.state.data.length,
            itemBuilder: (context, index) {
              final movie = movieNotifier.state.data[index];
              return MovieWidget(movie: movie, onMovieClick: onMovieClick);
            },
          );
        },
      ),
    );
  }
}
