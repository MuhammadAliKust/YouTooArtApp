import 'package:booster/booster.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:you_2_art/application/post_provider.dart';
import 'package:you_2_art/application/user_provider.dart';
import 'package:you_2_art/infrastrucuture/models/comment.dart';
import 'package:you_2_art/infrastrucuture/models/connection.dart';
import 'package:you_2_art/infrastrucuture/models/post.dart';
import 'package:you_2_art/infrastrucuture/models/talent.dart';
import 'package:you_2_art/infrastrucuture/services/comment.dart';
import 'package:you_2_art/infrastrucuture/services/connection.dart';
import 'package:you_2_art/infrastrucuture/services/post.dart';
import 'package:you_2_art/infrastrucuture/services/talent.dart';
import 'package:you_2_art/presentations/elements/auth_text_field_simple.dart';
import 'package:you_2_art/presentations/elements/post_card.dart';

class ActivityHome extends StatefulWidget {
  @override
  _ActivityHomeState createState() => _ActivityHomeState();
}

class _ActivityHomeState extends State<ActivityHome> {
  TalentServices _talentServices = TalentServices();

  PostServices _postServices = PostServices();

  CommentServices _commentServices = CommentServices();

  TextEditingController _controller = TextEditingController();

  ConnectionServices _connectionServices = ConnectionServices();
  List<PostModel> searchedPosts = [];

  bool isSearchingAllow = false;
  bool isSearched = false;

  void _searchedPosts(String val) async {
    var postList = Provider.of<SearchProviders>(context, listen: false);
    print(val);
    print("HI ${postList.getPostList().length}");
    searchedPosts.clear();
    for (var i in postList.getPostList()) {
      var lowerCaseString = i.postBody.toString().toLowerCase();

      var defaultCase = i.postBody.toString();

      if (lowerCaseString.contains(val) || defaultCase.contains(val)) {
        searchedPosts.add(i);
      } else {
        isSearched = true;
      }

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context);
    var post = Provider.of<SearchProviders>(context);
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
                    backgroundImage:
                        NetworkImage(user.getUserDetails()!.image.toString()),
                  ),
                  Booster.horizontalSpace(15),
                  Expanded(
                      child: AuthTextFieldSimple(
                    onChanged: (val) {
                      print("called");
                      _searchedPosts(val);
                      setState(() {});
                    },
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
                      value: _connectionServices.streamAcceptedConnection(
                          user.getUserDetails()!.docID.toString()),
                      initialData: [ConnectionModel()],
                      builder: (context, child) {
                        List<ConnectionModel> connections =
                            context.watch<List<ConnectionModel>>();
                        List<String> docIDs = connections
                            .map((e) => e.userId.toString())
                            .toList();
                        return StreamProvider.value(
                          value: _postServices.streamAllPosts(docIDs),
                          initialData: [PostModel()],
                          builder: (context, child) {
                            List<PostModel> list =
                                context.watch<List<PostModel>>();

                            return list[0].docId == null
                                ? Container(
                                    height: MediaQuery.of(context).size.height -
                                        150,
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Center(
                                            child: CircularProgressIndicator()),
                                      ],
                                    ),
                                  )
                                : list.length != 0
                                    ? searchedPosts.isEmpty
                                        ? isSearched == true
                                            ? Text('No Data')
                                            : ListView.builder(
                                                physics:
                                                    BouncingScrollPhysics(),
                                                itemCount: list.length,
                                                itemBuilder: (context, i) {
                                                  return StreamProvider.value(
                                                      value: _commentServices
                                                          .streamPostComment(
                                                              list[i]
                                                                  .docId
                                                                  .toString()),
                                                      initialData: [
                                                        CommentModel()
                                                      ],
                                                      builder:
                                                          (context, child) {
                                                        List<CommentModel>
                                                            commentList =
                                                            context.watch<
                                                                List<
                                                                    CommentModel>>();
                                                        return StreamProvider
                                                            .value(
                                                          value: _talentServices
                                                              .fetchUserData(list[
                                                                      i]
                                                                  .authorId
                                                                  .toString()),
                                                          initialData:
                                                              TalentModel(),
                                                          builder:
                                                              (context, child) {
                                                            TalentModel
                                                                userModel =
                                                                context.watch<
                                                                    TalentModel>();
                                                            post.savePostList(
                                                                list);
                                                            print(searchedPosts
                                                                .length);
                                                            return list[0].docId ==
                                                                        null ||
                                                                    userModel
                                                                            .docId ==
                                                                        null
                                                                ? CircularProgressIndicator()
                                                                : PostCard(
                                                                    talentModel:
                                                                        userModel,
                                                                    commentLength:
                                                                        commentList
                                                                            .length,
                                                                    postModel:
                                                                        list[
                                                                            i]);
                                                          },
                                                        );
                                                      });
                                                },
                                              )
                                        : ListView.builder(
                                            physics: BouncingScrollPhysics(),
                                            itemCount: searchedPosts.length,
                                            itemBuilder: (context, i) {
                                              return StreamProvider.value(
                                                  value: _commentServices
                                                      .streamPostComment(list[i]
                                                          .docId
                                                          .toString()),
                                                  initialData: [CommentModel()],
                                                  builder: (context, child) {
                                                    List<CommentModel>
                                                        commentList =
                                                        context.watch<
                                                            List<
                                                                CommentModel>>();
                                                    return StreamProvider.value(
                                                      value: _talentServices
                                                          .fetchUserData(list[i]
                                                              .authorId
                                                              .toString()),
                                                      initialData:
                                                          TalentModel(),
                                                      builder:
                                                          (context, child) {
                                                        TalentModel userModel =
                                                            context.watch<
                                                                TalentModel>();
                                                        post.savePostList(list);
                                                        print(searchedPosts
                                                            .length);
                                                        return PostCard(
                                                            talentModel:
                                                                userModel,
                                                            commentLength:
                                                                commentList
                                                                    .length,
                                                            postModel:
                                                                searchedPosts[
                                                                    i]);
                                                      },
                                                    );
                                                  });
                                            },
                                          )
                                    : Text("no Data");
                          },
                        );
                      })),
            ],
          ),
        ));
  }
}
