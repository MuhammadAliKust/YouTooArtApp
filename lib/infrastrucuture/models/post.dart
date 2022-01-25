// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postModelToJson(PostModel data) =>
    json.encode(data.toJson(data.docId.toString()));

class PostModel {
  PostModel({
    this.docId,
    this.authorId,
    this.postBody,
    this.image,
    this.likeCounter,
    this.time,
  });

  String? docId;
  String? authorId;
  String? postBody;
  String? image;
  int? likeCounter;
  Timestamp? time;

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        docId: json["docID"],
        authorId: json["authorID"],
        postBody: json["postBody"],
        image: json["image"],
    time: json["time"],
        likeCounter: json["likeCounter"],
      );

  Map<String, dynamic> toJson(String docID) => {
        "docID": docID,
        "authorID": authorId,
        "postBody": postBody,
        "image": image,
        "likeCounter": likeCounter,
        "time": time,
      };
}
