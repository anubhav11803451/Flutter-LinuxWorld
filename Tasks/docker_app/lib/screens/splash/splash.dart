import 'package:docker_app/Animations/fade.dart';
import 'package:docker_app/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white24,
      body: Stack(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FadeAnimation(
                2.2,
                FlatButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ),
                  ),
                  child: Text(
                    "Let's Begin",
                    style: GoogleFonts.lato(
                      color: Colors.white60,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 13.0, horizontal: 20.0),
                ),
              ),
            ),
          ),
          Container(
            height: size.height - 90,
            width: size.width,
            decoration: BoxDecoration(
              color: Color(0xff070707),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40.0),
              ),
            ),
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FadeAnimation(
                  1,
                  Text(
                    "D",
                    style:
                        GoogleFonts.lato(color: Colors.white30, fontSize: 80),
                    // textScaleFactor: 1.2,
                  ),
                ),
                FadeAnimation(
                  1.2,
                  Text(
                    "o",
                    style:
                        GoogleFonts.lato(color: Colors.white54, fontSize: 80),
                    // textScaleFactor: 1.2,
                  ),
                ),
                FadeAnimation(
                  1.4,
                  Text(
                    "c",
                    style:
                        GoogleFonts.lato(color: Colors.white30, fontSize: 80),
                    // textScaleFactor: 1.2,
                  ),
                ),
                FadeAnimation(
                  1.6,
                  Text(
                    "k",
                    style:
                        GoogleFonts.lato(color: Colors.white54, fontSize: 80),
                    // textScaleFactor: 1.2,
                  ),
                ),
                FadeAnimation(
                  1.8,
                  Text(
                    "i",
                    style:
                        GoogleFonts.lato(color: Colors.white30, fontSize: 80),
                    // textScaleFactor: 1.2,
                  ),
                ),
                FadeAnimation(
                  2,
                  Text(
                    "t",
                    style:
                        GoogleFonts.lato(color: Colors.white54, fontSize: 80),
                    // textScaleFactor: 1.2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
