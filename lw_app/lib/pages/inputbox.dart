import 'package:flutter/material.dart';
// import 'package:lw_app/services/webserver.dart';
import 'package:http/http.dart' as http;

class InputBox extends StatefulWidget {
  @override
  _InputBoxState createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  final TextEditingController textEditingController = TextEditingController();

  String output = '';
  Future getcmd(text) async {
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
    return Container(
      height: size.height,
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: textEditingController,
            //we can use onchanged event here too.
            // onChanged: (value) {
            // },
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
              getcmd(textEditingController.text);
            },
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                Text(
                  'Output >>>\n$output',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    // fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
