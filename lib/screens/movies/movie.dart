import 'package:flutter/material.dart';

import 'package:moviewer/models/models.dart';

class MovieWidget extends StatelessWidget {
  final Movie movie;
  final Function(Movie) onMovieClick;

  const MovieWidget({
    Key? key,
    required this.movie,
    required this.onMovieClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(movie.title),
        onTap: () {
          onMovieClick(movie);
        },
      ),
    );
  }
}
