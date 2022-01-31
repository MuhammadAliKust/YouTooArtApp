import 'package:booster/booster.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:you_2_art/infrastrucuture/models/connection.dart';
import 'package:you_2_art/infrastrucuture/models/talent.dart';
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

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: _talentServices.streamAllUsers(),
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
                  List<ConnectionModel> connectionList =
                      context.watch<List<ConnectionModel>>();
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
                                    backgroundImage:
                                        NetworkImage(list[i].image.toString()),
                                  ),
                                  Positioned.fill(
                                      bottom: -15,
                                      child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xffE9DAFF),
                                              borderRadius:
                                                  BorderRadius.circular(22),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 7,
                                                      vertical: 5),
                                              child: Booster.dynamicFontSize(
                                                  label: connectionList.length
                                                      .toString(),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ))),
                                ],
                              ),
                              Booster.verticalSpace(20),
                              Booster.dynamicFontSize(
                                  label: list[i].name.toString(),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                              Booster.verticalSpace(7),
                              Booster.dynamicFontSize(
                                  label: list[i]
                                      .categories
                                      .toString()
                                      .replaceAll(']', '')
                                      .replaceAll('[', ''),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff7A8FA6)),
                              Booster.verticalSpace(7),
                              Booster.dynamicFontSize(
                                  label: list[i].location.toString(),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff7A8FA6)),
                              Booster.verticalSpace(10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: AppButtonIcon(
                                        onTap: () {},
                                        Icons: Icons.add,
                                        backgroundcolor: Colors.white,
                                        shadowcolor: Color(0xffF1F1F1),
                                        textcolor: Colors.black),
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
            });
      },
    );
  }
}
