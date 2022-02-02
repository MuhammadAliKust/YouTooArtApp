// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) =>
    json.encode(data.toJson(data.docId.toString()));

class CategoryModel {
  CategoryModel({
    this.docId,
    this.categoryName,
  });

  String? docId;
  String? categoryName;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        docId: json["docID"],
        categoryName: json["categoryName"],
      );

  Map<String, dynamic> toJson(String docID) => {
        "docID": docID,
        "categoryName": categoryName,
      };
}
