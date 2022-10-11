import 'package:f_gps_tracker/data/entities/location.dart';
import 'package:f_gps_tracker/domain/models/location.dart';
import 'package:f_gps_tracker/domain/repositories/hive_interface.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocationRepository extends DatabaseInterface {
  late Box _box;

  Box get box => _box;

  @override
  Future<Box> connectDatabase() async {
    await Hive.initFlutter();
    _box = await Hive.openBox('locations');
    return _box;
  }

  @override
  Future<void> insert({required Box box, required TrackedLocation data}) async {
    await box.put(data.uuid, data.record);
  }

  @override
  Future<TrackedLocation> read({required Box box, required String uuid}) async {
    final record = await box.get(uuid);
    return LocationEntity.fromRecord(record);
  }

  @override
  Future<List<TrackedLocation>> readRecords({required Box box}) async {
    final records = box.values.map((value) => Map<String, dynamic>.from(value));
    return records.map((record) => LocationEntity.fromRecord(record)).toList();
  }

  @override
  Future<void> update({required Box box, required TrackedLocation data}) async {
    await box.put(data.uuid, data.record);
  }

  @override
  Future<void> delete({required Box box, required String uuid}) async {
    await box.delete(uuid);
  }

  @override
  Future<void> clear({required Box box}) async {
    await box.clear();
  }
}
