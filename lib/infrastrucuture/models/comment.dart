// To parse this JSON data, do
//
//     final commentModel = commentModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

CommentModel commentModelFromJson(String str) =>
    CommentModel.fromJson(json.decode(str));

String commentModelToJson(CommentModel data) =>
    json.encode(data.toJson(data.docId.toString()));

class CommentModel {
  CommentModel({
    this.docId,
    this.postID,
    this.authorID,
    this.time,
    this.comment,
  });

  String? docId;
  String? postID;
  String? authorID;
  Timestamp? time;
  String? comment;

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
    docId: json["docID"],
    postID: json["postID"],
    authorID: json["authorID"],
    time: json["time"],
    comment: json["comment"],
  );

  Map<String, dynamic> toJson(String docID) => {
    "docID": docID,
    "videoID": postID,
    "farmerID": authorID,
    "time": time,
    "comment": comment,
  };
}
