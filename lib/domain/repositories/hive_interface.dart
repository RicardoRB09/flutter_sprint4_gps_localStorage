import 'package:f_gps_tracker/domain/models/location.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

abstract class DatabaseInterface {
  Future<Box> connectDatabase();

  Future<void> insert({
    required Box box,
    required TrackedLocation data,
  });

  Future<void> update({
    required Box box,
    required TrackedLocation data,
  });

  Future<TrackedLocation> read({
    required Box box,
    required String uuid,
  });

  Future<List<TrackedLocation>> readRecords({
    required Box box,
  });

  Future<void> delete({
    required Box box,
    required String uuid,
  });

  Future<void> clear({
    required Box box,
  });
}
