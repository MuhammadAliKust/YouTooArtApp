// To parse this JSON data, do
//
//     final connectionModel = connectionModelFromJson(jsonString);

import 'dart:convert';

ConnectionModel connectionModelFromJson(String str) => ConnectionModel.fromJson(json.decode(str));

String connectionModelToJson(ConnectionModel data) => json.encode(data.toJson(data.docId.toString()));

class ConnectionModel {
  ConnectionModel({
    this.docId,
    this.userId,
    this.otherId,
    this.users,
    this.accepted,
  });

  String? docId;
  String? userId;
  String? otherId;
  List<String>? users;
  bool? accepted;

  factory ConnectionModel.fromJson(Map<String, dynamic> json) => ConnectionModel(
    docId: json["docID"],
    userId: json["userID"],
    otherId: json["otherID"],
    users: List<String>.from(json["users"].map((x) => x)),
    accepted: json["accepted"],
  );

  Map<String, dynamic> toJson(String docID) => {
    "docID": docID,
    "userID": userId,
    "otherID": otherId,
    "users": List<dynamic>.from(users!.map((x) => x)),
    "accepted": false,
  };
}
