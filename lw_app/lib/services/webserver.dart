import 'package:http/http.dart' as http;

gethtml() async {
  var url = 'http://192.168.43.164/home.html';
  http.Response response = await http.get(url);
  print(response.body);
}

getperl() async {
  var url = 'http://192.168.43.164/cgi-bin/test.pl';
  http.Response response = await http.get(url);
  print(response.body);
}

getpy() async {
  var url = 'http://192.168.43.164/cgi-bin/cmd.py';
  http.Response response = await http.get(url);
  print(response.body);
}
