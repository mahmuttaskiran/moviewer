import 'package:http/http.dart' as http;
import 'package:moviewer/services/services.dart';

class ServiceProvider {
  static final _singletonInstance = ServiceProvider._internal();

  ServiceProvider._internal();

  factory ServiceProvider() => _singletonInstance;

  late final _movieDbApi = MovieDbApi(provideHttpClient());
  late final _removeMovieService = RemoteMovieService(_movieDbApi);
  late final MovieService _movieService = _removeMovieService;

  http.Client provideHttpClient() => http.Client();

  MovieDbApi provideMovieDbApi() => _movieDbApi;

  RemoteMovieService provideRemoteMovieService() => _removeMovieService;

  MovieService provideMovieService() => _movieService;
}
