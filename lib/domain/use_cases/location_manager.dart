import 'package:f_gps_tracker/data/repositories/database.dart';

import '../models/location.dart';

abstract class LocationManager {
  static final LocationRepository _repository = LocationRepository();

  static Future<void> initialize() async {
    await _repository.connectDatabase();
  }

  static Future<void> save({
    required TrackedLocation location,
  }) async {
    await _repository.insert(box: _repository.box, data: location);
  }

  static Future<List<TrackedLocation>> getAll() async {
    return await _repository.readRecords(box: _repository.box);
  }

  static Future<void> update({required TrackedLocation location}) async {
    _repository.update(box: _repository.box, data: location);
  }

  static Future<void> delete({required TrackedLocation location}) async {
    _repository.delete(box: _repository.box, uuid: location.uuid);
  }

  static Future<void> deleteAll() async {
    _repository.clear(box: _repository.box);
  }
}
