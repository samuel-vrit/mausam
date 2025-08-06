import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  double longitude = 0;
  double latitude = 0;

  getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.

    try {
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        Fluttertoast.showToast(
            msg: 'Location services are disabled.',
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red);
        // print('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          Fluttertoast.showToast(
              msg: 'Location permissions are denied',
              timeInSecForIosWeb: 3,
              backgroundColor: Colors.red);
          // print('Location permissions are denied');
        }
      }

      var position = await Geolocator.getCurrentPosition();
      longitude = position.longitude;
      latitude = position.latitude;
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.red);
      // print(e.toString());
    }
  }
}
