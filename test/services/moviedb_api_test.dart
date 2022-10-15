import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:moviewer/services/services.dart';

void main() {
  test("MovieDbApi should return http.Response", () async {
    final mockHttpClient = MockClient((request) async {
      return http.Response('', HttpStatus.ok);
    });

    final movieDbApi = MovieDbApi(mockHttpClient);

    final response = await movieDbApi.get('movie/popular');

    assert(response.statusCode == HttpStatus.ok);
  });
}
