import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:you_2_art/infrastrucuture/models/category.dart';

class CategoryServices {
  ///Add User Data
  Future<void> addCategory(CategoryModel categoryModel) async {
    DocumentReference docRef =
        FirebaseFirestore.instance.collection('categoriesCollection').doc();

    return await docRef.set(categoryModel.toJson(docRef.id.toString()));
  }

  ///Stream Specific User
  Stream<List<CategoryModel>> streamAllCategories() {
    return FirebaseFirestore.instance
        .collection('categoriesCollection')
        .snapshots()
        .map((event) =>
            event.docs.map((e) => CategoryModel.fromJson(e.data())).toList());
  }

  ///Stream Category By ID
  Stream<CategoryModel> streamCategoryByID(String categoryID) {
    return FirebaseFirestore.instance
        .collection('categoriesCollection')
        .doc(categoryID)
        .snapshots()
        .map((event) => CategoryModel.fromJson(event.data()!));

  }
}
