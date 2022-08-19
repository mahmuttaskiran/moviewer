import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moviewer/models/models.dart';
import 'package:moviewer/screens/movie_details/movie_details_widget.dart';
import 'package:moviewer/screens/movie_details/movie_overview_widget.dart';
import 'package:moviewer/screens/movies/movie.dart';

class MovieDetailsPage extends StatefulWidget {
  final Movie movie;

  const MovieDetailsPage(this.movie, {Key? key}) : super(key: key);

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(widget.movie.title),
                  background: CachedNetworkImage(
                    imageUrl: widget.movie.posterUrl,
                    fit: BoxFit.cover,
                    height: 200,
                    width: double.infinity,
                    errorWidget: (context, url, error) => MovieWidget.buildErrorWidget(),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const TabBar(
                      labelColor: Colors.black87,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(icon: Icon(Icons.info), text: "Overview"),
                        Tab(icon: Icon(Icons.list), text: "Details"),
                      ],
                    ),
                  ],
                ),
              ),
            ];
          },
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: TabBarView(
              children: [
                MovieOverview(movie: widget.movie),
                MovieDetailsWidget(widget.movie),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
