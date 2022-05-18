import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ylla_harik/data/models/games.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper.internal();
  factory DbHelper() => _instance;

  DbHelper.internal();
  static Database? _db;

  Future<Database> createDatabase() async {
    if (_db != null) {
      return _db!;
    }

    //define the path to the database
    String path = join(await getDatabasesPath(), 'school.db');
    _db = await openDatabase(path, version: 1, onCreate: (Database db, int v) {
      //create tables

      db.execute(
          'create table games(id integer primary key autoincrement, title varchar(50), description varchar(255), numberOfPlayer integer ,image varchar(255) ,dateTime varchar(255))');
    });

    return _db!;
  }

  Future<int> createGames(Map<String, Object?> games) async {
    Database db = await createDatabase();
    //db.rawInsert('insert into courses value')
    return db.insert('games', games);
  }

  Future<List<Map<String, Object?>>> getAllCourses() async {
    Database db = await createDatabase();
    //db.rawQuery('select * from courses');
    return db.query('games');
  }

  Future<int> delete(int id) async {
    Database db = await createDatabase();
    return db.delete('games', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> gamesUpdate(Map<String, dynamic> games, int id) async {
    Database db = await createDatabase();

    return await db.update('games', games, where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Map<String, Object?>>> getOneCoures(int id) async {
    Database db = await createDatabase();
    return db.query('games', where: 'id = ?', whereArgs: [id]);
  }
}
