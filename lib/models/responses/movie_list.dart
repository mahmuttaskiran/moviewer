import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:moviewer/models/movie.dart';
import 'package:moviewer/models/responses/base.dart';

class MovieListResponse extends BaseResponse {
  final int page;
  final int totalResults;
  final int totalPages;
  final List<Movie> results;

  MovieListResponse({
    required int status,
    required this.page,
    required this.totalResults,
    required this.totalPages,
    required this.results,
  }) : super(status: status);

  factory MovieListResponse.fromHttpResponse(http.Response response) {
    return MovieListResponse.fromJson(jsonDecode(response.body))
      ..status = response.statusCode
      ..error = response.reasonPhrase;
  }

  factory MovieListResponse.fromJson(Map<String, dynamic> json) {
    return MovieListResponse(
      status: json['status'],
      page: json['page'],
      totalResults: json['total_results'],
      totalPages: json['total_pages'],
      results: [for (var result in json['results']) Movie.fromMap(result)],
    );
  }
}
