import 'package:flutter/material.dart';
import 'package:lw_app/services/webserver.dart';

class InputBox extends StatefulWidget {
  @override
  _InputBoxState createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var x;
    return Container(
      height: size.height,
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: textEditingController,
            //we can use onchanged event here too.
            onChanged: (value) {
              x = value;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Type something",
            ),
          ),
          RaisedButton(
            child: Text(
              'Run',
            ),
            textColor: Colors.black,
            onPressed: () {
              getcmd(x);
            },
          ),
        ],
      ),
    );
  }
}
