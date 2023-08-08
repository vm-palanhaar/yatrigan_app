import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:sqflite/sqflite.dart';

class IrDb {
  static const String _databaseName = 'pspl_apk_ir.db';
  static const int _databaseVersion = 1;
  dynamic _database;

  // Railway Station List
  static const String _irRailStations = 'ir_railStation';
  get getIrRailStationsTable => _irRailStations;
  static const String _irRailStationsCreateTable = 'CREATE TABLE '
      '$_irRailStations(station TEXT)';

  // Train List
  static const String _irTrain = 'ir_train';
  get getIrTrainsTable => _irTrain;
  static const String _irTrainsCreateTable = 'CREATE TABLE '
      '$_irTrain(train TEXT)';

  // Train List Recent Search
  static const String _irTrainRs = 'ir_trainRs';
  get getIrTrainsRsTable => _irTrainRs;
  static const String _irTrainsRsCreateTable = 'CREATE TABLE '
      '$_irTrainRs(train TEXT)';
  static const String _irTrainsRsDeleteTable = 'DELETE TABLE $_irTrainRs';
  get getTrainsRsDeleteTable => _irTrainsRsDeleteTable;

  Future<Database> _createDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();
    _database = openDatabase(
      join(await getDatabasesPath(), _databaseName),
      onCreate: (db, version) async {
        await db.execute(_irRailStationsCreateTable);
        await db.execute(_irTrainsCreateTable);
        await db.execute(_irTrainsRsCreateTable);
      },
      version: _databaseVersion,
    );
    return _database;
  }

  Future<Database> getDatabase() async {
    if (_database != null) return _database;
    _database = await _createDatabase();
    return _database;
  }

  Future<void> deleteDatabase() async {
    if (_database != null) {
      final db = await getDatabase();
      db.delete(_irRailStationsCreateTable);
      db.delete(_irTrainsCreateTable);
      db.delete(_irTrainsRsCreateTable);
    }
    String path = await getDatabasesPath();
    databaseFactory.deleteDatabase(path);
  }
}
