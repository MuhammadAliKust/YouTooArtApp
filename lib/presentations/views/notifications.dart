import 'package:booster/booster.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:you_2_art/application/date_formatter.dart';
import 'package:you_2_art/application/user_provider.dart';
import 'package:you_2_art/configs/front_end_configs.dart';
import 'package:you_2_art/infrastrucuture/models/connection.dart';
import 'package:you_2_art/infrastrucuture/models/notification.dart';
import 'package:you_2_art/infrastrucuture/models/post.dart';
import 'package:you_2_art/infrastrucuture/services/comment.dart';
import 'package:you_2_art/infrastrucuture/services/connection.dart';
import 'package:you_2_art/infrastrucuture/services/notification.dart';
import 'package:you_2_art/infrastrucuture/services/post.dart';
import 'package:you_2_art/infrastrucuture/services/talent.dart';
import 'package:you_2_art/presentations/views/create_post.dart';

class NotificationsView extends StatelessWidget {
  TalentServices _talentServices = TalentServices();
  PostServices _postServices = PostServices();
  CommentServices _commentServices = CommentServices();
  TextEditingController _controller = TextEditingController();
  ConnectionServices _connectionServices = ConnectionServices();
  NotificationServices _notificationServices = NotificationServices();

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
              Booster.verticalSpace(5),
              Expanded(
                  child: StreamProvider.value(
                value: _connectionServices.streamAcceptedConnection(
                    user.getUserDetails()!.docID.toString()),
                initialData: [ConnectionModel()],
                builder: (context, child) {
                  List<ConnectionModel> list =
                      context.watch<List<ConnectionModel>>();
                  List<String> docID =
                      list.map((e) => e.userId.toString()).toList();
                  return StreamProvider.value(
                    value: _notificationServices.streamMyNotifications(docID),
                    initialData: [NotificationModel()],
                    builder: (context, child) {
                      List<NotificationModel> list =
                          context.watch<List<NotificationModel>>();

                      return list.length == 0
                          ? Text("NO Data")
                          : ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: list.length,
                              itemBuilder: (context, i) {
                                return list[i].docId == null
                                    ? Container()
                                    : ListTile(
                                        title: Text(list[i].body.toString()),
                                        subtitle: Text(DateFormatter.dateFormatter(
                                            list[i].time!.toDate())),
                                        leading:
                                            Icon(CupertinoIcons.bell_solid),
                                      );
                              },
                            );
                    },
                  );
                },
              )),
            ],
          ),
        ));
  }
}
