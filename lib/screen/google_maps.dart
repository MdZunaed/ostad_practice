import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  Location location = Location();
  late GoogleMapController mapController;
  Marker? marker;
  List<LatLng> polyLinesLatLng = [];
  Set<Polyline> polyLines = {};
  Set<Marker> markers = {};

  Future<void> grantLocationPermission() async {
    PermissionStatus permission = await location.hasPermission();
    if (permission == PermissionStatus.denied ||
        permission == PermissionStatus.deniedForever) {
      await location.requestPermission();
    }
  }

  Future<void> animateToUserLocation() async {
    //location.enableBackgroundMode(enable: true);
    LocationData currentLocation = await location.getLocation();
    await mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target:
                LatLng(currentLocation.latitude!, currentLocation.longitude!),
            zoom: 18)));
    setState(() {});
  }

  Future<void> updateUserLocation() async {
    Timer.periodic(const Duration(seconds: 10), (timer) async {
      LocationData lastLocation = await location.getLocation();
      setState(() {
        marker = Marker(
            markerId: const MarkerId("last location"),
            position: LatLng(lastLocation.longitude!, lastLocation.longitude!),
            icon: BitmapDescriptor.defaultMarker,
            consumeTapEvents: true,
            onTap: () {},
            infoWindow: InfoWindow(
              title: "My current location",
              snippet: "${lastLocation.latitude}, ${lastLocation.longitude}",
            ));
        polyLinesLatLng
            .add(LatLng(lastLocation.latitude!, lastLocation.longitude!));
        polyLines.add(Polyline(
          polylineId: const PolylineId("last location"),
          color: Colors.red,
          width: 3,
          points: polyLinesLatLng,
        ));
      });
    });
  }

  @override
  void initState() {
    super.initState();
    grantLocationPermission();
    animateToUserLocation();
    updateUserLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Real-Time Location Tracker")),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
            target: LatLng(23.807520589618566, 90.41831215498202), zoom: 14),
        mapType: MapType.hybrid,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        zoomControlsEnabled: true,
        zoomGesturesEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        markers: marker != null ? {marker!} : {},
        polylines: polyLines,
      ),
    );
  }
}
