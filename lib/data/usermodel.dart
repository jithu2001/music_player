import 'package:music_player/pages/signup.dart';

class Usermodel {
  String? uid;
  String? email;
  String? name;
  String? secondname;

  Usermodel({this.uid, this.email, this.name, this.secondname});
  factory Usermodel.fromMap(Map) {
    return Usermodel(
        uid: Map['uid'],
        email: Map['email'],
        name: Map['name'],
        secondname: Map['secondname']);
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'secondname': secondname,
    };
  }
}
