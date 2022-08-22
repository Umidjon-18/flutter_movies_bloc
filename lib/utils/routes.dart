import 'package:flutter/material.dart';

import '../views/details_view.dart';
import '../views/home_view.dart';
import '../views/intro_view.dart';
import '../views/youtube_view.dart';

class Routes {
  static const String introPage = '/';
  static const String homePage = '/homePage';
  static const String detailPage = '/detailPage';
  static const String youtubePage = '/youtubePage';
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    try {
      Map<String, dynamic>? args =
          routeSettings.arguments as Map<String, dynamic>?;
      args ?? <String, dynamic>{};
      switch (routeSettings.name) {
        case introPage:
          return MaterialPageRoute(
            builder: (
              context,
            ) =>
                const IntroView(),
          );
          case homePage:
          return MaterialPageRoute(
            builder: (
              context,
            ) =>
                const HomeView(),
          );
        case detailPage:
          return MaterialPageRoute(
            builder: (
              context,
            ) =>
                DetailsView(
              movieId: args?['movieId'],
            ),
          );
        case youtubePage:
          return MaterialPageRoute(
            builder: (
              context,
            ) =>
                YoutubeView(
              movieId: args?['movieId'],
              movieName: args?['movieName'],
            ),
          );
        default:
          return MaterialPageRoute(builder: (context) => const HomeView());
      }
    } catch (e) {
      return MaterialPageRoute(builder: (context) => const HomeView());
    }
  }
}
