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
  List<LatLng> polyLinesLatLng = [];
  Set<Polyline> polyLines = {};
  LocationData? userLocation;
  late StreamSubscription locationSubscription;

  Future<void> grantLocationPermission() async {
    PermissionStatus permission = await location.hasPermission();
    if (permission == PermissionStatus.denied ||
        permission == PermissionStatus.deniedForever) {
      await location.requestPermission();
    }
  }

  Future<void> animateToUserLocation() async {
    //location.enableBackgroundMode(enable: true);
    userLocation = await location.getLocation();
    await mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(
                userLocation?.latitude ?? 0, userLocation?.longitude ?? 0),
            zoom: 18)));
  }

  Future<void> updateUserLocation() async {
    Timer.periodic(const Duration(seconds: 10), (timer) async {
      locationSubscription = location.onLocationChanged.listen((locationData) {
        userLocation = locationData;
        setState(() {});
      });
      polyLinesLatLng.add(
          LatLng(userLocation?.latitude ?? 0, userLocation?.longitude ?? 0));
      polyLines.add(Polyline(
        polylineId: const PolylineId("last location"),
        color: Colors.red,
        width: 3,
        points: polyLinesLatLng,
      ));
      setState(() {});
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
        markers: {
          Marker(
              markerId: const MarkerId("User Location"),
              position: LatLng(
                  userLocation?.latitude ?? 0, userLocation?.longitude ?? 0),
              infoWindow: InfoWindow(
                  title: "My Current Location",
                  snippet:
                      "${userLocation?.latitude ?? ''} ${userLocation?.longitude ?? ''}")),
        },
        polylines: polyLines,
      ),
    );
  }
}
