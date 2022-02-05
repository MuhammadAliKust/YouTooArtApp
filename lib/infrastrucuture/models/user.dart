// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) =>
    json.encode(data.toJson(data.docID.toString()));

class UserModel {
  UserModel({
    this.categories,
    this.image,
    this.firstName,
    this.lastName,
    this.city,
    this.state,
    this.shortBio,
    this.phoneNumber,
    this.posts,
    this.connect,
    this.docID,
  });

  List<String>? categories;
  String? image;
  String? docID;
  String? firstName;
  String? lastName;
  String? city;
  String? state;
  String? shortBio;
  String? phoneNumber;
  int? connect;
  int? posts;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        categories: List<String>.from(json["categories"].map((x) => x)),
        image: json["image"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        docID: json["docID"],
        city: json["city"],
        state: json["state"],
        shortBio: json["shortBio"],
        phoneNumber: json["phoneNumber"],
        posts: json["posts"],
        connect: json["connect"],
      );

  Map<String, dynamic> toJson(String docID) => {
        "categories": List<dynamic>.from(categories!.map((x) => x)),
        "image": image,
        "firstName": firstName,
        "docID": docID,
        "lastName": lastName,
        "city": city,
        "state": state,
        "shortBio": shortBio,
        "phoneNumber": phoneNumber,
        "connect": connect,
        "posts": posts,
      };
}
