import 'package:flutter/material.dart';
import 'package:moviewer/di/di.dart';
import 'package:moviewer/models/models.dart';
import 'package:moviewer/models/responses/responses.dart';
import 'package:moviewer/notifiers/movie_details_notifier.dart';
import 'package:provider/provider.dart';

class MovieDetailsWidget extends StatelessWidget {
  final Movie movie;

  const MovieDetailsWidget(this.movie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MovieDetailsNotifier(ServiceModuleDI().provideMovieService())..fetchMovieDetails(movie),
      child: Consumer<MovieDetailsNotifier>(
        builder: (context, notifier, child) {
          if (notifier.isFetching) {
            return const Center(child: CircularProgressIndicator());
          } else if (notifier.errorMessage.isNotEmpty) {
            return Center(child: Text(notifier.errorMessage));
          } else {
            final readableDetails = notifier.details?.getReadableDetails() ?? {};
            return ListView(
              children: [
                for (final key in readableDetails.keys)
                  ListTile(title: Text(key), subtitle: Text(readableDetails[key] ?? "Not found"))
              ],
            );
          }
        },
      ),
    );
  }
}

extension on MovieDetails {
  Map<String, String> getReadableDetails() {
    return {
      "Is Adult": adult ? "Yes" : "No",
      "Vote Average": voteAverage.toString(),
      "Vote Count": voteCount.toString(),
      "Release Date": releaseDate,
      "Runtime": runtime.toString(),
      "Status": "Released",
      "Original Language": originalLanguage,
      "Original Title": originalTitle,
      "Production Companies": productionCompanies.map((company) => company.name).join(", "),
      "Production Countries": productionCountries.map((country) => country.name).join(", "),
      "Spoken Languages": spokenLanguages.map((language) => language.name).join(", "),
      "Budget": budget.toString(),
      "Revenue": revenue.toString(),
    };
  }
}
