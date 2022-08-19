import 'package:moviewer/models/models.dart';
import 'package:moviewer/notifiers/paginated/paginated.dart';
import 'package:moviewer/services/services.dart';

class MovieNotifier extends PaginatedListNotifier<Movie> {
  final MovieService _movieService;

  MovieNotifier(this._movieService);

  @override
  Future<void> fetchData() async {
    final movies = await _movieService.getMovies(pagination.query, pagination.page);
    if (movies.isSuccess) {
      state.setDataState(movies.results);
    } else {
      state.setErrorState(movies.errorMessage);
    }
    pagination.nextPage(movies.totalPages);
  }
}
