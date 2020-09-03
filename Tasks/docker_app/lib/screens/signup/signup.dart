import 'package:docker_app/Animations/fade.dart';
import 'package:docker_app/controllers/authcontroller.dart';
import 'package:docker_app/widgets/inputbox.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Signupbody(),
    );
  }
}

class Signupbody extends StatefulWidget {
  @override
  _SignupbodyState createState() => _SignupbodyState();
}

class _SignupbodyState extends State<Signupbody> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmpasswordController = TextEditingController();
  TextEditingController _namecontroller = TextEditingController();

  final AuthController _authController = Get.put(AuthController());
  bool value = true;

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.fromLTRB(20, 40, 20, 40),
      alignment: Alignment.center,
      child: Stack(
        children: [
          // FadeAnimation(1.2, VariousDiscs(10, Colors.white30)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Login text
              FadeAnimation(
                0.2,
                Text(
                  'SignUp',
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
                  controller: _namecontroller,
                  hintText: 'Name',
                  hintStyle: GoogleFonts.montserrat(),
                  icon: Icon(
                    Icons.person,
                    color: Colors.black26,
                  ),
                  boxColor: Colors.white,
                ),
              ),
              FadeAnimation(
                0.6,
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
                0.8,
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
              FadeAnimation(
                1,
                Inputbox(
                  controller: _confirmpasswordController,
                  hintText: 'Confirm Password',
                  hintStyle: GoogleFonts.montserrat(),
                  obscure: value,
                  icon: Icon(Icons.lock_outline, color: Colors.black26),
                  suffixIcon: value == true
                      ? Icon(FontAwesomeIcons.eyeSlash,
                          size: 18, color: Colors.black26)
                      : Icon(FontAwesomeIcons.eye,
                          size: 18, color: Colors.red[300]),
                  boxColor: Colors.white,
                ),
              ),
              //circularavtar iconbutton
              FadeAnimation(
                1.2,
                CircleAvatar(
                  backgroundColor: Colors.white24,
                  radius: 28,
                  child: IconButton(
                    icon:
                        Icon(FontAwesomeIcons.arrowRight, color: Colors.white),
                    onPressed: () {
                      if (_passwordController.text ==
                          _confirmpasswordController.text) {
                        _authController.createUser(
                          _emailController.text,
                          _passwordController.text,
                          _namecontroller.text,
                        );
                      } else {
                        Get.snackbar(
                          "Password doesn't match",
                          'Check the password again',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.white38,
                          overlayBlur: 1,
                        );
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              //signup button
              // FadeAnimation(
              //   1.4,
              //   GestureDetector(
              //     child: Text('Signup',
              //         style: GoogleFonts.montserrat(fontSize: 20)),
              //     onTap: () {
              //       Get.to(Signupscreen());
              //     },
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
