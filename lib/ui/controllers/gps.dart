import 'package:f_gps_tracker/domain/use_cases/gps_manager.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class GpsController extends GetxController {
  Position? location;
  LocationAccuracyStatus? accuracy;

  Future<LocationPermission> get permissionStatus async =>
      await GpsManager.permissionStatus;

  Future<Position> get currentLocation async =>
      await GpsManager.currentLocation;

  Future<LocationAccuracyStatus> get locationAccuracy async =>
      await GpsManager.locationAccuracy;

  Future<LocationPermission> requestPermission() async {
    return await GpsManager.requestPermission();
  }
}
