import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff070707),
      body: Homebody(),
    );
  }
}

class Homebody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      // alignment: Alignment.bottomCenter,
      child: Stack(
        // alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            height: size.height * .90,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(30.0)),
              color: Colors.white24,
            ),
          ),
          // SafeArea(
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: <Widget>[
          //         Align(
          //           alignment: Alignment.topRight,
          //           child: Container(
          //             alignment: Alignment.center,
          //             height: 52,
          //             width: 52,
          //             decoration: BoxDecoration(
          //               color: Colors.white38,
          //               shape: BoxShape.circle,
          //             ),
          //             child: IconButton(
          //               icon: Icon(
          //                 Icons.menu,
          //                 color: Colors.white,
          //               ),
          //               onPressed: () {},
          //             ),
          //           ),
          //         ),
          //         Text(
          //           'Docker it',
          //           style: GoogleFonts.lato(
          //             color: Colors.white,
          //             fontWeight: FontWeight.w900,
          //             fontSize: 20,
          //           ),
          //         ),
          //         // Container(
          //         //   margin: EdgeInsets.symmetric(vertical: 45),
          //         //   padding:
          //         //       EdgeInsets.symmetric(horizontal: 30, vertical: 2.1),
          //         //   decoration: BoxDecoration(
          //         //       color: Colors.white,
          //         //       borderRadius: BorderRadius.circular(29.5)),
          //         //   child: TextField(
          //         //     decoration: InputDecoration(
          //         //       hintText: "Search",
          //         //       icon: Icon(
          //         //         Icons.search,
          //         //         color: Colors.black,
          //         //       ),
          //         //       border: InputBorder.none,
          //         //     ),
          //         //   ),
          //         // ),
          //         Expanded(
          //           child: GridView.count(
          //             crossAxisCount: 2,
          //             childAspectRatio: .85,
          //             crossAxisSpacing: 20,
          //             mainAxisSpacing: 20,
          //             children: <Widget>[
          //               Container(
          //                 height: 80,
          //                 width: 80,
          //                 color: Colors.white,
          //               ),
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
