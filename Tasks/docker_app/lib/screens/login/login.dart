import 'package:docker_app/Animations/fade.dart';
import 'package:docker_app/controllers/authcontroller.dart';
import 'package:docker_app/screens/signup/signup.dart';
import 'package:docker_app/widgets/inputbox.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: LoginBody(),
    );
  }
}

class LoginBody extends StatefulWidget {
  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final AuthController _authController = Get.put(AuthController());
  bool value = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height - 90,
      width: size.width,
      decoration: BoxDecoration(
        color: Color(0xff070707),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40.0),
        ),
      ),
      padding: EdgeInsets.fromLTRB(20, 40, 20, 40),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          //Login text
          FadeAnimation(
            0.2,
            Text(
              'Login',
              style: GoogleFonts.montserrat(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          SizedBox(height: 40),
          //email inputbox
          FadeAnimation(
            0.4,
            Inputbox(
              controller: _emailController,
              hintText: 'Email',
              hintStyle: GoogleFonts.montserrat(),
              icon: Icon(
                Icons.alternate_email,
                color: Colors.black26,
              ),
              boxColor: Colors.white,
            ),
          ),
          //password inputbox
          FadeAnimation(
            0.6,
            Inputbox(
              controller: _passwordController,
              hintText: 'Password',
              hintStyle: GoogleFonts.montserrat(),
              obscure: value,
              icon: Icon(Icons.lock_outline, color: Colors.black26),
              suffixIcon: GestureDetector(
                child: value == true
                    ? Icon(FontAwesomeIcons.eyeSlash,
                        size: 18, color: Colors.black26)
                    : Icon(FontAwesomeIcons.eye,
                        size: 18, color: Colors.red[300]),
                onTap: () {
                  setState(() {
                    if (value == true) {
                      value = false;
                    } else {
                      value = true;
                    }
                  });
                },
              ),
              boxColor: Colors.white,
            ),
          ),
          //forgot pass flatbutton
          FadeAnimation(
            0.8,
            Align(
              alignment: Alignment.centerRight,
              child: FlatButton(
                onPressed: () {},
                child: Text('Forgot Password', style: GoogleFonts.montserrat()),
                textColor: Colors.white,
              ),
            ),
          ),
          //circularavtar iconbutton
          FadeAnimation(
            1.0,
            CircleAvatar(
              backgroundColor: Colors.white24,
              radius: 28,
              child: IconButton(
                icon: Icon(FontAwesomeIcons.arrowRight, color: Colors.white),
                onPressed: () {
                  _authController.login(
                    _emailController.text,
                    _passwordController.text,
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 20),
          //signup button
          FadeAnimation(
            1.4,
            GestureDetector(
              child: Text(
                'Signup',
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Get.to(Signup());
              },
            ),
          ),
        ],
      ),
    );
  }
}
