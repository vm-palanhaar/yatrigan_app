import 'package:sqflite/sqflite.dart';
import 'package:yatrigan/src/model/main/ir/rail_stations_mdl.dart';
import 'package:yatrigan/src/model/main/ir/trains_mdl.dart';

import 'ir_db.dart';

class IrCtrlDb {
  final IrDb _irDb = IrDb();

  // Get Railway Station List
  Future<RailStationsMdl> getRailStationsDb() async {
    List<String> stations = [];
    final db = await _irDb.getDatabase();
    final List<Map<String, dynamic>> maps =
        await db.query(_irDb.getIrRailStationsTable);
    if (maps.isNotEmpty) {
      stations = List.generate(
        maps.length,
        (i) {
          return maps[i]['station'];
        },
      );
      return RailStationsMdl(
        stations: stations,
      );
    }
    return RailStationsMdl(
      stations: [],
    );
  }

  // Post Railway Station List
  Future<void> postRailStationsDb({
    required RailStationsMdl stations,
  }) async {
    final db = await _irDb.getDatabase();
    await db.delete(
      _irDb.getIrRailStationsTable,
    );
    for (String station in stations.stations) {
      await db.insert(
        _irDb.getIrRailStationsTable,
        stations.toMapDb(station),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  // Get Trains List
  Future<TrainsMdl> getTrainsDb() async {
    List<String> trains = [];
    final db = await _irDb.getDatabase();
    final List<Map<String, dynamic>> maps =
        await db.query(_irDb.getIrTrainsTable);
    if (maps.isNotEmpty) {
      trains = List.generate(
        maps.length,
        (i) {
          return maps[i]['train'];
        },
      );
      return TrainsMdl(
        trains: trains,
      );
    }
    return TrainsMdl(
      trains: [],
    );
  }

  // Post Trains List
  Future<void> postTrainsDb({
    required TrainsMdl? trains,
  }) async {
    final db = await _irDb.getDatabase();
    await db.delete(
      _irDb.getIrTrainsTable,
    );
    for (String train in trains!.trains) {
      await db.insert(
        _irDb.getIrTrainsTable,
        trains.toMapDb(train),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  // Get Trains Recent Search List
  Future<Set<String>> getTrainsRsDb() async {
    List<String> trains = [];
    final db = await _irDb.getDatabase();
    final List<Map<String, dynamic>> maps =
        await db.query(_irDb.getIrTrainsRsTable);
    if (maps.isNotEmpty) {
      trains = List.generate(
        maps.length,
        (i) {
          return maps[i]['train'];
        },
      );
      return trains.toSet();
    }
    return trains.toSet();
  }

  // Post Train Recent Search
  Future<void> postTrainsRsDb({
    required String train,
  }) async {
    final db = await _irDb.getDatabase();
    await db.insert(
      _irDb.getIrTrainsRsTable,
      {'train': train},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Delete Train Recent Search
  Future<void> deleteTrainsRsDb({
    required Set<String> trains,
}) async {
    final db = await _irDb.getDatabase();
    for (String train in trains.toList()) {
      db.delete(
        _irDb.getIrTrainsRsTable,
        where: 'train = ?',
        whereArgs: [train],
      );
    }
  }
}
