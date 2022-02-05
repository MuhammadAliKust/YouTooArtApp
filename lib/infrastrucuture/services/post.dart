import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:you_2_art/infrastrucuture/models/post.dart';

class PostServices {
  ///Get My Posts
  Stream<List<PostModel>> streamMyPosts(String uid) {
    return FirebaseFirestore.instance
        .collection('talentPostCollection')
        .where('docId', isEqualTo: uid)
        .snapshots()
        .map((event) => event.docs
            .map((e) => PostModel.fromJson(e.data() as Map<String, dynamic>))
            .toList());
  }

  ///Get All Posts
  Stream<List<PostModel>> streamAllPosts() {
    return FirebaseFirestore.instance
        .collection('talentPostCollection')
        .orderBy('time', descending: true)
        .snapshots()
        .map((event) => event.docs
            .map((e) => PostModel.fromJson(e.data() as Map<String, dynamic>))
            .toList());
  }

  ///Add Post
  Future addPost(PostModel postModel) async {
    DocumentReference _docRef =
        FirebaseFirestore.instance.collection('talentPostCollection').doc();
    return await _docRef.set(postModel.toJson(_docRef.id.toString()));
  }

  ///Update Post
  Future updatePost(PostModel postModel) async {
    return await FirebaseFirestore.instance
        .collection('talentPostCollection')
        .doc(postModel.docId)
        .update({'postBody': postModel.postBody, 'image': postModel.image});
  }

  ///Increment Post Like Counter
  Future incrementPostCounter(
      {required String postID, required String likerID}) async {
    return await FirebaseFirestore.instance
        .collection('talentPostCollection')
        .doc(postID)
        .update({
      'likeCounter': FieldValue.increment(1),
      'likers': FieldValue.arrayUnion([likerID])
    });
  }

  ///Delete Post
  Future<void> deletePost(String postID) async {
    return await FirebaseFirestore.instance
        .collection('talentPostCollection')
        .doc(postID)
        .delete();
  }
}
