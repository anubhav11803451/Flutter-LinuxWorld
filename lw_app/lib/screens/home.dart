import 'package:flutter/material.dart';
import 'package:lw_app/animation/variousdisc.dart';
import 'package:lw_app/services/webserver.dart';
// import 'package:http/http.dart' as http;

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
      // appBar: appBar(),
      body: HomeBody2(),
      // backgroundColor: Color(0xFF15202D),
      backgroundColor: Colors.white,
    );
  }
}

class HomeBody2 extends StatelessWidget {
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
            onPressed: getData,
            child: Text("server"),
          ),
        ],
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({
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

// Center(
//         child: Container(
//           decoration: BoxDecoration(
//             // image: DecorationImage(
//             //   image: AssetImage('assets/icons/avatar.png'),
//             // ),
//             borderRadius: BorderRadius.circular(20.0),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Image.asset(
//                 'assets/icons/avatar.png',
//                 height: 150,
//               ),
//               SizedBox(height: 10.0),
//               Text(
//                 'Hey There!!\n'
//                 'Anubhav',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontStyle: FontStyle.italic,
//                   fontWeight: FontWeight.w300,
//                   fontSize: 20.0,
//                   letterSpacing: -1,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
