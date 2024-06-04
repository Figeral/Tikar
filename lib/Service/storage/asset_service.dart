import 'package:sqflite/sqflite.dart';
import 'package:tikar/Service/storage/database.dart';

/// Saving fetched items from api and reading all and specified items from local storage  g

class AssetDbProvider {
  Future<void> saveAll(List<dynamic> data) async {
    final db = await DbProvider().tikarDb;
    for (var item in data) {
      await db.insert("asset", item,
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
    print("fetched data from api saved ...");
  }

  Future<List<dynamic>> readAllItems() async {
    final db = await DbProvider().tikarDb;
    return await db.query("asset", orderBy: "id");
  }

  Future<List<dynamic>> readItemByCity(String city) async {
    final db = await DbProvider().tikarDb;
    return await db.query("asset", where: "ville = ?", whereArgs: [city]);
  }

  Future<List<dynamic>> readItemByType(String type) async {
    final db = await DbProvider().tikarDb;
    return await db.query("asset",
        where: "assetType=?", whereArgs: [type], having: type);
  }

  Future<List<dynamic>> readItemByLessor(int id) async {
    final db = await DbProvider().tikarDb;
    return await db.query("asset", where: "lessor_id =?", whereArgs: [id]);
  }

  Future<List<dynamic>> readItemByMatricule(int matricule) async {
    final db = await DbProvider().tikarDb;
    return await db
        .query("asset", where: "matricule =?", whereArgs: [matricule]);
  }

  Future<List<dynamic>> readItemByActif(bool state) async {
    final db = await DbProvider().tikarDb;
    return await db.query("asset", where: "active =?", whereArgs: [state]);
  }
}
