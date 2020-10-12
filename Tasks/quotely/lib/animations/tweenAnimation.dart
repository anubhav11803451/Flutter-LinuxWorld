import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotely/screens/homescreen.dart';

class Tweenanimation extends StatefulWidget {
  @override
  _TweenanimationState createState() => _TweenanimationState();
}

class _TweenanimationState extends State<Tweenanimation> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TweenAnimationBuilder(
        duration: const Duration(seconds: 2),
        tween: ColorTween(begin: Colors.amber, end: Colors.blueAccent),
        builder: (BuildContext context, Color color, Widget child) {
          return ColorFiltered(
            colorFilter: ColorFilter.mode(color, BlendMode.modulate),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Quotely',
                  style: GoogleFonts.montserratAlternates(fontSize: 40),
                ),
                CircularProgressIndicator()
              ],
            ),
          );
        },
        onEnd: () {
          Get.off(HomeScreen());
        },
      ),
    );
  }
}
