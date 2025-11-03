import 'dart:convert';

class User {
  //define fields
  final String id;
  final String fullName;
  final String email;
  final String password;
  final String state;
  final String city;
  final String locality;

  User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.password,
    required this.state,
    required this.city,
    required this.locality,
  });

  //serialization: User object into Map
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "fullName": fullName,
      "email": email,
      "password": password,
      "state": state,
      "city": city,
      "locality": locality,
    };
  }

  //Map to JSON String
  String toJSON() => json.encode(toMap());

  //deserialization : Map into User object
  //purpose to concerted to USer object from Map
  //easily used on application
  //for example to display user data on screen

  //factory constructor takes a map use obtain from a json object and converts it into a User instance
  //from map this constructor takes a map String dynamic as input and converts it into a user object its usefull when you already have data
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] as String? ?? "",
      fullName: map['fullName'] as String? ?? "",
      email: map['email'] as String? ?? "",
      password: map['password'] as String? ?? "",
      state: map['state'] as String? ?? "",
      city: map['city'] as String? ?? "",
      locality: map['locality'] as String? ?? "",
    );
  }

  //from JSON : this factory constructor takes a JSON string as input and converts it into a User object

  factory User.fromJSON(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
