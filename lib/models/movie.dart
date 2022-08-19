
class Movie {
  final String? posterPath;
  final bool adult;
  final String overview;
  final String releaseDate;
  final List<int> genreIds;
  final int id;
  final String originalTitle;
  final String originalLanguage;
  final String title;
  final String? backdropPath;
  final double popularity;
  final int voteCount;
  final bool video;
  final num voteAverage;

  Movie({
    required this.posterPath,
    required this.adult,
    required this.overview,
    required this.releaseDate,
    required this.genreIds,
    required this.id,
    required this.originalTitle,
    required this.originalLanguage,
    required this.title,
    required this.backdropPath,
    required this.popularity,
    required this.voteCount,
    required this.video,
    required this.voteAverage,
  });

  factory Movie.fromMap(Map<String, dynamic> map) => Movie(
        posterPath: map['poster_path'],
        adult: map['adult'],
        overview: map['overview'],
        releaseDate: map['release_date'],
        genreIds: List<int>.from(map['genre_ids']),
        id: map['id'],
        originalTitle: map['original_title'],
        originalLanguage: map['original_language'],
        title: map['title'],
        backdropPath: map['backdrop_path'],
        popularity: map['popularity'],
        voteCount: map['vote_count'],
        video: map['video'],
        voteAverage: map['vote_average'],
      );
}
