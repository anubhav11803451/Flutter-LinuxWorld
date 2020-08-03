import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task1/screens/home/home.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: size.height,
        width: size.width,
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Center(
              heightFactor: 4,
              child: CircleAvatar(
                radius: 35.0,
                backgroundColor: Colors.black,
                child: Image.asset('assets/icons/wave.png'),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Hey There!",
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "We promise, you will have hassel free\nstreaming of music and video",
                  style: GoogleFonts.lato(
                    color: Colors.white54,
                    fontSize: 15.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Center(
              child: GestureDetector(
                child: CircleAvatar(
                  radius: 32.0,
                  backgroundColor: Colors.white30.withOpacity(0.12),
                  foregroundColor: Colors.white,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.orangeAccent,
                  ),
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
