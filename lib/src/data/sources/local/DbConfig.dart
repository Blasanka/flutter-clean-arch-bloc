import 'package:customers_manager/src/data/sources/local/tables/CustomerTable.dart';
import 'package:sqflite/sqflite.dart';

class DbConfig {
  Database _db;
  int _dbVersion = 1;
  String _dbName = 'manager_db.db';

  Future<Database> getInstance() async {
    _db = await openDatabase(_dbName,
        version: _dbVersion, onCreate: populateDb);
    return _db;
  }

  void populateDb(Database db, int version) async {
    await _createCustomerTable(db);
  }

  _createCustomerTable(Database db) async {
    await db
        .execute(CustomerTable.create())
        .then((_) => print('creating table customers...'))
        .catchError((e) => print('error creating customers table: $e'));
  }

  close() async {
    await _db.close();
  }

  // Future<Database> createDatabase() async {
  //   String databasesPath = await getDatabasesPath();
  //   String dbPath = join(databasesPath, _dbName);
  //
  // }
}