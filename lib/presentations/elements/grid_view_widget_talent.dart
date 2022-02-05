import 'package:booster/booster.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:you_2_art/application/user_provider.dart';
import 'package:you_2_art/infrastrucuture/models/category.dart';
import 'package:you_2_art/infrastrucuture/models/connection.dart';
import 'package:you_2_art/infrastrucuture/models/talent.dart';
import 'package:you_2_art/infrastrucuture/services/category.dart';
import 'package:you_2_art/infrastrucuture/services/connection.dart';
import 'package:you_2_art/infrastrucuture/services/talent.dart';

import 'app_button_icon.dart';

class GridViewWidget extends StatefulWidget {
  GridViewState createState() => GridViewState();
}

class GridViewState extends State {
  List<String> items = [];
  TalentServices _talentServices = TalentServices();
  ConnectionServices _connectionServices = ConnectionServices();
  CategoryServices _categoryServices = CategoryServices();

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context);
    return StreamProvider.value(
      value: _connectionServices
          .streamMyConnections(user.getUserDetails()!.docID.toString()),
      initialData: [ConnectionModel()],
      builder: (context, child) {
        List<ConnectionModel> conList = context.watch<List<ConnectionModel>>();
        List<String> myList = conList.map((e) => e.userId.toString()).toList();
        return StreamProvider.value(
          value: _talentServices.streamAllUsers(context),
          initialData: [TalentModel()],
          builder: (context, child) {
            List<TalentModel> list = context.watch<List<TalentModel>>();
            return GridView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 0.6,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 5),
                itemCount: list.length,
                itemBuilder: (BuildContext ctx, i) {
                  return StreamProvider.value(
                    value: _connectionServices
                        .streamAcceptedConnection(list[i].docId.toString()),
                    initialData: [ConnectionModel()],
                    builder: (context, child) {
                      List<ConnectionModel> myAcceptedConnections =
                          context.watch<List<ConnectionModel>>();

                      return StreamProvider.value(
                        value: _connectionServices
                            .streamMyConnections(list[i].docId.toString()),
                        initialData: [ConnectionModel()],
                        builder: (context, child) {
                          List<ConnectionModel> connectionList =
                              context.watch<List<ConnectionModel>>();
                          List<String> myConnections = connectionList
                              .map((e) => e.userId.toString())
                              .toList();

                          return Center(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22),
                              ),
                              color: Color(0x17000000),
                              elevation: 5,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(22),
                                    color: Colors.white),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 15),
                                  child: Column(
                                    children: [
                                      Stack(
                                        overflow: Overflow.visible,
                                        children: [
                                          CircleAvatar(
                                            radius: 40,
                                            backgroundImage: NetworkImage(
                                                list[i].image.toString()),
                                          ),
                                          Positioned.fill(
                                              bottom: -15,
                                              child: Align(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Color(0xffE9DAFF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              22),
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 7,
                                                          vertical: 5),
                                                      child: Booster
                                                          .dynamicFontSize(
                                                              label:
                                                                  connectionList
                                                                      .length
                                                                      .toString(),
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                    ),
                                                  ))),
                                        ],
                                      ),
                                      Booster.verticalSpace(20),
                                      Booster.dynamicFontSize(
                                          label: list[i].firstName.toString() +
                                              " " +
                                              list[i].lastName.toString(),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                      Booster.verticalSpace(7),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ...list[i].categories!.map((e) {
                                            return StreamProvider.value(
                                              value: _categoryServices
                                                  .streamCategoryByID(e),
                                              initialData: CategoryModel(),
                                              builder: (context, child) {
                                                return Booster.dynamicFontSize(
                                                    label: " #" +
                                                        context
                                                            .watch<
                                                                CategoryModel>()
                                                            .categoryName
                                                            .toString(),
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xff989898));
                                              },
                                            );
                                          }).toList(),
                                        ],
                                      ),
                                      Booster.verticalSpace(7),
                                      Booster.dynamicFontSize(
                                          label: list[i].city.toString(),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff7A8FA6)),
                                      Booster.verticalSpace(10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: AppButtonIcon(
                                                onTap: () {
                                                  if (!myList.contains(
                                                      list[i].docId.toString()))
                                                    _connectionServices
                                                        .addConnectionRequest(
                                                            otherID: list[i]
                                                                .docId
                                                                .toString(),
                                                            myID: user
                                                                .getUserDetails()!
                                                                .docID
                                                                .toString());
                                                },
                                                Icons: Icons.add,
                                                backgroundcolor: Colors.white,
                                                shadowcolor: Color(0xffF1F1F1),
                                                textcolor: myList.contains(
                                                        list[i]
                                                            .docId
                                                            .toString())
                                                    ? Colors.grey
                                                    : Colors.black),
                                          ),
                                          Booster.horizontalSpace(15),
                                          Expanded(
                                            child: AppButtonIcon(
                                                onTap: () {},
                                                Icons: Icons.mail,
                                                backgroundcolor: Colors.white,
                                                shadowcolor: Color(0xffF1F1F1),
                                                textcolor: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                });
          },
        );
      },
    );
  }
}
