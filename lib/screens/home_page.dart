import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.

    try {
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        print('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        print(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      var position = await Geolocator.getCurrentPosition();
      print(position.latitude);
      print(position.longitude);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: getLocation),
      body: Center(
        child: Text('This is homepage'),
      ),
    );
  }
}
