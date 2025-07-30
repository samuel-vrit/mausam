import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  getLocation() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: getLocation),
      body: Center(
        child: Text('this is homepage'),
      ),
    );
  }
}
