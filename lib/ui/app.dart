import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'pages/permission/permission_page.dart';

class GpsApp extends StatelessWidget {
  const GpsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MinTic GPS Tracker',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color.fromRGBO(30, 38, 73, 1),
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const PermissionPage(),
    );
  }
}
