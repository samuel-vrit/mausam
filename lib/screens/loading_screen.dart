import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:mausam/screens/home_page.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
  }

  double longitude = 0;
  double latitude = 0;

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
      longitude = position.longitude;
      latitude = position.latitude;
    } catch (e) {
      print(e.toString());
    }
  }

  getWeatherData() async {
    await getLocation();

    var response = await get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=926a4b5abc0d7da83c707e29388f3e9d&units=metric"));
    var decodedData = jsonDecode(response.body);

    print("Status code :: ${response.statusCode}");

    print(decodedData['main']['temp']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              getWeatherData();
            },
            child: Text("Get weather data")),
      ),
    );
  }
}
