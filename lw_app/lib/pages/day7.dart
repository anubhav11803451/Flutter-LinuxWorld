import 'package:flutter/material.dart';

class Day7 extends StatelessWidget {
  const Day7({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            height: size.height * 0.23,
            width: size.width * 0.58,
            // alignment: Alignment.center,
            margin: EdgeInsets.all(50.0),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(30.0),
              border: Border.all(color: Colors.white),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 5),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.alternate_email,
                    color: Colors.white54,
                    size: 19,
                  ),
                ),
                Text(
                  "anubhav@gmail.com",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/icons/avatar.png'),
                  fit: BoxFit.fill),
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
              ),
            ),
            child: Stack(),
          ),
        ],
      ),
    );
  }
}
