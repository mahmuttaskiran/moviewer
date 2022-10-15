import 'package:flutter/material.dart';
import 'package:moviewer/models/models.dart';
import 'package:moviewer/notifiers/movie_notifier.dart';
import 'package:moviewer/screens/movie_details/movie_details_page.dart';
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
    widget.movieNotifier.addListener(_onMovieNotifierChange);
  }

  void _onMovieNotifierChange() {
    if (mounted) setState(() {});
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
            if (widget.movieNotifier.state.data.isEmpty && widget.movieNotifier.state.isFetching)
              const Expanded(child: Center(child: CircularProgressIndicator()))
            else if (widget.movieNotifier.state.data.isEmpty && !widget.movieNotifier.state.isFetching)
              buildEmptyState()
            else
              Expanded(
                child: MovieList(
                  movieNotifier: widget.movieNotifier,
                  onMovieClick: (movie) {
                    _navigationToMovieDetails(movie);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget buildEmptyState() {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.face, size: 150),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Find your favorite movie by typing in the search bar above.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigationToMovieDetails(Movie movie) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieDetailsPage(movie),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    textController.dispose();
    widget.movieNotifier.removeListener(_onMovieNotifierChange);
  }
}