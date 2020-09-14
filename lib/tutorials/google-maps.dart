import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';


class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {

  // https://github.com/flutter/plugins/blob/master/packages/google_maps_flutter/google_maps_flutter/example/lib/place_marker.dart

  LocationData locationData;

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  /*
  Map<MarkerId, Marker> addMarkers() {

    Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

    final MarkerId markerId = MarkerId("101");

    // creating a new MARKER
    final Marker marker = Marker(
      position: LatLng(
          locationData.latitude,
          locationData.longitude
      ),
      onTap: () {
      },
    );

    markers[markerId] = marker;

    return markers;
  }
  */


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: fetchLocation,
        label: Text('My Current Location'),
        icon: Icon(Icons.gps_fixed),
      ),
    );
  }

  Future<void> _goToTheCurrentLocation() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  fetchLocation() async{

    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();

    // Logging :)
    //print("APPNAME Location: ${locationData.latitude}");
    //debugPrint('APPNAME: ${locationData.latitude}');

    _kLake = CameraPosition(
      target: LatLng(locationData.latitude, locationData.longitude),
      zoom: 12.0,
    );

    _goToTheCurrentLocation();
  }

}