import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:moviewer/models/models.dart';
import 'package:moviewer/models/responses/base.dart';

class MovieDetails extends BaseResponse {
  final bool adult;
  final String backdropPath;
  final int budget;
  final List<Genre> genres;
  final String homepage;
  final int id;
  final String? imdbId;
  final String originalLanguage;
  final String originalTitle;
  final String? overview;
  final double popularity;
  final String? posterPath;
  final String releaseDate;
  final int revenue;
  final int? runtime;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;
  final List<ProductionCompany> productionCompanies;
  final List<ProductionCountry> productionCountries;
  final List<SpokenLanguage> spokenLanguages;

  MovieDetails({
    required int status,
    required this.adult,
    required this.backdropPath,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    required this.productionCompanies,
    required this.productionCountries,
    required this.spokenLanguages,
  }) : super(status: status);

  factory MovieDetails.fromHttpResponse(http.Response response) {
    return MovieDetails.fromJson(jsonDecode(response.body))
      ..status = response.statusCode
      ..error = response.reasonPhrase;
  }

  factory MovieDetails.fromJson(Map<String, dynamic> json) {
    return MovieDetails(
      status: json['status'],
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      budget: json['budget'],
      genres: [for (var genre in json['genres']) Genre.fromMap(genre)],
      homepage: json['homepage'],
      id: json['id'],
      imdbId: json['imdb_id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      revenue: json['revenue'],
      runtime: json['runtime'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
      productionCompanies: [
        for (var productionCompany in json['production_companies']) ProductionCompany.fromMap(productionCompany)
      ],
      productionCountries: [
        for (var productionCountry in json['production_countries']) ProductionCountry.fromMap(productionCountry)
      ],
      spokenLanguages: [for (var spokenLanguage in json['spoken_languages']) SpokenLanguage.fromMap(spokenLanguage)],
    );
  }
}
