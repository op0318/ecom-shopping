import 'dart:convert';

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String address;
  final String type;
  final String token;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.password,
      required this.address,
      required this.token,
      required this.type});

//convert the class data to json object
  Map<String, dynamic> jsonobject() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'address': address,
      'token': token,
      'type': type
    };
  }

//convert the json string to new json object
  factory User.classobject(Map<String, dynamic> Map) {
    return User(
        id: Map['_id'] ?? '',
        name: Map['name'] ?? '',
        email: Map['email'] ?? '',
        password: Map['password'] ?? '',
        address: Map['address'] ?? '',
        token: Map['token'] ?? '',
        type: Map['type'] ?? '');
  }

//to make a json String
  String tojson() => json.encode(jsonobject());

//to make a class object
  factory User.fromJson(String source) {
    return User.classobject(json.decode(source));
  }
}
