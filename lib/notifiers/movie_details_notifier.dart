import 'package:flutter/material.dart';
import 'package:moviewer/models/models.dart';
import 'package:moviewer/models/responses/responses.dart';
import 'package:moviewer/services/services.dart';

class MovieDetailsNotifier extends ChangeNotifier {
  final MovieService service;

  MovieDetailsNotifier(this.service);

  MovieDetails? details;
  bool isFetching = false;
  String errorMessage = '';

  Future<void> fetchMovieDetails(Movie movie) async {
    isFetching = true;
    errorMessage = '';

    notifyListeners();

    try {
      final response = await service.getMovieDetails(movie.id.toString());
      if (response.isSuccess) {
        details = response;
      } else {
        errorMessage = response.errorMessage;
      }
    } catch (e, s) {
      errorMessage = e.toString();
      debugPrintStack(stackTrace: s);
    } finally {
      isFetching = false;
      notifyListeners();
    }
  }
}
