import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotely/animations/tweenAnimation.dart';
import 'package:quotely/screens/homescreen.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Tweenanimation(),
    );
  }
}
