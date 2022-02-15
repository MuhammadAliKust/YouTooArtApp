// To parse this JSON data, do
//
//     final friendRequestModel = friendRequestModelFromJson(jsonString);

import 'dart:convert';

FriendRequestModel friendRequestModelFromJson(String str) =>
    FriendRequestModel.fromJson(json.decode(str));

String friendRequestModelToJson(FriendRequestModel data) =>
    json.encode(data.toJson(data.docId.toString()));

class FriendRequestModel {
  FriendRequestModel({
    this.docId,
    this.myId,
    this.otherId,
  });

  String? docId;
  String? myId;
  String? otherId;

  factory FriendRequestModel.fromJson(Map<String, dynamic> json) =>
      FriendRequestModel(
        docId: json["docID"],
        myId: json["myID"],
        otherId: json["otherID"],
      );

  Map<String, dynamic> toJson(String docID) => {
        "docID": docID,
        "myID": myId,
        "otherID": otherId,
      };
}
