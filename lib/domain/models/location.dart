import 'package:uuid/uuid.dart';

class TrackedLocation {
  final String _uuid, _precision;
  final double _latitude, _longitude;
  final DateTime _timestamp;

  TrackedLocation({
    required double latitude,
    required double longitude,
    required String precision,
    required DateTime timestamp,
    String? uuid,
  })  : _uuid = uuid ?? const Uuid().v4(),
        _latitude = latitude,
        _longitude = longitude,
        _precision = precision,
        _timestamp = timestamp;

  String get uuid => _uuid;

  double get latitude => _latitude;

  double get longitude => _longitude;

  String get precision => _precision;

  DateTime get timestamp => _timestamp;
}
