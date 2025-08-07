import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mausam/constants.dart';
import 'package:mausam/screens/city_name_screen.dart';

class HomePage extends StatefulWidget {
  HomePage({required this.weatherData, super.key});
  final dynamic weatherData;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String cityName = '';
  String weatherDescription = '';
  String temperature = '';
  String windSpeed = '';
  String humidity = '';
  String pressure = '';

  @override
  void initState() {
    init();
    super.initState();
  }

  init() {
    cityName = widget.weatherData['name'].toString();
    weatherDescription = widget.weatherData['weather'][0]['main'].toString();
    temperature = widget.weatherData['main']['temp'].toString();
    windSpeed = widget.weatherData['wind']['speed'].toString();
    humidity = widget.weatherData['main']['humidity'].toString();
    pressure = widget.weatherData['main']['pressure'].toString();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CityNameScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: kThemeColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Icon(
                        Icons.search,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                cityName,
                style: GoogleFonts.poppins(
                    fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Text(
                weatherDescription,
                style: GoogleFonts.poppins(),
              ),
              SizedBox(height: 50),
              Image.asset('assets/images/cloudy.png'),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 35),
                  Text(
                    '$temperature °',
                    style: GoogleFonts.poppins(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Image.asset('assets/icons/wind.png', height: 25),
                      SizedBox(height: 5),
                      Text(
                        '$windSpeed m/sec',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset('assets/icons/humidity.png', height: 25),
                      SizedBox(height: 5),
                      Text(
                        '$humidity%',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset('assets/icons/atm_pressure.png', height: 25),
                      SizedBox(height: 5),
                      Text(
                        '$pressure hPa',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
