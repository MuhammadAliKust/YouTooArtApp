import 'package:booster/booster.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:you_2_art/infrastrucuture/models/comment.dart';
import 'package:you_2_art/infrastrucuture/models/post.dart';
import 'package:you_2_art/infrastrucuture/models/talent.dart';
import 'package:you_2_art/infrastrucuture/services/comment.dart';
import 'package:you_2_art/infrastrucuture/services/post.dart';
import 'package:you_2_art/infrastrucuture/services/talent.dart';
import 'package:you_2_art/presentations/elements/auth_text_field_simple.dart';

class ActivityHome extends StatelessWidget {
  TalentServices _talentServices = TalentServices();
  PostServices _postServices = PostServices();
  CommentServices _commentServices = CommentServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
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
                    backgroundImage: AssetImage('assets/images/person.jpg'),
                  ),
                  Booster.horizontalSpace(15),
                  Expanded(
                      child:
                          AuthTextFieldSimple(label: 'What\'s new?', number: 1))
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
                                          ? CircularProgressIndicator()
                                          : getPostCard(context,
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

  getPostCard(BuildContext context,
      {required TalentModel talentModel,
      required PostModel postModel,
      required int commentLength}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(talentModel.image.toString()),
                  ),
                  Booster.horizontalSpace(15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Booster.dynamicFontSize(
                          label: talentModel.name.toString(),
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                      Booster.verticalSpace(3),
                      Booster.dynamicFontSize(
                          label: talentModel.categories
                              .toString()
                              .replaceAll(']', '')
                              .replaceAll('[', ''),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff989898)),
                    ],
                  )
                ],
              ),
              Icon(
                Icons.more_vert_sharp,
                color: Color(0xff7A8FA6),
              )
            ],
          ),
        ),
        Booster.verticalSpace(20),
        if (postModel.image == "")
          Padding(
            padding: const EdgeInsets.only(left: 55, right: 30),
            child: Booster.dynamicFontSize(
                label: postModel.postBody.toString(),
                fontSize: 12,
                lineHeight: 1.3,
                fontWeight: FontWeight.w400,
                isAlignCenter: false),
          ),
        if (postModel.image != "")
          Container(
            height: 209,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(postModel.image.toString()),
                )),
          ),
        Booster.verticalSpace(13),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    CupertinoIcons.heart_solid,
                    color: Color(0xff7A8FA6),
                    size: 18,
                  ),
                  Booster.horizontalSpace(3),
                  Booster.dynamicFontSize(
                      label: postModel.likeCounter.toString(),
                      fontSize: 9,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff7A8FA6)),
                  Booster.horizontalSpace(15),
                  ImageIcon(AssetImage('assets/images/Group 16131.png'),
                      size: 15, color: Color(0xff7A8FA6)),
                  Booster.horizontalSpace(3),
                  Booster.dynamicFontSize(
                      label: commentLength.toString(),
                      fontSize: 9,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff7A8FA6)),
                  Booster.horizontalSpace(15),
                  ImageIcon(AssetImage('assets/images/19.png'),
                      size: 15, color: Color(0xff7A8FA6)),
                  Booster.horizontalSpace(3),
                  Booster.dynamicFontSize(
                      label: '33',
                      fontSize: 9,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff7A8FA6)),
                ],
              ),
              Booster.dynamicFontSize(
                  label: '2 mins',
                  fontSize: 9,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff989898)),
            ],
          ),
        ),
        Booster.verticalSpace(30),
      ],
    );
  }

  getPostsView(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // RaisedButton(
          //   onPressed: () {
          //     FirebaseFirestore.instance
          //         .collection('talentUsersCollection')
          //         .add(TalentModel(
          //             image: '',
          //             name: 'Test',
          //             location: 'Kohat',
          //             categories: ['Reading', 'Traveling']).toJson('1'));
          //   },
          //   child: Text("Create User"),
          // ),
          // RaisedButton(
          //   onPressed: () {
          //     FirebaseFirestore.instance
          //         .collection('talentPostCollection')
          //         .add(PostModel(
          //                 authorId: 'zMhTR5obSmEw64x9zpmx',
          //                 postBody: 'Lorem Ipsum',
          //                 image: '',
          //                 likeCounter: 0,
          //                 time: Timestamp.fromDate(DateTime.now()))
          //             .toJson('1'));
          //   },
          //   child: Text("Create Post"),
          // ),

          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/images/person.jpg'),
                    ),
                    Booster.horizontalSpace(15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Booster.dynamicFontSize(
                            label: 'Pawan Kalyan',
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                        Booster.verticalSpace(3),
                        Booster.dynamicFontSize(
                            label: 'Actor,Writer',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff989898)),
                      ],
                    )
                  ],
                ),
                Icon(
                  Icons.more_vert_sharp,
                  color: Color(0xff7A8FA6),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 55, right: 30),
            child: Booster.dynamicFontSize(
                label:
                    'Wow! Just amazing. I love your profile content. Look forward to see more.Well done!',
                fontSize: 12,
                lineHeight: 1.3,
                fontWeight: FontWeight.w400,
                isAlignCenter: false),
          ),
          Booster.verticalSpace(13),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.heart_solid,
                      color: Color(0xff7A8FA6),
                      size: 18,
                    ),
                    Booster.horizontalSpace(3),
                    Booster.dynamicFontSize(
                        label: '247',
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff7A8FA6)),
                    Booster.horizontalSpace(15),
                    ImageIcon(AssetImage('assets/images/Group 16131.png'),
                        size: 15, color: Color(0xff7A8FA6)),
                    Booster.horizontalSpace(3),
                    Booster.dynamicFontSize(
                        label: '57',
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff7A8FA6)),
                    Booster.horizontalSpace(15),
                    ImageIcon(AssetImage('assets/images/19.png'),
                        size: 15, color: Color(0xff7A8FA6)),
                    Booster.horizontalSpace(3),
                    Booster.dynamicFontSize(
                        label: '33',
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff7A8FA6)),
                  ],
                ),
                Booster.dynamicFontSize(
                    label: '2 mins',
                    fontSize: 9,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff989898)),
              ],
            ),
          ),
          Booster.verticalSpace(30),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/images/person.jpg'),
                    ),
                    Booster.horizontalSpace(15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Booster.dynamicFontSize(
                            label: 'Pawan Kalyan',
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                        Booster.verticalSpace(3),
                        Booster.dynamicFontSize(
                            label: 'Actor,Writer',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff989898)),
                      ],
                    )
                  ],
                ),
                Icon(
                  Icons.more_vert_sharp,
                  color: Color(0xff7A8FA6),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 55, right: 30),
            child: Booster.dynamicFontSize(
                label:
                    'Wow! Just amazing. I love your profile content. Look forward to see more.Well done!',
                fontSize: 12,
                lineHeight: 1.3,
                fontWeight: FontWeight.w400,
                isAlignCenter: false),
          ),
          Booster.verticalSpace(13),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.heart_solid,
                      color: Color(0xff7A8FA6),
                      size: 18,
                    ),
                    Booster.horizontalSpace(3),
                    Booster.dynamicFontSize(
                        label: '247',
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff7A8FA6)),
                    Booster.horizontalSpace(15),
                    ImageIcon(AssetImage('assets/images/Group 16131.png'),
                        size: 15, color: Color(0xff7A8FA6)),
                    Booster.horizontalSpace(3),
                    Booster.dynamicFontSize(
                        label: '57',
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff7A8FA6)),
                    Booster.horizontalSpace(15),
                    ImageIcon(AssetImage('assets/images/19.png'),
                        size: 15, color: Color(0xff7A8FA6)),
                    Booster.horizontalSpace(3),
                    Booster.dynamicFontSize(
                        label: '33',
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff7A8FA6)),
                  ],
                ),
                Booster.dynamicFontSize(
                    label: '2 mins',
                    fontSize: 9,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff989898)),
              ],
            ),
          ),
          Booster.verticalSpace(20),
        ],
      ),
    );
  }
}
