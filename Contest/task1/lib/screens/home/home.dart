import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task1/screens/audio/offlinlibrary.dart';
import 'package:task1/screens/audio/onlinlibrary.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Homebody(),
    );
  }
}

class Homebody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        height: size.height,
        width: size.width,
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              heightFactor: 3,
              child: Text(
                "Where too..",
                style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w400),
              ),
            ),
            GestureDetector(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                color: Colors.white30.withOpacity(0.1),
                child: ListTile(
                  title: Text(
                    "Listen to Music",
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.orangeAccent,
                  ),
                ),
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (contex) => Onlinelibrary(),
                ),
              ),
            ),
            InkWell(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                color: Colors.white30.withOpacity(0.1),
                child: ListTile(
                  title: Text(
                    "Watch Video",
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.orangeAccent,
                  ),
                ),
              ),
            ),
            _divider(),
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                child: Text(
                  "Go Offline",
                  style: GoogleFonts.lato(color: Colors.white),
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Offlinelibrary(),
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

Widget _divider() {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 20),
    child: Row(
      children: <Widget>[
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              color: Colors.orangeAccent.withOpacity(0.6),
              thickness: 1,
            ),
          ),
        ),
        Text(
          'or',
          style: GoogleFonts.lato(
            fontSize: 14.5,
            color: Colors.white60,
            // fontWeight: FontWeight.w300,
            fontStyle: FontStyle.italic,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              color: Colors.orangeAccent.withOpacity(0.6),
              thickness: 1,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
      ],
    ),
  );
}
