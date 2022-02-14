import 'package:booster/booster.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:you_2_art/application/user_provider.dart';
import 'package:you_2_art/infrastrucuture/models/comment.dart';
import 'package:you_2_art/infrastrucuture/models/post.dart';
import 'package:you_2_art/infrastrucuture/models/talent.dart';
import 'package:you_2_art/infrastrucuture/services/comment.dart';
import 'package:you_2_art/infrastrucuture/services/post.dart';
import 'package:you_2_art/infrastrucuture/services/talent.dart';
import 'package:you_2_art/presentations/elements/auth_text_field_simple.dart';
import 'package:you_2_art/presentations/elements/comment_tile.dart';

class ActivityPost extends StatelessWidget {
  final PostModel postModel;
  final int commentsCounter;

  ActivityPost(this.postModel, this.commentsCounter);

  CommentServices _commentServices = CommentServices();
  TalentServices _talentServices = TalentServices();
  TextEditingController _controller = TextEditingController();
  PostServices _postServices = PostServices();

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context);
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            "Post Details",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              CupertinoIcons.back,
              color: Colors.black,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          elevation: 0,
        ),
        body: StreamProvider.value(
          value: _commentServices.streamPostComment(postModel.docId.toString()),
          initialData: [CommentModel()],
          builder: (context, child) {
            List<CommentModel> list = context.watch<List<CommentModel>>();
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (postModel.image! != "")
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 350,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(22),
                                  bottomRight: Radius.circular(22),
                                ),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image:
                                      NetworkImage(postModel.image.toString()),
                                )),
                          ),
                        Booster.verticalSpace(10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Booster.dynamicFontSize(
                            label: postModel.postBody.toString(),
                            fontSize: 14,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              Booster.verticalSpace(20),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 10),
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        if (!postModel.likers!.contains(user
                                            .getUserDetails()!
                                            .docID
                                            .toString()))
                                          _postServices.incrementPostCounter(
                                              postID:
                                                  postModel.docId.toString(),
                                              likerID: (user
                                                  .getUserDetails()!
                                                  .docID
                                                  .toString()));
                                      },
                                      child: Icon(
                                        CupertinoIcons.heart_solid,
                                        color: postModel.likers!.contains((user
                                                .getUserDetails()!
                                                .docID
                                                .toString()))
                                            ? Colors.red
                                            : Color(0xff7A8FA6),
                                        size: 18,
                                      ),
                                    ),
                                    Booster.horizontalSpace(3),
                                    Booster.dynamicFontSize(
                                        label: postModel.likeCounter.toString(),
                                        fontSize: 9,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xff7A8FA6)),
                                    Booster.horizontalSpace(15),
                                    ImageIcon(
                                        AssetImage(
                                            'assets/images/Group 16131.png'),
                                        size: 15,
                                        color: Color(0xff7A8FA6)),
                                    Booster.horizontalSpace(3),
                                    Booster.dynamicFontSize(
                                        label: list.length.toString(),
                                        fontSize: 9,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xff7A8FA6)),
                                    Booster.horizontalSpace(15),
                                    ImageIcon(
                                        AssetImage('assets/images/19.png'),
                                        size: 15,
                                        color: Color(0xff7A8FA6)),
                                    Booster.horizontalSpace(3),
                                    Booster.dynamicFontSize(
                                        label: '0',
                                        fontSize: 9,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xff7A8FA6)),
                                  ],
                                ),
                              ),
                              Booster.verticalSpace(15),
                            ],
                          ),
                        ),
                        StreamProvider.value(
                          value: _commentServices
                              .streamPostComment(postModel.docId.toString()),
                          initialData: [CommentModel()],
                          builder: (context, child) {
                            List<CommentModel> list =
                                context.watch<List<CommentModel>>();
                            return ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: list.length,
                                itemBuilder: (context, i) {
                                  return StreamProvider.value(
                                    value: _talentServices.fetchUserData(
                                        list[i].authorID.toString()),
                                    initialData: TalentModel(),
                                    builder: (context, child) {
                                      TalentModel talentModel =
                                          context.watch<TalentModel>();
                                      return list[0].docId == null ||
                                              talentModel.docId == null
                                          ? Center(
                                              child:
                                                  CircularProgressIndicator())
                                          : CommentTile(
                                              commentModel: list[i],
                                              talentModel: talentModel,
                                            );
                                    },
                                  );
                                });
                          },
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                            user.getUserDetails()!.image.toString()),
                      ),
                      Booster.horizontalSpace(10),
                      Expanded(
                          child: AuthTextFieldSimple(
                        label: 'Add a comment',
                        number: 1,
                        controller: _controller,
                      )),
                      Booster.horizontalSpace(10),
                      Container(
                        // radius: 20,
                        child: InkWell(
                          onTap: () async {
                            await _commentServices
                                .addPostComment(CommentModel(
                                    postID: postModel.docId.toString(),
                                    authorID:
                                        user.getUserDetails()!.docID.toString(),
                                    time: Timestamp.fromDate(DateTime.now()),
                                    comment: _controller.text))
                                .then((value) {
                              _controller.clear();
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.send),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ));
  }
}
