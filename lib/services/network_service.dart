import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mausam/services/location_service.dart';
import 'package:http/http.dart' as http;

class NetworkService {
  Future<dynamic> getWeatherData() async {
    LocationService locationService = LocationService();
    var position = locationService.getLocation();

    try {
      var response = await http.get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?lat=${locationService.latitude}&lon=${locationService.longitude}&appid=926a4b5abc0d7da83c707e29388f3e9d&units=metric"));
      var decodedData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return decodedData;
      } else {
        Fluttertoast.showToast(
            msg: 'Error getting weather data.',
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red);
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.red);
    }
  }
}
