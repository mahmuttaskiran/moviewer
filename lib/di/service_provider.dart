import 'package:moviewer/services/services.dart';

class ServiceProvider {
  static MovieDbApi provideMovieDbApi() => MovieDbApi();

  static RemoteMovieService provideRemoteMovieService() => RemoteMovieService(provideMovieDbApi());

  static MovieService provideMovieService() => provideRemoteMovieService();
}
