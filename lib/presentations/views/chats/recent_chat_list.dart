import 'package:booster/booster.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:you_2_art/application/user_provider.dart';
import 'package:you_2_art/infrastrucuture/models/chatDetailsModel.dart';
import 'package:you_2_art/infrastrucuture/models/messagModel.dart';
import 'package:you_2_art/infrastrucuture/models/user.dart';
import 'package:you_2_art/infrastrucuture/services/chat_services.dart';
import 'package:you_2_art/infrastrucuture/services/user.dart';
import 'package:you_2_art/presentations/elements/custom_notification_tile.dart';

import 'messages.dart';

class RecentChatList extends StatefulWidget {
  @override
  _RecentChatListState createState() => _RecentChatListState();
}

class _RecentChatListState extends State<RecentChatList> {
  ChatServices _chatServices = ChatServices();
  bool initialized = false;
  UserModel userModel = UserModel();
  UserServices _userServices = UserServices();

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context);
    return Scaffold(
      body: _buildUI(context, user.getUserDetails()!),
    );
  }

  Widget _buildUI(BuildContext context, UserModel _userModel) {
    return Scaffold(
      body: _getUI(context, _userModel),
    );
  }

  Widget _getUI(BuildContext context, UserModel _model) {
    var user = Provider.of<UserProvider>(context);

    return Column(
      children: [
        Divider(),
        Booster.verticalSpace(5),
        Expanded(
          child: StreamProvider.value(
            value: _chatServices.streamChatList(
                myID: _model.docID.toString(), receiverID: ''),
            initialData: [ChatDetailsModel()],
            builder: (context, child) {
              return context.watch<List<ChatDetailsModel>>()[0].myID == null
                  ? Container(
                      height: MediaQuery.of(context).size.height - 150,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(child: CircularProgressIndicator()),
                        ],
                      ),
                    )
                  : context.watch<List<ChatDetailsModel>>().length != 0
                      ? ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount:
                              context.watch<List<ChatDetailsModel>>().length,
                          itemBuilder: (context, i) {
                            return StreamProvider.value(
                              value: _chatServices.getUnreadMessageCounter(
                                  myID: user.getUserDetails()!.docID.toString(),
                                  receiverID: context
                                      .watch<List<ChatDetailsModel>>()[i]
                                      .otherID
                                      .toString()),
                              initialData: [MessagesModel()],
                              builder: (unReadContext, child) {
                                return unReadContext
                                            .watch<List<MessagesModel>>() ==
                                        null
                                    ? CircularProgressIndicator()
                                    : StreamProvider.value(
                                        value: _userServices.fetchUserData(
                                            context
                                                .watch<
                                                    List<ChatDetailsModel>>()[i]
                                                .otherID
                                                .toString()),
                                        initialData: UserModel(),
                                        builder: (userContext, child) {
                                          return userContext
                                                      .watch<UserModel>()
                                                      .docID ==
                                                  null
                                              ? CircularProgressIndicator()
                                              : InkWell(
                                                  onTap: () {
                                                    ChatDetailsModel _model =
                                                        context.read<
                                                            List<
                                                                ChatDetailsModel>>()[i];
                                                    setState(() {});
                                                    // return;
                                                    pushNewScreen(context,
                                                        screen: MessagesView(
                                                          receiverID: _model
                                                              .otherID
                                                              .toString(),
                                                          myID: user
                                                              .getUserDetails()!
                                                              .docID
                                                              .toString(),
                                                        ),
                                                        withNavBar: false);
                                                  },
                                                  child: CustomNotificationTile(
                                                    image:
                                                    userContext
                                                        .watch<UserModel>()
                                                        .image
                                                        .toString(),
                                                    title: userContext
                                                            .watch<UserModel>()
                                                            .firstName
                                                            .toString() +
                                                        " " +
                                                        userContext
                                                            .watch<UserModel>()
                                                            .lastName
                                                            .toString(),
                                                    description: context
                                                            .watch<
                                                                List<
                                                                    ChatDetailsModel>>()[
                                                                i]
                                                            .recentMessage ??
                                                        "",
                                                    time: context
                                                        .watch<
                                                            List<
                                                                ChatDetailsModel>>()[
                                                            i]
                                                        .time
                                                    as Timestamp,
                                                    counter: unReadContext
                                                        .watch<
                                                            List<
                                                                MessagesModel>>()
                                                        .length,
                                                  ),
                                                );
                                        },
                                      );
                              },
                            );
                          })
                      : Text('No Data');
            },
          ),
        )
      ],
    );
  }
}
