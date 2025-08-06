import 'package:flutter/material.dart';
import 'package:mausam/screens/home_page.dart';
import 'package:mausam/screens/loading_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoadingScreen(),
    );
  }
}

//
// String getWeatherIcon(int condition) {
//   if (condition < 300) {
//     return '🌩';
//   } else if (condition < 400) {
//     return '🌧';
//   } else if (condition < 600) {
//     return '☔️';
//   } else if (condition < 700) {
//     return '☃️';
//   } else if (condition < 800) {
//     return '🌫';
//   } else if (condition == 800) {
//     return '☀️';
//   } else if (condition <= 804) {
//     return '☁️';
//   } else {
//     return '🤷‍';
//   }
// }
//
// String getMessage(int temp) {
//   if (temp > 25) {
//     return 'It\'s 🍦 time';
//   } else if (temp > 20) {
//     return 'Time for shorts and 👕';
//   } else if (temp < 10) {
//     return 'You\'ll need 🧣 and 🧤';
//   } else {
//     return 'Bring a 🧥 just in case';
//   }
// }
