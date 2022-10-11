import 'package:f_gps_tracker/device/gps.dart';
import 'package:geolocator/geolocator.dart';

abstract class GpsManager {
  static final _gpsService = GpsSensor();

  static Future<LocationPermission> get permissionStatus async =>
      await _gpsService.permissionStatus;

  static Future<Position> get currentLocation async =>
      await _gpsService.currentLocation;

  static Future<LocationAccuracyStatus> get locationAccuracy async =>
      await _gpsService.locationAccuracy;

  static Future<LocationPermission> requestPermission() async {
    return await _gpsService.requestPermission();
  }
}
