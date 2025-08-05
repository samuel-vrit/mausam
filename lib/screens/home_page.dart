import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('This is homepage'),
      ),
    );
  }
}
