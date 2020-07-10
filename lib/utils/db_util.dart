import 'package:profe_study_case_flutter/models/assigned_mission_data.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  Future initDb() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, 'missions.db');

    return await openDatabase(dbPath, version: 1, onCreate: populateDb);
  }

  Future<void> populateDb(Database database, int version) async {
    await database.execute("CREATE TABLE AssignedMissionData ("
        "id INTEGER PRIMARY KEY,"
        "time TEXT,"
        "description TEXT,"
        "role TEXT,"
        "category TEXT"
        ")");
  }

  Future<List<AssignedMissionData>> getMissions() async {
    var dbClient = await db;
    var result = await dbClient.query("AssignedMissionData",
        columns: ["time", "description", "role", "category"]);

    return result.map((data) => AssignedMissionData.fromJson(data)).toList();
  }

  Future<int> insertMission(AssignedMissionData mission) async {
    var dbClient = await db;
    var result = await dbClient.insert("AssignedMissionData", mission.toJson());
    return result;
  }
}
