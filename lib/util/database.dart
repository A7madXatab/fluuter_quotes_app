import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;


class Quotes { 
  static Future<sql.Database> _connect()async {
    final databasePath= await sql.getDatabasesPath();

    return await sql.openDatabase(path.join(databasePath, 'quote.db'), onCreate: (database, verion) {
      return database.execute('CREATE TABLE quotes(id TEXT NOT NULL,quote TEXT NOT NULL ,author VARCHAR(255) NOT NULL, date VARCHAR(255) NOT NULL, image TEXT)');
    }, version: 1);
  }

  static Future<void> insert(String table, Map<String, Object> values) async{
    final database= await Quotes._connect();

    return database.insert(table, values, conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> all() async {
    final database= await Quotes._connect();

    return database.query('quotes');
  }

  static Future<void> deleteWhere(String id)async {
    final database= await Quotes._connect();

    return database.delete('quotes', where: 'id=?', whereArgs: [id]);
  }

  static Future<List<Map<String, dynamic>>> authors() async{
    final database= await Quotes._connect();

    return database.query('quotes', columns: ['author'], distinct: true);
  }

  static Future<List<Map<String, dynamic>>> quotesOf(String authorName) async {
    final database= await Quotes._connect();

    return database.query('quotes', where: 'author=?', whereArgs: [authorName]);
  }
}