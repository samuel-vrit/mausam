import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Color(0xff94d2bd),
                      borderRadius: BorderRadius.circular(8)),
                  child: Icon(
                    Icons.search,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Text(
              'London',
              style: GoogleFonts.poppins(
                  fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Text(
              'Cloudy',
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
                  '51 °',
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
                    Image.asset('assets/icons/wind.png'),
                    SizedBox(height: 5),
                    Text(
                      '104 km/hr',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Column(
                  children: [
                    Image.asset('assets/icons/humidity.png'),
                    SizedBox(height: 5),
                    Text(
                      '22%',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Column(
                  children: [
                    Image.asset('assets/icons/umbrella.png'),
                    SizedBox(height: 5),
                    Text(
                      '11%',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
