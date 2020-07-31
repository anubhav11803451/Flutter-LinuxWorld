import 'package:http/http.dart' as http;

getData() async {
  var url = 'http://192.168.72.128/home.html';
  http.Response response = await http.get(url);
  print(response.body);
}
