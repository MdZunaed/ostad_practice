import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  Completer<GoogleMapController> mapController = Completer();
  late LatLng? onTapLatLng;
  final initialPosition = const CameraPosition(
      target: LatLng(23.674864963231546, 90.47866518466321), zoom: 14);
  List<Marker> markers = [
    Marker(
        markerId: MarkerId("bhuigor"),
        position: LatLng(23.690079231225063, 90.47814031459566)),
    Marker(
        markerId: MarkerId("delpara"),
        position: LatLng(23.66599759026365, 90.47950051724911)),
  ];
  List<Polygon> polygons = [
    Polygon(
        polygonId: const PolygonId("bhuigor"),
        fillColor: Colors.transparent,
        strokeColor: Colors.red.shade100,
        strokeWidth: 2,
        consumeTapEvents: true,
        onTap: () {
          log('bhuigor');
        },
        points: const [
          LatLng(23.690802978956047, 90.4768156260252),
          LatLng(23.69146767867288, 90.47784961760044),
          LatLng(23.69123127315668, 90.47947838902473),
          LatLng(23.68988498163607, 90.47974560409784),
          LatLng(23.68860591507858, 90.4797026887536),
          LatLng(23.688166559272947, 90.477837882936),
          LatLng(23.68924544992331, 90.47659702599049)
        ]),
  ];
  List<Circle> circles = [
    Circle(
        circleId: const CircleId("delpara"),
        fillColor: Colors.transparent,
        strokeColor: Colors.red.shade100,
        strokeWidth: 2,
        onTap: () {
          log("delpara");
        },
        center: const LatLng(23.66599759026365, 90.47950051724911),
        radius: 150),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Google Map")),
      body: GoogleMap(
        initialCameraPosition: initialPosition,
        mapType: MapType.hybrid,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        zoomControlsEnabled: true,
        zoomGesturesEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          mapController.complete(controller);
        },
        onTap: (LatLng latLng) {
          log(latLng.toString());
          onTapLatLng = latLng;
          setState(() {});
        },
        markers: Set.of(markers),
        polygons: Set.of(polygons),
        circles: Set.of(circles),
      ),
    );
  }

  void showSnackMessage(text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}
