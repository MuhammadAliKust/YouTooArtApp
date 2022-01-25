// To parse this JSON data, do
//
//     final talentModel = talentModelFromJson(jsonString);

import 'dart:convert';

TalentModel talentModelFromJson(String str) =>
    TalentModel.fromJson(json.decode(str));

String talentModelToJson(TalentModel data) =>
    json.encode(data.toJson(data.docId.toString()));

class TalentModel {
  TalentModel({
    this.docId,
    this.image,
    this.name,
    this.categories,
    this.location,
  });

  String? docId;
  String? image;
  String? name;
  List<String>? categories;
  String? location;

  factory TalentModel.fromJson(Map<String, dynamic> json) => TalentModel(
        docId: json["docID"],
        image: json["image"],
        name: json["name"],
        categories: List<String>.from(json["categories"].map((x) => x)),
        location: json["location"],
      );

  Map<String, dynamic> toJson(String docID) => {
        "docID": docID,
        "image": image,
        "name": name,
        "categories": List<dynamic>.from(categories!.map((x) => x)),
        "location": location,
      };
}
