import 'dart:async';

import 'package:booster/booster.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:you_2_art/configs/front_end_configs.dart';
import 'package:you_2_art/infrastrucuture/models/chatDetailsModel.dart';
import 'package:you_2_art/infrastrucuture/models/messagModel.dart';
import 'package:you_2_art/infrastrucuture/services/chat_services.dart';

class MessagesView extends StatefulWidget {
  final String myID;
  final String receiverID;

  MessagesView({
    required this.receiverID,
    required this.myID,
  });

  @override
  _MessagesViewState createState() => _MessagesViewState();
}

class _MessagesViewState extends State<MessagesView> {
  ChatServices _chatServices = ChatServices();

  TextEditingController messageController = TextEditingController();

  ScrollController _scrollController = new ScrollController();
  int listLength = 0;
  bool callSetLength = true;

  void setLength(int i) {
    listLength = i;
    callSetLength = false;
    setState(() {});
  }

  int get getLength => listLength;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.receiverID);
    print(widget.myID);
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
        elevation: 0,
        backgroundColor: FrontEndConfigs.kPrimaryColor,
      ),
      body: _getUI(context),
    );
  }

  Widget _getUI(BuildContext context) {
    setUserID(
      widget.myID,
    );
    return Container(
      child: Column(
        children: [
          Divider(),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 14.0),
          //   child: Container(
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(10),
          //         border: Border.all(color: FrontEndConfigs.buttonColor)),
          //     height: 80,
          //     width: double.infinity,
          //     child: Row(
          //       children: [
          //         ClipRRect(
          //           borderRadius: BorderRadius.only(
          //             topLeft: Radius.circular(10),
          //             bottomLeft: Radius.circular(10),
          //           ),
          //           child: Image.asset(
          //             'assets/images/featureImge.jpg',
          //             fit: BoxFit.cover,
          //           ),
          //         ),
          //         HorizontalSpace(10),
          //         Expanded(
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Text(
          //                 "This message relates to following product:",
          //                 style: TextStyle(
          //                     fontWeight: FontWeight.bold, fontSize: 11),
          //               ),
          //               VerticalSpace(5),
          //               Text(
          //                 widget.productName,
          //                 style: TextStyle(
          //                     fontWeight: FontWeight.w600, fontSize: 15),
          //               ),
          //               Text(
          //                 "\$ ${widget.productPrice}",
          //                 style: TextStyle(
          //                     fontWeight: FontWeight.w600, fontSize: 14),
          //               ),
          //             ],
          //           ),
          //         )
          //       ],
          //     ),
          //   ),
          // ),
          Expanded(
            child: Container(
              child: StreamProvider.value(
                value: _chatServices.streamMessages(
                    myID: widget.myID, senderID: widget.receiverID),
                initialData: [MessagesModel()],
                builder: (context, child) {
                  Timer(
                      Duration(milliseconds: 300),
                      () => _scrollController.animateTo(
                          _scrollController.position.maxScrollExtent,
                          duration: Duration(milliseconds: 700),
                          curve: Curves.ease));
                  return context.watch<List<MessagesModel>>() == null
                      ? CircularProgressIndicator()
                      : ListView.builder(
                          // separatorBuilder: (_, i) {
                          //   return i == 0
                          //       ? Column(
                          //           children: [
                          //             Padding(
                          //               padding: const EdgeInsets.symmetric(
                          //                   horizontal: 14.0),
                          //               child: Container(
                          //                 decoration: BoxDecoration(
                          //                     borderRadius:
                          //                         BorderRadius.circular(10),
                          //                     border: Border.all(
                          //                         color: FrontEndConfigs
                          //                             .buttonColor)),
                          //                 height: 100,
                          //                 width: double.infinity,
                          //                 child: Row(
                          //                   children: [
                          //                     ClipRRect(
                          //                       borderRadius: BorderRadius.only(
                          //                         topLeft: Radius.circular(10),
                          //                         bottomLeft:
                          //                             Radius.circular(10),
                          //                       ),
                          //                       child: Image.asset(
                          //                         'assets/images/featureImge.jpg',
                          //                         fit: BoxFit.cover,
                          //                       ),
                          //                     ),
                          //                     HorizontalSpace(10),
                          //                     Expanded(
                          //                       child: Column(
                          //                         crossAxisAlignment:
                          //                             CrossAxisAlignment.start,
                          //                         children: [
                          //                           Text(
                          //                             "This message relates to following product:",
                          //                             style: TextStyle(
                          //                                 fontWeight:
                          //                                     FontWeight.bold,
                          //                                 fontSize: 11),
                          //                           ),
                          //                           VerticalSpace(10),
                          //                           Text(
                          //                             widget.productName,
                          //                             style: TextStyle(
                          //                                 fontWeight:
                          //                                     FontWeight.w600,
                          //                                 fontSize: 15),
                          //                           ),
                          //                           Text(
                          //                             "\$ ${widget.productPrice}",
                          //                             style: TextStyle(
                          //                                 fontWeight:
                          //                                     FontWeight.w600,
                          //                                 fontSize: 14),
                          //                           ),
                          //                         ],
                          //                       ),
                          //                     )
                          //                   ],
                          //                 ),
                          //               ),
                          //             ),
                          //             VerticalSpace(10),
                          //             MessageTile(
                          //               message: context
                          //                   .watch<List<MessagesModel>>()[i]
                          //                   .messageBody,
                          //               sendByMe: context
                          //                       .watch<List<MessagesModel>>()[i]
                          //                       .fromID ==
                          //                   user.uid,
                          //               time: context
                          //                   .watch<List<MessagesModel>>()[i]
                          //                   .time,
                          //             ),
                          //           ],
                          //         )
                          //       : SizedBox();
                          // },
                          controller: _scrollController,
                          itemCount:
                              context.watch<List<MessagesModel>>().length,
                          itemBuilder: (context, i) {
                            // if (callSetLength)
                            setList(context.watch<List<MessagesModel>>());
                            return MessageTile(
                              message: context
                                  .watch<List<MessagesModel>>()[i]
                                  .messageBody
                                  .toString(),
                              sendByMe: context
                                      .watch<List<MessagesModel>>()[i]
                                      .fromID ==
                                  widget.myID,
                              time:
                                  context.watch<List<MessagesModel>>()[i].time,
                            );
                          });
                },
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            width: MediaQuery.of(context).size.width,
            color: FrontEndConfigs.kPrimaryColor.withOpacity(0.3),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    style: TextStyle(color: Colors.black, fontSize: 13),
                    controller: messageController,
                    onChanged: (val) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                        hintText: "Type Here...",
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                        ),
                        focusedBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none)),
                  )),
                  SizedBox(
                    width: 16,
                  ),
                  IconButton(
                    onPressed: () {
                      if (messageController.text.isEmpty) {
                        return;
                      }
                      String message = messageController.text;
                      setState(() {});
                      Future.delayed(Duration(microseconds: 20), () {
                        messageController.clear();
                      });
                      Timer(
                          Duration(milliseconds: 300),
                          () => _scrollController.animateTo(
                              _scrollController.position.maxScrollExtent,
                              duration: Duration(milliseconds: 700),
                              curve: Curves.ease));
                      _chatServices
                          .addNewMessage(
                              receiverID: widget.receiverID,
                              myID: widget.myID,
                              detailsModel: ChatDetailsModel(
                                recentMessage: messageController.text,
                                date: DateFormat('MM/dd/yyyy')
                                    .format(DateTime.now()),
                                time: DateFormat('hh:mm a')
                                    .format(DateTime.now()),
                              ),
                              messageModel: MessagesModel(
                                  isRead: false,
                                  time: DateFormat('MM/dd/yyyy hh:mm a')
                                      .format(DateTime.now()),
                                  messageBody: messageController.text))
                          .then((value) => messageController.clear());
                    },
                    icon: Icon(
                      Icons.send,
                      color: messageController.text.isEmpty
                          ? Colors.grey
                          : Colors.black,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  markMessageAsRead({required List<MessagesModel> list, required String uid}) {
    list
        .map((e) => _chatServices.markMessageAsRead(
            myID: uid,
            receiverID: widget.receiverID,
            messageID: e.docID.toString()))
        .toList();
  }

  List<MessagesModel> list = [];
  String userID = '';

  void setList(List<MessagesModel> _list) {
    list = _list;
  }

  List<MessagesModel> get getList => list;

  void setUserID(String _userID) {
    userID = _userID;
  }

  String get getUserID => userID;

  @override
  void dispose() {
    // var user = Provider.of<User>(context, listen: false);
    // TODO: implement dispose
    markMessageAsRead(uid: getUserID, list: getList);
    super.dispose();
  }
}

class MessageTile extends StatelessWidget {
  final String message;
  final bool sendByMe;
  final time;
  final date;

  MessageTile(
      {required this.message, required this.sendByMe, this.time, this.date});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          sendByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(
              top: 2,
              bottom: 1,
              left: sendByMe ? 0 : 14,
              right: sendByMe ? 14 : 0),
          alignment: sendByMe ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            constraints: BoxConstraints(
                maxWidth: 0.6 * MediaQuery.of(context).size.width),
            margin: sendByMe
                ? EdgeInsets.only(left: 30)
                : EdgeInsets.only(right: 30),
            padding: EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 10),
            decoration: BoxDecoration(
              color: sendByMe
                  ? FrontEndConfigs.kPrimaryColor.withOpacity(0.6)
                  : FrontEndConfigs.kPrimaryColor,
              borderRadius: sendByMe
                  ? BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10))
                  : BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(message ?? '',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        height: 1.3,
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w300)),
                Booster.verticalSpace(5),
                Text(
                  'time',
                  style: TextStyle(fontSize: 9, color: Colors.white60),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
