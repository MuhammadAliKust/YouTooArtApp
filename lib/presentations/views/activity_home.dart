import 'package:booster/booster.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:you_2_art/application/user_provider.dart';
import 'package:you_2_art/configs/front_end_configs.dart';
import 'package:you_2_art/infrastrucuture/models/comment.dart';
import 'package:you_2_art/infrastrucuture/models/post.dart';
import 'package:you_2_art/infrastrucuture/models/talent.dart';
import 'package:you_2_art/infrastrucuture/services/comment.dart';
import 'package:you_2_art/infrastrucuture/services/post.dart';
import 'package:you_2_art/infrastrucuture/services/talent.dart';
import 'package:you_2_art/presentations/elements/auth_text_field_simple.dart';
import 'package:you_2_art/presentations/elements/post_card.dart';
import 'package:you_2_art/presentations/views/create_post.dart';

class ActivityHome extends StatelessWidget {
  TalentServices _talentServices = TalentServices();
  PostServices _postServices = PostServices();
  CommentServices _commentServices = CommentServices();
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context);
    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          backgroundColor: FrontEndConfigs.kPrimaryColor,
          child: Icon(Icons.add, color: Colors.white),
          onPressed: () {
            Get.to(() =>
                CreatePostView(postModel: PostModel(), isUpdateMode: false));
          },
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xffFFF6E0),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 5),
                      child: Row(
                        children: [
                          Icon(
                            CupertinoIcons.bell_fill,
                            size: 17,
                            color: Color(0xffFEB400),
                          ),
                          Booster.dynamicFontSize(
                              label: '9+',
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.w700),
                        ],
                      ),
                    ),
                  ),
                  Booster.horizontalSpace(7),
                  Icon(Icons.menu, size: 22, color: Colors.black)
                ],
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage:
                        NetworkImage(user.getUserDetails()!.image.toString()),
                  ),
                  Booster.horizontalSpace(15),
                  Expanded(
                      child: AuthTextFieldSimple(
                    label: 'What\'s new?',
                    number: 1,
                    controller: _controller,
                  ))
                ],
              ),
              Booster.verticalSpace(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Divider(),
              ),
              Booster.verticalSpace(5),
              Expanded(
                  child: StreamProvider.value(
                value: _postServices.streamAllPosts(),
                initialData: [PostModel()],
                builder: (context, child) {
                  List<PostModel> list = context.watch<List<PostModel>>();

                  return list.length == 0
                      ? Text("NO Data")
                      : ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: list.length,
                          itemBuilder: (context, i) {
                            return StreamProvider.value(
                                value: _commentServices.streamPostComment(
                                    list[i].docId.toString()),
                                initialData: [CommentModel()],
                                builder: (context, child) {
                                  List<CommentModel> commentList =
                                      context.watch<List<CommentModel>>();
                                  return StreamProvider.value(
                                    value: _talentServices.fetchUserData(
                                        list[i].authorId.toString()),
                                    initialData: TalentModel(),
                                    builder: (context, child) {
                                      TalentModel userModel =
                                          context.watch<TalentModel>();

                                      return list[i].docId == null ||
                                              userModel.image == null
                                          ? Container()
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
              )),
            ],
          ),
        ));
  }
}
