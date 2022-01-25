import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:you_2_art/infrastrucuture/models/comment.dart';

class CommentServices {
  ///Get Specific Post Comments
  Stream<List<CommentModel>> streamPostComment(String postID) {
    return FirebaseFirestore.instance
        .collection('postCollection')
        .where('postID', isEqualTo: postID)
        .snapshots()
        .map((event) => event.docs
            .map((e) => CommentModel.fromJson(e.data() as Map<String, dynamic>))
            .toList());
  }

  ///Add Comments
  Future addPostComment(CommentModel commentModel) {
    return FirebaseFirestore.instance
        .collection('postCollection')
        .add(commentModel.toJson(commentModel.docId.toString()));
  }
}
