import 'package:sqflite/sqflite.dart';

import '../models/task_model.dart';

abstract class DBHelper {
  // 1- Create DB
  // 2- Create Table
  // 3- Open DB
  // 4- Insert to DB
  // 5- Update
  // 6- Remove
  static Database? db;
  static String tableName = 'Task';
  static int version = 3;

  static Future<void> initDB() async {
    try {
      // Initilaize DB path and Name
      String path = '${await getDatabasesPath()}TaskManager.db';

      db = await openDatabase(
        path,
        version: version,
        onCreate: (Database db, int version) async {
          // Create DB & Tabels by SQL
          await db.execute(
            'CREATE TABLE Task ('
            'id INTEGER PRIMARY KEY,'
            'todo TEXT,'
            'isCompleted INTEGER,'
            'userId INTEGER)',
          );

          print('Creating DB Successfully');
        },
      );
    } catch (erorr) {
      print(erorr.toString());
    }
  }

  static Future<int> delete(TaskModel task) async {
    print('Delete Called');
    return await db!.delete(tableName, where: 'id = ?', whereArgs: [task.id]);
  }

  static Future<int> deleteAll() async {
    print('Delete All Called');
    return await db!.delete(tableName);
  }

  static Future<int> insert(Map<String, dynamic> task) async {
    print('Insert Called');
    return await db!
        .insert(tableName, task, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> query() async {
    print('Query Called');
    return await db!.query(tableName);
  }

  static Future<int> updateCompelete(int id) async {
    print('Update Called');
    return await db!.rawUpdate(''' UPDATE $tableName 
      SET isCompleted = ?
      WHERE id = ?
    ''', [1, id]);
  }

  static Future<int> updateTask(int id) async {
    print('Update Called');
    return await db!.rawUpdate(''' UPDATE $tableName 
      SET isCompleted = ?
      WHERE id = ?
    ''', [0, id]);
  }
}
