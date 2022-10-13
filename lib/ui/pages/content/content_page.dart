import 'package:f_gps_tracker/domain/models/location.dart';
import 'package:f_gps_tracker/ui/controllers/gps.dart';
import 'package:f_gps_tracker/ui/controllers/location.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContentPage extends GetView<LocationController> {
  late final GpsController gpsController = Get.find();

  ContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 7.0),
          child: Image(
            image: AssetImage('assets/images/icon.png'),
          ),
        ),
        title: const Text(
          "MinTic - GPS Tracker",
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: controller.getAll(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        late final TrackedLocation data;
                        // TODO 1. Obten la ubicacion actual con gpsController.currentLocation
                        gpsController.currentLocation.then(
                          (locationData) => {
                            // TODO 2. Obten la precision de la lectura con gpsController.locationAccuracy.
                            gpsController.locationAccuracy.then(
                              (accuracyData) => {
                                // TODO 3. Crea un objeto [TrackedLocation] con fecha actual [DateTime.now] y la precisio como texto [accuracy.name]
                                data = TrackedLocation(
                                    latitude: locationData.latitude,
                                    longitude: locationData.longitude,
                                    precision: accuracyData.name,
                                    timestamp: DateTime.now()),
                                // TODO 4. con el [controller] guarda ese objeto [saveLocation]
                                controller.saveLocation(location: data),
                                //print(controller.locations),
                              },
                            ),
                          },
                        );
                      },
                      child: const Text(
                        "Registrar Ubicacion",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Obx(
                      () => ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.all(8),
                        itemCount: controller.locations.length,
                        itemBuilder: (context, index) {
                          final location = controller.locations[index];
                          return Card(
                            child: ListTile(
                              tileColor: Colors.indigo.shade50,
                              isThreeLine: true,
                              leading: Container(
                                height: double.infinity,
                                child: const Icon(
                                  Icons.gps_fixed_rounded,
                                  color: Color.fromRGBO(30, 38, 73, 1),
                                  size: 28,
                                ),
                              ),
                              title: Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, bottom: 4),
                                child: Text(
                                  'Lat: ${location.latitude}, \nLong: ${location.longitude}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              subtitle: Padding(
                                padding:
                                    const EdgeInsets.only(top: 4, bottom: 8),
                                child: Text(
                                    'Fecha: ${location.timestamp.toIso8601String()}\nPrecisión: ${location.precision.toUpperCase()}'),
                              ),
                              trailing: Container(
                                height: double.infinity,
                                child: IconButton(
                                  enableFeedback: true,
                                  onPressed: () {
                                    // TODO elimina la ubicacion [location] usando el controlador [deleteLocation]
                                    controller.deleteLocation(
                                        location: location);
                                  },
                                  icon: const Icon(
                                    Icons.delete_forever_rounded,
                                    color: Colors.red,
                                    size: 28,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (_, __) =>
                            const SizedBox(height: 8.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        // TODO elimina todas las ubicaciones usando el controlador [deleteAll]
                        controller.deleteAll();
                      },
                      child: const Text(
                        "Eliminar Todos",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
