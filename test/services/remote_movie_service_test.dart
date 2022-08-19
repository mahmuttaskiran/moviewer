import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import 'fake_responses.dart';
import 'utils.dart';

void main() {
  test("RemoteMovieService should return MovieListResponse", () async {
    final movieService = provideMovieService(
      provideMovieDbApi(
        provideMockClientWithResult(
          movieListResponse,
        ),
      ),
    );

    final response = await movieService.getMovies('', 1);

    assert(response.status == HttpStatus.ok);
    assert(response.results.length == 1);
  });

  test("RemoteMovieService should return MovieDetails", () async {
    final movieService = provideMovieService(
      provideMovieDbApi(
        provideMockClientWithResult(
          movieDetailsResponse,
        ),
      ),
    );

    final response = await movieService.getMovieDetails('1');

    assert(response.status == HttpStatus.ok);
    assert(response.homepage.isNotEmpty);
  });
}
