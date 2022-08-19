import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moviewer/models/models.dart';
import 'package:moviewer/screens/movies/theme.dart';

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
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: InkWell(
        onTap: () => onMovieClick(movie),
        child: Stack(children: [
          CachedNetworkImage(
            imageUrl: movie.posterUrl,
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
            errorWidget: (context, url, error) => buildErrorWidget(),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: movieTitleGradientDecoration,
              child: Text(
                movie.title,
                style: const TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ]),
      ),
    );
  }

  static Widget buildErrorWidget() {
    return Container(
      color: Colors.red,
      height: 200,
      child: const Padding(
        padding: EdgeInsets.only(top: 50),
        child: Align(
          alignment: Alignment.topCenter,
          child: Icon(Icons.image_not_supported_rounded, size: 50, color: Colors.white),
        ),
      ),
    );
  }
}
