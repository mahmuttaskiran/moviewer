import 'package:flutter/material.dart';
import 'package:moviewer/models/models.dart';

class MovieOverview extends StatelessWidget {
  final Movie movie;

  const MovieOverview({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10),
        Text(
          movie.title,
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 20),
        Text(
          movie.overview,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
