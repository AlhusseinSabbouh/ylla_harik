import 'package:flutter/material.dart';
import 'package:ylla_harik/data/models/games.dart';

import 'package:ylla_harik/presentation/screens/show_all_games.dart';
import 'package:ylla_harik/presentation/screens/home_screen.dart';
import 'package:ylla_harik/presentation/screens/add_new_game.dart';
import 'package:ylla_harik/presentation/screens/game_detail_page.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    final GlobalKey<ScaffoldState> key = GlobalKey();
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => HomeScreen(
            title: "home_screen",
            color: Color.fromARGB(255, 134, 105, 240),
          ),
        );

      case '/show_all_game':
        return MaterialPageRoute(
          builder: (context) => GamesPage(),
        );
      // case '/allGames':
      // return MaterialPageRoute(
      // builder: (context) => allGames(

      // ),
      // );
      case '/add_new_game':
        return MaterialPageRoute(
          builder: (context) => AddNewGames(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(
            title: "Home Screen",
            color: Colors.blueAccent,
          ),
        );
    }
  }
}
