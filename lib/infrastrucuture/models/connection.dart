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
    this.accepted,
  });

  String? docId;
  String? userId;
  bool? accepted;

  factory ConnectionModel.fromJson(Map<String, dynamic> json) => ConnectionModel(
    docId: json["docID"],
    userId: json["userID"],
    accepted: json["accepted"],
  );

  Map<String, dynamic> toJson(String docID) => {
    "docID": docID,
    "userID": userId,
    "accepted": false,
  };
}
