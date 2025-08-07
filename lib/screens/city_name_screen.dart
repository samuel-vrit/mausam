import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mausam/constants.dart';
import 'package:mausam/screens/home_page.dart';
import 'package:mausam/services/network_service.dart';

class CityNameScreen extends StatelessWidget {
  CityNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/city.jpg'),
            fit: BoxFit.fitHeight,
          )),
          child: Column(
            children: [
              TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter the city name',
                  hintStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: kBorderColor)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: kThemeColor),
                  ),
                ),
                onSubmitted: (value) async {
                  WeatherService weatherService = WeatherService();

                  var weatherData =
                      await weatherService.getWeatherByCityName(value);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              HomePage(weatherData: weatherData)));
                  //
                },
              ),
              SizedBox(height: 50),
              Text(
                'Get weather by city name',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
