import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mausam/constants.dart';
import 'package:mausam/services/location_service.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  Future getWeatherByCityName(String cityName) async {
    LocationService locationService = LocationService();
    await locationService.getLocation();

    try {
      var response = await http.get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$kApiKey&units=metric"));
      var decodedData = jsonDecode(response.body);
      print(locationService.latitude);
      print(locationService.longitude);

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

  Future<dynamic> getWeatherData() async {
    LocationService locationService = LocationService();
    await locationService.getLocation();

    try {
      var response = await http.get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?lat=${locationService.latitude}&lon=${locationService.longitude}&appid=$kApiKey&units=metric"));
      var decodedData = jsonDecode(response.body);
      print(locationService.latitude);
      print(locationService.longitude);

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
