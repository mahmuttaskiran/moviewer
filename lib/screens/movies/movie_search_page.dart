import 'package:flutter/material.dart';
import 'package:moviewer/notifiers/movie_notifier.dart';
import 'package:moviewer/screens/movies/movie_list.dart';
import 'package:moviewer/screens/movies/theme.dart';

class MovieSearchPage extends StatefulWidget {
  final MovieNotifier movieNotifier;

  const MovieSearchPage({required this.movieNotifier, Key? key}) : super(key: key);

  @override
  State<MovieSearchPage> createState() => _MovieSearchPageState();
}

class _MovieSearchPageState extends State<MovieSearchPage> {
  late final TextEditingController textController = TextEditingController(text: widget.movieNotifier.pagination.query);

  @override
  void initState() {
    super.initState();
    _listenTextController();
  }

  void _listenTextController() {
    textController.addListener(() {
      if (textController.text.length > 1) {
        widget.movieNotifier.nextPage(textController.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Divider(),
            TextField(
              controller: textController,
              decoration: searchInputHintTextStyle,
              cursorHeight: 50,
              style: textFieldStyle,
            ),
            const Divider(),
            Expanded(
              child: MovieList(
                movieNotifier: widget.movieNotifier,
                onMovieClick: (movie) {
                  // TODO: navigate to movie detail page
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    textController.dispose();
  }
}
