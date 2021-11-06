//import 'package:music_player/pages/top_hits.dart';
//import 'package:flutter/material.dart';

class Musicdatamodel {
  String? title;
  String? name;
  String? image;

  Musicdatamodel({this.title, this.name, this.image});
  Musicdatamodel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    title = json['title'];
    image = json['image'];
  }
}
