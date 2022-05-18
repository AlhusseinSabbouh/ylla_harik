import 'package:ylla_harik/data/dataProvider/games/games_local_data_base_helper.dart';
import 'package:ylla_harik/data/models/games.dart';

class GamesLocalDataProvider {
  List<Map<String, Object?>> coursesRaw = [];
  Map<String, Object?> courseRaw = {};
  DbHelper db_helper = new DbHelper();

  Future<int> createGames(Map<String, Object?> games) async {
    return await db_helper.createGames(games);
  }

  Future<List<Map<String, Object?>>> getAllGames() async {
    return await db_helper.getAllCourses();
  }

  Future<List<Map<String, Object?>>> getOneGamesById(int id) async {
    return await db_helper.getOneCoures(id);
  }

  Future<int> updateGames(Map<String, dynamic> games, int id) async {
    return await db_helper.gamesUpdate(games, id);
  }

  Future<int> deleteGamesById(int id) async {
    return await db_helper.delete(id);
  }
}
