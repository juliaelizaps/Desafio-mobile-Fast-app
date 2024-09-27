import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../controller/home_controller.dart';
import '../components/address_list_component.dart';
import '../components/last_address_component.dart';
import '../components/empty_search_component.dart';
import '../../../routes/app_routes.dart';
import '../service/address_service.dart';
import '../repositories/api_repository.dart';
import '../repositories/local_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:geocoding/geocoding.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController controller;

  @override
  void initState() {
    super.initState();
    controller = HomeController(AddressService(
      apiRepository: ApiRepository(),
      localRepository: LocalRepository(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FastLocation'),
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              Navigator.pushNamed(context, Routes.history);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Digite o CEP',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: controller.setCep,
            ),
            SizedBox(height: 16),
            Observer(
              builder: (_) {
                if (controller.isLoading) {
                  return CircularProgressIndicator();
                } else if (controller.errorMessage.isNotEmpty) {
                  return Text(
                    controller.errorMessage,
                    style: TextStyle(color: Colors.red),
                  );
                } else if (controller.address != null) {
                  return LastAddressComponent(
                    address: controller.address!,
                    onRoute: () async {
                      // Obter coordenadas do endereço
                      List<Location> locations = await locationFromAddress(
                          '${controller.address!.logradouro}, ${controller.address!.localidade}');
                      if (locations.isNotEmpty) {
                        final location = locations.first;
                        final availableMaps = await MapLauncher.installedMaps;
                        if (availableMaps.isNotEmpty) {
                          availableMaps.first.showMarker(
                            coords: Coords(location.latitude, location.longitude),
                            title: controller.address!.logradouro,
                          );
                        }
                      }
                    },
                  );
                } else {
                  return EmptySearchComponent();
                }
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                controller.fetchAddress();
              },
              child: Text('Consultar'),
            ),
          ],
        ),
      ),
    );
  }
}
