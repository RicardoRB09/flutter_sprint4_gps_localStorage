import 'package:f_gps_tracker/ui/app.dart';
import 'package:f_gps_tracker/ui/controllers/gps.dart';
import 'package:f_gps_tracker/ui/controllers/location.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(GpsController());
  Get.lazyPut(() => LocationController(), fenix: true);
  runApp(const GpsApp());
}
