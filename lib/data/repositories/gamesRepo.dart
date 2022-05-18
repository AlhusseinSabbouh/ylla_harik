import 'package:ylla_harik/data/dataProvider/games/games_local_data_base.dart';
import 'package:ylla_harik/data/models/games.dart';

class GamesRepo {
  final GamesLocalDataProvider gamesLocalDataProvider =
      GamesLocalDataProvider();

  Future<GamesModel> getGamesById(int id) async {
    final List<Map<String, Object?>> game =
        await gamesLocalDataProvider.getOneGamesById(id);
    final GamesModel gamesModel = GamesModel.fromJson(game[0]);
    return gamesModel;
  }

  Future<List<GamesModel>> getAllGames() async {
    final List<Map<String, Object?>> game =
        await gamesLocalDataProvider.getAllGames();

    final List<GamesModel> gamesModel =
        game.map((gamesRaw) => GamesModel.fromJson(gamesRaw)).toList();
    return gamesModel;
  }

  Future updateGamesById(GamesModel gamesModel) async {
    final int gamesIdUpdated = await gamesLocalDataProvider.updateGames(
        gamesModel.toJSON(), gamesModel.id);
    return gamesIdUpdated;
  }

  Future deleteGamesById(int id) async {
    final int gamesIdDeleted = await gamesLocalDataProvider.deleteGamesById(id);
    return gamesIdDeleted;
  }

  Future createNewGames(GamesModel gamesModel) async {
    final int gamesIdCreated =
        await gamesLocalDataProvider.createGames(gamesModel.toJSON());
    return gamesIdCreated;
  }

  List<Map<String, Object?>> sortedGameByAlphabet(
      List<Map<String, Object?>> games) {
    List<Map<String, Object?>> game1 = games;
    String a1 = '';
    String handles = '';
    for (int i = 0; i < game1.length - 1; i++) {
      for (int j = 0; j < game1.length - 1; j++) {
        a1 = game1[j]['title'] as String;
        // final String a2 = game[j + 1]['title'] as String;
        if (a1.compareTo(game1[j + 1]['title'] as String) < 0) {
          handles = game1[j]['title'] as String;
          game1[j]['title'] = game1[j + 1]['title'];
          game1[j + 1]['title'] = handles;
          // print(a1);
        }
      }
    }
    return games;
  }
}
    // for (int i = 0; i < game.length - 1; i++) {
    //   for (int j = 0; j < game.length - 1; j++) {

    //     a1 = game[j]['title'] as String;
    //     // final String a2 = game[j + 1]['title'] as String;
    //     if (a1.compareTo(game[j + 1]['title'] as String) < 0) {
    //       handles = game[j]['title'] as String;
    //       game[j]['title'] = game[j + 1]['title'];
    //       game[j + 1]['title'] = handles;
    //       print(a1);
    //     }
    //   }
    // }