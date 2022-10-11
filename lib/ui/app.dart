import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'pages/permission/permission_page.dart';

class GpsApp extends StatelessWidget {
  const GpsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GPS Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PermissionPage(),
    );
  }
}
