import 'package:flutter/material.dart';
import 'package:platform_maps_flutter/platform_maps_flutter.dart';

class OpenMapPlatform extends StatefulWidget {
  final double latitude;
  final double longitude;

  OpenMapPlatform({required this.latitude, required this.longitude});

  @override
  _OpenMapPlatformState createState() => _OpenMapPlatformState();
}

class _OpenMapPlatformState extends State<OpenMapPlatform> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlatformMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.latitude, widget.longitude),
          zoom: 16.0,
        ),
        markers: Set<Marker>.of([
          Marker(
            markerId: MarkerId('marker_1'),
            position: LatLng(widget.latitude, widget.longitude),
            consumeTapEvents: false,
          )
        ]),
        mapType: MapType.satellite,
        compassEnabled: true,
      ),
    );
  }
}
