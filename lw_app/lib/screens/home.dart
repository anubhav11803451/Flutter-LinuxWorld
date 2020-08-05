import 'package:flutter/material.dart';

import 'package:lw_app/pages/day8.dart';

class MyHomePage extends StatelessWidget {
  AppBar appBar() {
    return AppBar(
      title: Text(
        "My Card",
        style: TextStyle(
          fontWeight: FontWeight.w300,
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.blur_on,
          // color: Colors.black,
        ),
        onPressed: () {},
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Icon(
            Icons.inbox,
            // color: Colors.black,
          ),
        ),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      backgroundColor: Colors.black,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Day8(),
      // backgroundColor: Color(0xFF15202D),
      backgroundColor: Colors.white,
    );
  }
}
