import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_simulador_parcela/app/controllers/map/map_controller.dart';
import 'package:flutter_simulador_parcela/app/models/map/currentLocation.dart';
import 'package:flutter_simulador_parcela/app/shared/services/geolocator_services.dart';
import 'package:flutter_simulador_parcela/app/views/page_template.dart';
import 'package:geolocator/geolocator.dart';

class MapScreen extends StatefulWidget {
  String? menuId;

  MapScreen({this.menuId});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  CurrentLocation currentLocation = new CurrentLocation();

  LocationService location = new LocationService();

  @override
  void initState() {
    _loadCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return templatePage(
        selectedItemMenuId: widget.menuId,
        columnSliverContentPage: Column(
          children: [
            FutureBuilder(
                future: _loadCurrentLocation(),
                builder: (context, snapshot) {
                  if (snapshot.hasData)
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              "Localização da sua estação:",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w700),
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            child: Text(currentLocation.street.toString(),
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500)),
                          ),
                          SizedBox(height: 10),
                          Container(
                              child: Text(currentLocation.district.toString(),
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500))),
                          SizedBox(height: 5),
                          Container(
                            child: Text(
                                currentLocation.city.toString() +
                                    " - " +
                                    currentLocation.state.toString(),
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500)),
                          ),
                          SizedBox(height: 20),
                          Container(
                            width: 200,
                            height: 40,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                openMapLancher(
                                    latitude: currentLocation.latitude!,
                                    longitude: currentLocation.longitude!,
                                    city: currentLocation.city!);
                              },
                              icon: Icon(Icons.room),
                              label: Text(
                                "Ver no mapa",
                                style: TextStyle(fontSize: 16.0),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.blue, elevation: 3),
                            ),
                          )
                        ],
                      ),
                    );
                  else
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(child: CircularProgressIndicator()),
                        ],
                      ),
                    );
                }),
          ],
        ));
  }

  _loadCurrentLocation() async {
    return await location
        .getCurrentLocation()
        .then((value) => currentLocation = value);
  }
}
