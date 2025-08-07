import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:mausam/screens/home_page.dart';
import 'package:mausam/services/network_service.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    NetworkService networkService = NetworkService();
    var weatherData = await networkService.getWeatherData();

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitWave(
              color: Color(0xff48CAE4),
            ),
            SizedBox(height: 20),
            Text("Getting weather data..."),
          ],
        ),
      ),
    );
  }
}
