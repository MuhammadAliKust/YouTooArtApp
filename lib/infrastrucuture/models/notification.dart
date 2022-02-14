// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

NotificationModel notificationModelFromJson(String str) =>
    NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) =>
    json.encode(data.toJson(data.docId.toString()));

class NotificationModel {
  NotificationModel({
    this.docId,
    this.isBroadCast,
    this.authorId,
    this.seenByUsers,
    this.time,
    this.body,
    this.forMe,
  });

  String? docId;
  bool? isBroadCast;
  String? authorId;
  List<String>? seenByUsers;
  Timestamp? time;
  String? body;
  String? forMe;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        docId: json["docID"],
        isBroadCast: json["isBroadCast"],
        authorId: json["authorID"],
        seenByUsers: List<String>.from(json["seenByUsers"].map((x) => x)),
        time: json["time"],
        body: json["body"],
        forMe: json["forMe"],
      );

  Map<String, dynamic> toJson(String docID) => {
        "docID": docID,
        "isBroadCast": isBroadCast,
        "authorID": authorId,
        "seenByUsers": seenByUsers,
        "forMe": forMe,
        "body": body,
        "time": Timestamp.fromDate(DateTime.now()),
        "seenByUsers": [],
      };
}
