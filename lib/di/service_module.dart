import 'package:http/http.dart' as http;
import 'package:moviewer/services/services.dart';

class ServiceModuleDI {
  static final _singletonInstance = ServiceModuleDI._internal();

  ServiceModuleDI._internal();

  factory ServiceModuleDI() => _singletonInstance;

  late final _movieDbApi = MovieDbApi(provideHttpClient());
  late final _removeMovieService = RemoteMovieService(_movieDbApi);
  late final MovieService _movieService = _removeMovieService;

  http.Client provideHttpClient() => http.Client();

  MovieDbApi provideMovieDbApi() => _movieDbApi;

  RemoteMovieService provideRemoteMovieService() => _removeMovieService;

  MovieService provideMovieService() => _movieService;
}
