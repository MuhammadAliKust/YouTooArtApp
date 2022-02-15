import 'package:booster/booster.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:you_2_art/application/user_provider.dart';
import 'package:you_2_art/configs/front_end_configs.dart';
import 'package:you_2_art/infrastrucuture/models/friends_model.dart';
import 'package:you_2_art/infrastrucuture/models/user.dart';
import 'package:you_2_art/infrastrucuture/services/connection.dart';
import 'package:you_2_art/infrastrucuture/services/user.dart';
import 'package:you_2_art/presentations/views/other_profile_view.dart';

class MyFriendsView extends StatelessWidget {
  ConnectionServices _connectionServices = ConnectionServices();
  UserServices _userServices = UserServices();

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Friends List"),
        elevation: 0,
        backgroundColor: FrontEndConfigs.kPrimaryColor,
        centerTitle: true,
      ),
      body: StreamProvider.value(
        value: _connectionServices
            .streamMyFriends(user.getUserDetails()!.docID.toString()),
        initialData: [FriendsModel()],
        builder: (context, child) {
          List<FriendsModel> list = context.watch<List<FriendsModel>>();
          return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, i) {
                return StreamProvider.value(
                  value: _userServices.fetchUserData(list[i].id.toString()),
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
                                    Booster.verticalSpace(10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                                    fontWeight:
                                                        FontWeight.bold),
                                                Booster.verticalSpace(5),
                                                Booster.dynamicFontSize(
                                                    label: _userModel.city
                                                            .toString() +
                                                        " " +
                                                        _userModel.state
                                                            .toString(),
                                                    fontSize: 14,
                                                    color: Colors.grey),
                                              ],
                                            ),
                                          ],
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Get.to(() => OtherUserProfileView(
                                                _userModel));
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: FrontEndConfigs
                                                    .kPrimaryColor),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10.0,
                                                      vertical: 9),
                                              child: Booster.dynamicFontSize(
                                                  label: 'View Profile',
                                                  fontSize: 9,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Booster.verticalSpace(10),
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
