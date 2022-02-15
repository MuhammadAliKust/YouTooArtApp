// To parse this JSON data, do
//
//     final friendsModel = friendsModelFromJson(jsonString);

import 'dart:convert';

FriendsModel friendsModelFromJson(String str) =>
    FriendsModel.fromJson(json.decode(str));

String friendsModelToJson(FriendsModel data) =>
    json.encode(data.toJson(data.id.toString()));

class FriendsModel {
  FriendsModel({
    this.docId,
    this.id,
  });

  String? docId;
  String? id;

  factory FriendsModel.fromJson(Map<String, dynamic> json) => FriendsModel(
        docId: json["docID"],
        id: json["id"],
      );

  Map<String, dynamic> toJson(String docID) => {
        "docID": docID,
        "id": id,
      };
}
