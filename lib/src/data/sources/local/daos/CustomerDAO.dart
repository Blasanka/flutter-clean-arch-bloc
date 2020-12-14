import 'package:customers_manager/src/data/sources/local/DbConfig.dart';
import 'package:customers_manager/src/data/sources/local/tables/CustomerTable.dart';
import 'package:customers_manager/src/domain/models/Customer.dart';
import 'package:sqflite/sqflite.dart';

class CustomerDAO{
  Database _db;

  Future getDbInstance() async => _db = await DbConfig().getInstance();

  Future<List<Customer>> readCustomers() async {
    List<Map> maps = await _db.query(CustomerTable.tableName);
    if (maps != null && maps.length > 0) {
      return maps.map<Customer>((row) => Customer.fromJson(row)).toList();
    } else {
      return [];
    }
  }

  Future<Customer> readCustomer(int id) async {
    List<Map> maps = await _db.query(CustomerTable.tableName,
        where: '${CustomerTable.columnId} = ?',
        whereArgs: [id]
    );

    if (maps.length > 0) {
      return Customer.fromJson(maps.first);
    }

    return null;
  }

  Future<bool> insert(Customer customer) async {
    return await _db.insert(CustomerTable.tableName, customer.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace) >
        -1;
  }

  Future<bool> update(int id, Customer customer) async {
    var count = await _db.update(
      CustomerTable.tableName,
      customer.toMap(),
      where: "${CustomerTable.columnId} = ?",
      whereArgs: [id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return count == 1;
  }

  Future<bool> delete(int id) async {
    var count = await _db.delete(
      CustomerTable.tableName,
      where: '${CustomerTable.columnId} = ?', whereArgs: [id],
    );
    return count == 1;
  }

  Future close() async => _db.close();
}