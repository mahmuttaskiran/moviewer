import 'package:moviewer/di/service_module.dart';
import 'package:moviewer/notifiers/movie_notifier.dart';

class MovieNotifierModule {
  static final _singletonInstance = MovieNotifierModule._internal();

  MovieNotifierModule._internal();

  factory MovieNotifierModule() => _singletonInstance;

  // it is a singleton for whole application module
  final _movieNotifier = MovieNotifier(ServiceModuleDI().provideMovieService());

  MovieNotifier provideMovieNotifier() => _movieNotifier;
}
