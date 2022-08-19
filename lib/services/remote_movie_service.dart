import 'package:moviewer/models/responses/responses.dart';
import 'package:moviewer/services/services.dart';

class RemoteMovieService with MovieService {
  final MovieDbApi _movieDbApi;

  RemoteMovieService(this._movieDbApi);

  @override
  Future<MovieDetails> getMovieDetails(String movieId) async {
    final response = await _movieDbApi.get('movie/$movieId');
    return MovieDetails.fromHttpResponse(response);
  }

  @override
  Future<MovieListResponse> getMovies(String query, int page) async {
    final response = await _movieDbApi.get('search/movie', body: {'query': query, 'page': page.toString()});
    return MovieListResponse.fromHttpResponse(response);
  }
}
