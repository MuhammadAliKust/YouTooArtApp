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
    this.firstName,
    this.categories,
    this.city,
    this.lastName,
  });

  String? docId;
  String? image;
  String? lastName;
  String? firstName;
  List<String>? categories;
  String? city;

  factory TalentModel.fromJson(Map<String, dynamic> json) => TalentModel(
        docId: json["docID"],
        image: json["image"],
        firstName: json["firstName"],
        categories: List<String>.from(json["categories"].map((x) => x)),
        city: json["city"],
        lastName: json["lastName"],
      );

  Map<String, dynamic> toJson(String docID) => {
        "docID": docID,
        "image": image,
        "firstName": firstName,
        "categories": List<dynamic>.from(categories!.map((x) => x)),
        "city": city,
        "lastName": lastName,
      };
}
