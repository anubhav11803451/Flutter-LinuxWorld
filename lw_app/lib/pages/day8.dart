import 'package:flutter/material.dart';
import 'package:lw_app/services/webserver.dart';

//integrating with webserver using http protocol
class Day8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            onPressed: gethtml,
            color: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(
              "Retrive HTML",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          RaisedButton(
            onPressed: getperl,
            color: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(
              "Retrive Pearl",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          RaisedButton(
            onPressed: getpy,
            color: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(
              "Retrive Py",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
