import 'package:docker_app/controllers/authcontroller.dart';
import 'package:docker_app/controllers/usercontroller.dart';
import 'package:docker_app/services/database.dart';
import 'package:docker_app/widgets/inputbox.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white24,
      body: Homebody(),
    );
  }
}

class Userinfo extends StatelessWidget {
  const Userinfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<UserController>(
      initState: (_) async {
        Get.find<UserController>().user =
            await Database().getUser(Get.find<AuthController>().user.uid);
      },
      builder: (_) {
        if (_.user.name != null) {
          return Text(
            "Welcome " + _.user.name,
            style: TextStyle(color: Colors.amber),
          );
        } else {
          return LinearProgressIndicator();
        }
      },
    );
  }
}

class Homebody extends StatefulWidget {
  @override
  _HomebodyState createState() => _HomebodyState();
}

class _HomebodyState extends State<Homebody> {
  final AuthController _authController = Get.put(AuthController());
  final TextEditingController _commandController = TextEditingController();

  String output = '';
  getcmd(text) async {
    var url = 'http://192.168.43.164/cgi-bin/run.py?x=$text';
    http.Response response = await http.get(url);
    var result = response.body;
    print(result);
    setState(() {
      output = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
          height: size.height * .90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30.0)),
            color: Color(0xff070707),
          ),
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Userinfo(),
              Text(
                'Output :\n$output',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Inputbox(
                height: size.width * 0.14,
                width: size.width * 0.76,
                controller: _commandController,
                hintText: 'Run your command',
                hintStyle: GoogleFonts.montserrat(),
                icon: Icon(
                  Icons.bubble_chart,
                  color: Colors.black26,
                ),
                boxColor: Colors.white,
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
                alignment: Alignment.center,
                child: IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.send),
                  onPressed: () {
                    getcmd(_commandController.text);
                    _authController.runCommand(_commandController.text, output);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
