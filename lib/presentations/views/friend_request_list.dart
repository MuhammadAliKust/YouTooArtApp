import 'package:booster/booster.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:you_2_art/application/user_provider.dart';
import 'package:you_2_art/configs/front_end_configs.dart';
import 'package:you_2_art/infrastrucuture/models/friend_request.dart';
import 'package:you_2_art/infrastrucuture/models/user.dart';
import 'package:you_2_art/infrastrucuture/services/connection.dart';
import 'package:you_2_art/infrastrucuture/services/user.dart';

class FriendRequestList extends StatelessWidget {
  ConnectionServices _connectionServices = ConnectionServices();
  UserServices _userServices = UserServices();

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context);
    print(user.getUserDetails()!.docID.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text("Friend Requests"),
        elevation: 0,
        backgroundColor: FrontEndConfigs.kPrimaryColor,
        centerTitle: true,
      ),
      body: StreamProvider.value(
        value: _connectionServices
            .streamFriendRequests(user.getUserDetails()!.docID.toString()),
        initialData: [FriendRequestModel()],
        builder: (context, child) {
          List<FriendRequestModel> list =
              context.watch<List<FriendRequestModel>>();
          return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, i) {
                return StreamProvider.value(
                  value: _userServices.fetchUserData(list[i].myId.toString()),
                  initialData: UserModel(),
                  builder: (context, child) {
                    UserModel _userModel = context.watch<UserModel>();
                    print(_userModel.firstName);
                    return _userModel.state == null
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: FrontEndConfigs.kPrimaryColor),
                              ),
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 15),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              _userModel.image.toString()),
                                        ),
                                        Booster.horizontalSpace(10),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Booster.dynamicFontSize(
                                                label: _userModel.firstName
                                                        .toString() +
                                                    " " +
                                                    _userModel.lastName
                                                        .toString(),
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                            Booster.verticalSpace(5),
                                            Booster.dynamicFontSize(
                                                label: _userModel.city
                                                        .toString() +
                                                    " " +
                                                    _userModel.state.toString(),
                                                fontSize: 14,
                                                color: Colors.grey),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Booster.verticalSpace(20),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: InkWell(
                                            onTap: () async {
                                              await _connectionServices
                                                  .deleteData(
                                                      list[i].docId.toString());
                                            },
                                            child: Container(
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: FrontEndConfigs
                                                          .kPrimaryColor)),
                                              child: Center(
                                                child: Booster.dynamicFontSize(
                                                    label: 'Reject',
                                                    fontSize: 18,
                                                    color: FrontEndConfigs
                                                        .kPrimaryColor),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Booster.horizontalSpace(20),
                                        Expanded(
                                          child: InkWell(
                                            onTap: () async {
                                              await _connectionServices
                                                  .acceptFriendRequest(
                                                      myID: user
                                                          .getUserDetails()!
                                                          .docID
                                                          .toString(),
                                                      otherID: list[i]
                                                          .myId
                                                          .toString(),
                                                      docID: list[i]
                                                          .docId
                                                          .toString());
                                            },
                                            child: Container(
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: FrontEndConfigs
                                                      .kPrimaryColor),
                                              child: Center(
                                                child: Booster.dynamicFontSize(
                                                    label: 'Accept',
                                                    fontSize: 18,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                  },
                );

                // return ListTile(
                //   leading: Text(list[i].docId.toString()),
                //   trailing: IconButton(
                //     icon: Icon(Icons.add),
                //     onPressed: ()async {

                //     },
                //   ),
                // );
              });
        },
      ),
    );
  }
}
