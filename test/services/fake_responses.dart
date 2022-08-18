import 'dart:convert';

final movieListResponse = jsonEncode({
  "page": 1,
  "total_results": 10000,
  "total_pages": 500,
  "results": [
    {
      "popularity": 6.812,
      "vote_count": 5,
      "video": false,
      "poster_path": "/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg",
      "id": 475557,
      "adult": false,
      "backdrop_path": "/n6bUvigpRFqSwmPp1m2YADdbRBc.jpg",
      "original_language": "en",
      "original_title": "Joker",
      "genre_ids": [80, 18, 53],
      "title": "Joker",
      "vote_average": 8.5,
      "overview":
          "During the 1980s, a failed stand-up comedian is driven insane and turns to a life of crime and chaos in Gotham City while becoming an infamous psychopathic crime figure.",
      "release_date": "2019-10-04"
    },
  ]
});

final movieDetailsResponse = jsonEncode({
  "adult": false,
  "backdrop_path": "/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg",
  "belongs_to_collection": null,
  "budget": 63000000,
  "genres": [
    {"id": 18, "name": "Drama"}
  ],
  "homepage": "http://www.foxmovies.com/movies/joker",
  "id": 475557,
  "imdb_id": "tt4154756",
  "original_language": "en",
  "original_title": "Joker",
  "overview":
      "During the 1980s, a failed stand-up comedian is driven insane and turns to a life of crime and chaos in Gotham City while becoming an infamous psychopathic crime figure.",
  "popularity": 46.868,
  "poster_path": "/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg",
  "production_companies": [
    {
      "id": 10275,
      "logo_path": "/7SZJ2dFvNecHWf2HemFvYkAnNc.png",
      "name": "Warner Bros. Pictures",
      "origin_country": "US"
    },
    {"id": 491, "logo_path": "/qZCc1lty5FzX30aOCVRBLnlfU7.png", "name": "Linear Pictures", "origin_country": "US"}
  ],
  "production_countries": [
    {"iso_3166_1": "US", "name": "United States of America"}
  ],
  "release_date": "2019-10-04",
  "revenue": 136906000,
  "runtime": 122,
  "spoken_languages": [
    {"iso_639_1": "en", "name": "English"}
  ],
  "status": "Released",
  "tagline": "A cold wind blows against the face of the earth.",
  "title": "Joker",
  "video": false,
  "vote_average": 8.5,
  "vote_count": 5,
});
