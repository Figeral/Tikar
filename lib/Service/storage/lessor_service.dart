import 'package:sqflite/sqflite.dart';
import 'package:tikar/Service/storage/database.dart';

/// Saving fetched items from api and reading all and specified items from local storage  g

class LessorDbProvider {
  Future<void> saveAll(List<dynamic> data) async {
    final db = await DbProvider().tikarDb;
    print(" in the SaveAll method");
    for (var item in data) {
      // Convert boolean values to integers
      final Map<String, dynamic> itemWithIntValues = {};
      item.forEach((key, value) {
        if (value is bool) {
          itemWithIntValues[key] = value ? 1 : 0;
        } else {
          itemWithIntValues[key] = value;
        }
      });

      await db.insert("lessor", itemWithIntValues,
          conflictAlgorithm: ConflictAlgorithm.replace);
    }

    print("fetched data from api saved ...");
  }

  Future<List<dynamic>> readAllItems() async {
    final db = await DbProvider().tikarDb;
    return await db.query("lessor", orderBy: "id");
  }

  Future<List<dynamic>> readItemfname(String fname) async {
    final db = await DbProvider().tikarDb;
    return await db.query("lessor", where: "fname = ?", whereArgs: [fname]);
  }

  Future<List<dynamic>> readItemBylname(String lname) async {
    final db = await DbProvider().tikarDb;
    return await db.query("lessor",
        where: "lname=?", whereArgs: [lname], having: lname);
  }

  Future<List<dynamic>> readItemByContact(int tel) async {
    final db = await DbProvider().tikarDb;
    return await db.query("lessor", where: "contact =?", whereArgs: [tel]);
  }

  Future<List<dynamic>> readItemByActif(bool state) async {
    final db = await DbProvider().tikarDb;
    return await db.query("lessor", where: "active =?", whereArgs: [state]);
  }
}
