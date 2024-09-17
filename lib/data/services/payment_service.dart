import 'package:exam_last/data/models/payment.dart';
import 'package:sqflite/sqflite.dart';

class SqlDb {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDb();
      return _db;
    } else {
      return _db;
    }
  }

  initialDb() async {
    String databasePath = await getDatabasesPath();
    String path = '$databasePath/operDatabaseExam.db';
    Database mydb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return mydb;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
  CREATE TABLE "payments"(
    id INTEGER ,
    amount INTEGER  NOT NULL,
    category TEXT NOT NULL,
    commnet TEXT NOT NULL,
    date INTEGER NOT NULL
  )
''');
  }
  Future<void> insertData(Payment payment) async {
    try {
      Database? mydb = await db;
      await mydb!.insert(
        'payments',
        payment.toMap(),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Map>> readData() async {
    Database? mydb = await db;
    List<Map> responce = await mydb!.rawQuery('SELECT * FROM payments');

    return responce;
  }

  

  Future<void> deleteData(int id) async {
    try {
      Database? mydb = await db;
      await mydb!.delete(
        'payments',
        where: "id = ?",
        whereArgs: [id],
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateData(int id, Payment payment) async {
    try {
      Database? mydb = await db;
      await mydb!.update(
        'payments',
        payment.toMap(),
        where: "id = ?",
        whereArgs: [id],
      );
    } catch (e) {
      rethrow;
    }
  }
}

// Future<void> insertData(
//       int amount, String category, String commnet, String date) async {
//     try {
//       Database? mydb = await db;
//       await mydb!.insert('payments', {
//         'amount': amount,
//         'category': category,
//         'comnet': commnet,
//         'date': date,
//       });
//     } catch (e) {
//       print('erroin when adding $e');
//       rethrow;
//     }
//   }






  