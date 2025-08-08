import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:mausam/constants.dart';

class NetworkService {
  getData(String cityName) async {
    var response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$kApiKey&units=metric"));
    var decodedData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return decodedData;
    } else {
      Fluttertoast.showToast(
          msg: 'Error getting data.',
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.red);
    }
  }
}
