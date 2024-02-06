import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  String id;
  String email;
  String name;
  String gbr;

  User({required this.id, required this.email, required this.name, required this.gbr});

  factory User.createUser(Map<String, dynamic> object) {
    return User(
        id: object['id'].toString(),
        email: object['email'],
        name: object['first_name'] + ' ' + object['last_name'],
        gbr : object['avatar']);
  }

  static Future<User> connectToApi(String id) async {
    String apiUrl = "https://reqres.in/api/users/" + id;
    var apiResult = await http.get(Uri.parse(apiUrl));
    var jsonObject = json.decode(apiResult.body);
    var userData = (jsonObject as Map<String, dynamic>)['data'];
    return User.createUser(userData);
  }
}
