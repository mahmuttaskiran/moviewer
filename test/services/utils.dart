import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:moviewer/services/services.dart';

MockClient provideMockClientWithResult(String responseBody, [int statusCode = HttpStatus.ok]) =>
    MockClient((request) async {
      return http.Response(responseBody, 200);
    });

MovieDbApi provideMovieDbApi(http.Client client) => MovieDbApi(client);

MovieService provideMovieService(MovieDbApi movieDbApi) => RemoteMovieService(movieDbApi);
