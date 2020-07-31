import 'package:flutter/material.dart';

class Day4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          // image: DecorationImage(
          //   image: AssetImage('assets/icons/avatar.png'),
          // ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/icons/avatar.png',
              height: 150,
            ),
            SizedBox(height: 10.0),
            Text(
              'Hey There!!\n'
              'Anubhav',
              style: TextStyle(
                color: Colors.black,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w300,
                fontSize: 20.0,
                letterSpacing: -1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
