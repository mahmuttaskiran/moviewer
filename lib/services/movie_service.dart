import 'package:moviewer/models/responses/responses.dart';

mixin MovieService {
  Future<MovieListResponse> getMovies(String query, int page);

  Future<MovieDetails> getMovieDetails(String movieId);
}
