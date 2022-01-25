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
        .snapshots()
        .map((event) => event.docs
            .map((e) => PostModel.fromJson(e.data() as Map<String, dynamic>))
            .toList());
  }

  ///Add Post
  Future addPost(PostModel postModel) async {
    return await FirebaseFirestore.instance
        .collection('talentPostCollection')
        .add(postModel.toJson(postModel.docId.toString()));
  }

  ///Increment Post Like Counter
  Future incrementPostCounter(String postID) async {
    return await FirebaseFirestore.instance
        .collection('talentPostCollection')
        .doc(postID)
        .update({'likeCounter': FieldValue.increment(1)});
  }
}
