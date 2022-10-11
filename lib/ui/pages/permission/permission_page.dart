import 'package:f_gps_tracker/ui/controllers/gps.dart';
import 'package:f_gps_tracker/ui/controllers/location.dart';
import 'package:f_gps_tracker/ui/pages/content/content_page.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class PermissionPage extends StatefulWidget {
  const PermissionPage({Key? key}) : super(key: key);

  @override
  State<PermissionPage> createState() => _LocationState();
}

class _LocationState extends State<PermissionPage> {
  late GpsController controller;
  late Future<LocationPermission> _permissionStatus;

  @override
  void initState() {
    super.initState();
    controller = Get.find();
    // TODO: Asigna a _permissionStatus el futuro que obtiene el estado de los permisos.;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GPS Tracker"),
      ),
      body: FutureBuilder<LocationPermission>(
        future: _permissionStatus,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            final status = snapshot.data!;
            if (status == LocationPermission.always ||
                status == LocationPermission.whileInUse) {
              Get.find<LocationController>().initialize().then(
                    (value) => WidgetsBinding.instance.addPostFrameCallback(
                      (_) => Get.offAll(() => ContentPage()),
                    ),
                  );
              /* TODO: Busca el controlador de ubicacion [LocationController] con [Get.find],
               inicializalo [initialize] y cuando el futuro se complete [then] usando [WidgetsBinding.instance.addPostFrameCallback]
               navega usando [Get.offAll] a [ContentPage] */

              // TODO: Mientras el futuro se completa muestra un CircularProgressIndicator
            } else if (status == LocationPermission.unableToDetermine ||
                status == LocationPermission.denied) {
              return Center(
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        // TODO: Actualiza el futuro _permissionStatus con requestPermission
                        // TODO: y setState para que el FutureBuilder vuelva a renderizarse.
                      });
                    },
                    child: const Text("Solicitar Permisos")),
              );
            } else {
              // TODO: Muestra un texto cuando el usuario a denegado el permiso permanentemente
            }
          } else if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasError) {
            // TODO: Muestra un texto con el error si ocurre.
          } else {
            // TODO: Mientras el futuro se completa muestra un CircularProgressIndicator
          }
        },
      ),
    );
  }
}
