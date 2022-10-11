// Es simplemente una manera de agregar funcionalidad a una clase existente.
import 'package:f_gps_tracker/domain/models/location.dart';

extension LocationEntity on TrackedLocation {
  static TrackedLocation fromRecord(Map<String, dynamic> record) {
    return TrackedLocation(
      uuid: record['uuid'],
      latitude: record['latitude'],
      longitude: record['longitude'],
      precision: record['precision'],
      timestamp: DateTime.parse(record['timestamp']),
    );
  }

  Map<String, dynamic> get record {
    return {
      "uuid": uuid,
      "latitude": latitude,
      "longitude": longitude,
      "precision": precision,
      "timestamp": timestamp.toIso8601String(),
    };
  }
}
