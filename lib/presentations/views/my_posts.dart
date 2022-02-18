import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:you_2_art/application/user_provider.dart';
import 'package:you_2_art/infrastrucuture/models/comment.dart';
import 'package:you_2_art/infrastrucuture/models/post.dart';
import 'package:you_2_art/infrastrucuture/models/talent.dart';
import 'package:you_2_art/infrastrucuture/services/comment.dart';
import 'package:you_2_art/infrastrucuture/services/connection.dart';
import 'package:you_2_art/infrastrucuture/services/post.dart';
import 'package:you_2_art/infrastrucuture/services/talent.dart';
import 'package:you_2_art/presentations/elements/loading_widgets/laoding_posts.dart';
import 'package:you_2_art/presentations/elements/no_data.dart';
import 'package:you_2_art/presentations/elements/post_card.dart';

class MyPostsView extends StatelessWidget {
  final String? userID;

  MyPostsView({this.userID});

  TalentServices _talentServices = TalentServices();
  PostServices _postServices = PostServices();
  CommentServices _commentServices = CommentServices();
  TextEditingController _controller = TextEditingController();
  ConnectionServices _connectionServices = ConnectionServices();

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context);
    return StreamProvider.value(
      value: _postServices
          .streamMyPosts(userID ?? user.getUserDetails()!.docID.toString()),
      initialData: [PostModel()],
      builder: (context, child) {
        List<PostModel> list = context.watch<List<PostModel>>();

        return list.length == 0
            ? NoDataView()
            : ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: list.length,
                itemBuilder: (context, i) {
                  return StreamProvider.value(
                      value: _commentServices
                          .streamPostComment(list[i].docId.toString()),
                      initialData: [CommentModel()],
                      builder: (context, child) {
                        List<CommentModel> commentList =
                            context.watch<List<CommentModel>>();
                        return StreamProvider.value(
                          value: _talentServices
                              .fetchUserData(list[i].authorId.toString()),
                          initialData: TalentModel(),
                          builder: (context, child) {
                            TalentModel userModel =
                                context.watch<TalentModel>();

                            return list[i].docId == null ||
                                    userModel.image == null
                                ? LoadingPosts()
                                : PostCard(
                                    talentModel: userModel,
                                    commentLength: commentList.length,
                                    postModel: list[i]);
                          },
                        );
                      });
                },
              );
      },
    );
  }
}
