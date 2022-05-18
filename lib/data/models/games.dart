// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class GamesModel {
  int id;
  int numberOfPlayer;
  String title;
  String? description;
  String? image;
  String? dateTime;

  GamesModel(
      {required this.id,
      required this.numberOfPlayer,
      required this.title,
      this.description,
      this.image,
      this.dateTime});
  // DateTime? date;

  GamesModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        numberOfPlayer = json['numberOfPlayer'],
        title = json['title'] {
    description = json['description'];
    image = json['image'];
    dateTime = json['dateTime'];
  }

  Map<String, dynamic> toJSON() {
    return {
      // 'id': this.id,
      'numberOfPlayer': this.numberOfPlayer,
      'title': this.title,
      'description': this.description,
      'image': this.image,
      'dateTime': this.dateTime
    };
  }
}
