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
          return NotificationListener<ScrollEndNotification>(
            onNotification: (notification) {
              if (notification.metrics.extentBefore == notification.metrics.maxScrollExtent &&
                  !movieNotifier.pagination.hasReachedEnd) {
                movieNotifier.nextPage(movieNotifier.pagination.query);
              }
              return false;
            },
            child: ListView.builder(
              itemCount: movieNotifier.state.data.length,
              itemBuilder: (context, index) {
                final movie = movieNotifier.state.data[index];
                if (movieNotifier.state.isFetching && index == movieNotifier.state.data.length - 1) {
                  return const Padding(
                    padding: EdgeInsets.all(28.0),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                return MovieWidget(movie: movie, onMovieClick: onMovieClick);
              },
            ),
          );
        },
      ),
    );
  }
}
