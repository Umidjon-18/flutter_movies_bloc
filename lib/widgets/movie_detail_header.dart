import 'package:flutter/material.dart';

import '../models/detail_model.dart';
import '../utils/routes.dart';
import 'arc_banner_image.dart';
import 'poster.dart';
import 'rating_info.dart';

class MovieDetailHeader extends StatelessWidget {
  const MovieDetailHeader(this.movie, {Key? key}) : super(key: key);

  final DetailModel movie;

  _buildCategoryChips(TextTheme textTheme) {
    return movie.genres!.map((genres) {
      return Chip(
        label: Text(genres.name ?? ""),
        labelStyle: textTheme.caption,
        backgroundColor: Colors.black12,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    var movieInformation = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(
            movie.title ?? "",
            style: textTheme.titleMedium!
                .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: RatingInformation(movie),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            direction: Axis.horizontal,
            children: _buildCategoryChips(textTheme),
          ),
        )
      ],
    );

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 240.0),
          child: ArcBannerImage(
              "https://image.tmdb.org/t/p/w500/${movie.backdropPath}",
              movie.id.toString(),
              null),
        ),
        Positioned(
          bottom: 32.0,
          left: 16.0,
          right: 16.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 70.0),
                child: Poster(
                  "https://image.tmdb.org/t/p/w500/${movie.posterPath}",
                  height: 190.0,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                  ),
                  child: movieInformation,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 25.0,
          left: 25.0,
          right: 16.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes.youtubePage,
                    arguments: {
                      "movieId": movie.id.toString(),
                      "movieName": movie.title,
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 150.0, left: 30),
                  child: Center(
                    child: Material(
                      shadowColor: Colors.black,
                      color: Colors.transparent,
                      elevation: 100.0,
                      child: Icon(
                        Icons.play_arrow,
                        shadows: [
                          Shadow(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              blurRadius: 50),
                          Shadow(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              blurRadius: 50),
                          Shadow(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              blurRadius: 50),
                        ],
                        size: 50,
                      ),
                    ),
                  ),
                ),
              ),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
