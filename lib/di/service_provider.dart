import 'package:moviewer/services/services.dart';

class ServiceProvider {
  static final _singletonInstance = ServiceProvider._internal();

  ServiceProvider._internal();

  factory ServiceProvider() => _singletonInstance;

  late final _movieDbApi = MovieDbApi();
  late final _removeMovieService = RemoteMovieService(_movieDbApi);
  late final MovieService _movieService = _removeMovieService;

  MovieDbApi provideMovieDbApi() => _movieDbApi;

  RemoteMovieService provideRemoteMovieService() => _removeMovieService;

  MovieService provideMovieService() => _movieService;
}
