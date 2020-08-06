import 'package:http/http.dart' as http;

//this will fetch data from local server
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

getcmd(text) async {
  var url = 'http://192.168.43.164/cgi-bin/${text}';
  http.Response response = await http.get(url);
  print(response.body);
}
