import 'package:booster/booster.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:you_2_art/application/date_formatter.dart';
import 'package:you_2_art/application/user_provider.dart';
import 'package:you_2_art/infrastrucuture/models/category.dart';
import 'package:you_2_art/infrastrucuture/models/post.dart';
import 'package:you_2_art/infrastrucuture/models/report.dart';
import 'package:you_2_art/infrastrucuture/models/talent.dart';
import 'package:you_2_art/infrastrucuture/services/category.dart';
import 'package:you_2_art/infrastrucuture/services/post.dart';
import 'package:you_2_art/infrastrucuture/services/report.dart';
import 'package:you_2_art/presentations/elements/flush_bar.dart';
import 'package:you_2_art/presentations/views/activity_post_view.dart';
import 'package:you_2_art/presentations/views/create_post.dart';

import 'loading_widgets/loading_widget.dart';
import 'navigation_dialog.dart';

class PostCard extends StatelessWidget {
  final TalentModel talentModel;
  final PostModel postModel;
  final int commentLength;

  PostCard(
      {required this.talentModel,
      required this.postModel,
      required this.commentLength});

  PostServices _postServices = PostServices();
  ReportServices _reportServices = ReportServices();
  CategoryServices _categoryServices = CategoryServices();

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context);
    return InkWell(
      onTap: () {
        Get.to(() => ActivityPost(postModel, commentLength));
      },
      child: Column(
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
                      backgroundImage:
                          NetworkImage(talentModel.image.toString()),
                    ),
                    Booster.horizontalSpace(15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Booster.dynamicFontSize(
                            label: talentModel.firstName.toString() +
                                " " +
                                talentModel.lastName.toString(),
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                        Booster.verticalSpace(3),
                        Row(
                          children: [
                            ...talentModel.categories!.map((e) {
                              return StreamProvider.value(
                                value: _categoryServices.streamCategoryByID(e),
                                initialData: CategoryModel(),
                                builder: (context, child) {
                                  return Booster.dynamicFontSize(
                                      label: " #" +
                                          context
                                              .watch<CategoryModel>()
                                              .categoryName
                                              .toString(),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff989898));
                                },
                              );
                            }).toList(),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                // Text(postModel.postBody.toString()),
                if (user.getUserDetails()!.docID.toString() ==
                    postModel.authorId.toString())
                  PopupMenuButton(
                      iconSize: 16,
                      onSelected: (value) {
                        if (value == 2) {
                          showNavigationDialog(context,
                              message:
                                  "Do you really want to delete this video?",
                              buttonText: "Yes", navigation: () {
                            _postServices
                                .deletePost(postModel.docId.toString());
                            Navigator.pop(context);
                          }, secondButtonText: "No", showSecondButton: true);
                        } else if (value == 1) {
                          Get.to(() => CreatePostView(
                                postModel: postModel,
                                isUpdateMode: true,
                              ));
                        }
                        // else if (value == 3) {
                        //   _reportServices
                        //       .addReport(ReportModel(
                        //           authorId: '1',
                        //           postId: postModel.docId.toString()))
                        //       .then((value) {
                        //     getFlushBar(context,
                        //         title: 'Post has been reported successfully.');
                        //   });
                        // }
                      },
                      itemBuilder: (context) => [
                            PopupMenuItem(
                              child: Text("Update"),
                              value: 1,
                            ),
                            PopupMenuItem(
                              child: Text("Delete"),
                              value: 2,
                            ),
                          ]),
                if (user.getUserDetails()!.docID.toString() !=
                    postModel.authorId.toString())
                  PopupMenuButton(
                      iconSize: 16,
                      onSelected: (value) {
                        if (value == 1) {
                          _reportServices
                              .addReport(ReportModel(
                                  authorId:
                                      user.getUserDetails()!.docID.toString(),
                                  postId: postModel.docId.toString()))
                              .then((value) {
                            getFlushBar(context,
                                title: 'Post has been reported successfully.');
                          });
                        }
                      },
                      itemBuilder: (context) => [
                            PopupMenuItem(
                              child: Text("Report"),
                              value: 1,
                            ),
                          ])
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
              child: CachedNetworkImage(
                imageUrl: postModel.image.toString(),
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.fill,
                        colorFilter:
                            ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
                  ),
                ),
                placeholder: (context, url) => LoadingWidget(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          Booster.verticalSpace(13),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        if (!postModel.likers!
                            .contains(user.getUserDetails()!.docID.toString()))
                          _postServices.incrementPostCounter(
                              postID: postModel.docId.toString(),
                              likerID:
                                  (user.getUserDetails()!.docID.toString()));
                      },
                      child: Icon(
                        CupertinoIcons.heart_solid,
                        color: postModel.likers!.contains(
                                (user.getUserDetails()!.docID.toString()))
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
                    ImageIcon(AssetImage('assets/images/Group 16131.png'),
                        size: 15, color: Color(0xff7A8FA6)),
                    Booster.horizontalSpace(3),
                    Booster.dynamicFontSize(
                        label: commentLength.toString(),
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff7A8FA6)),
                    Booster.horizontalSpace(15),
                    if (postModel.authorId !=
                        user.getUserDetails()!.docID.toString())
                      InkWell(
                        onTap: () {
                          _postServices
                              .sharePost(
                                  user.getUserDetails()!.docID.toString(),
                                  postModel.docId.toString())
                              .then((value) {
                            getFlushBar(context,
                                title:
                                    'Post has been successfully shared on your timeline.');
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ImageIcon(AssetImage('assets/images/19.png'),
                              size: 15, color: Color(0xff7A8FA6)),
                        ),
                      ),
                    if (postModel.authorId !=
                        user.getUserDetails()!.docID.toString())
                      Booster.horizontalSpace(3),
                    if (postModel.authorId !=
                        user.getUserDetails()!.docID.toString())
                      Booster.dynamicFontSize(
                          label: (postModel.shareBy!.length - 1).toString(),
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff7A8FA6)),
                  ],
                ),
                Booster.dynamicFontSize(
                    label:
                        DateFormatter.dateFormatter(postModel.time!.toDate()),
                    fontSize: 9,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff989898)),
              ],
            ),
          ),
          Booster.verticalSpace(30),
        ],
      ),
    );
  }
}
