// To parse this JSON data, do
//
//     final reportModel = reportModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

ReportModel reportModelFromJson(String str) =>
    ReportModel.fromJson(json.decode(str));

String reportModelToJson(ReportModel data) =>
    json.encode(data.toJson(data.docId.toString()));

class ReportModel {
  ReportModel({
    this.docId,
    this.postId,
    this.authorId,
    this.time,
  });

  String? docId;
  String? postId;
  String? authorId;
  Timestamp? time;

  factory ReportModel.fromJson(Map<String, dynamic> json) => ReportModel(
        docId: json["docID"],
        postId: json["postID"],
        authorId: json["authorID"],
        time: json["time"],
      );

  Map<String, dynamic> toJson(String docID) => {
        "docID": docID,
        "postID": postId,
        "authorID": authorId,
        "time": Timestamp.fromDate(DateTime.now()),
      };
}

