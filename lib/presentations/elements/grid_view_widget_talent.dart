// import 'package:booster/booster.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';
// import 'package:you_2_art/application/user_provider.dart';
// import 'package:you_2_art/infrastrucuture/models/category.dart';
// import 'package:you_2_art/infrastrucuture/models/friends_model.dart';
// import 'package:you_2_art/infrastrucuture/models/user.dart';
// import 'package:you_2_art/infrastrucuture/services/category.dart';
// import 'package:you_2_art/infrastrucuture/services/connection.dart';
// import 'package:you_2_art/infrastrucuture/services/talent.dart';
// import 'package:you_2_art/presentations/views/other_profile_view.dart';
//
// import 'app_button_icon.dart';
//
// class GridViewWidget extends StatefulWidget {
//   GridViewState createState() => GridViewState();
// }
//
// class GridViewState extends State {
//   List<String> items = [];
//   TalentServices _talentServices = TalentServices();
//   ConnectionServices _connectionServices = ConnectionServices();
//   CategoryServices _categoryServices = CategoryServices();
//
//   @override
//   Widget build(BuildContext context) {
//     var user = Provider.of<UserProvider>(context);
//     return StreamProvider.value(
//       value: _connectionServices
//           .streamMyFriends(user.getUserDetails()!.docID.toString()),
//       initialData: [FriendsModel()],
//       builder: (context, child) {
//         List<FriendsModel> conList = context.watch<List<FriendsModel>>();
//         List<String> myList = conList.map((e) => e.id.toString()).toList();
//         print(myList);
//         return StreamProvider.value(
//           value: _talentServices.streamAllUsers(context),
//           initialData: [UserModel()],
//           builder: (context, child) {
//             List<UserModel> list = context.watch<List<UserModel>>();
//             return list[0].docID == null
//                 ? CircularProgressIndicator()
//                 : GridView.builder(
//                     physics: BouncingScrollPhysics(),
//                     shrinkWrap: true,
//                     gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//                         maxCrossAxisExtent: 200,
//                         childAspectRatio: 0.6,
//                         crossAxisSpacing: 10,
//                         mainAxisSpacing: 5),
//                     itemCount: list.length,
//                     itemBuilder: (BuildContext ctx, i) {
//                       return StreamProvider.value(
//                         value: _connectionServices
//                             .streamMyFriends(list[i].docID.toString()),
//                         initialData: [FriendsModel()],
//                         builder: (context, child) {
//                           List<FriendsModel> friendsList =
//                               context.watch<List<FriendsModel>>();
//
//                           return Center(
//                             child: InkWell(
//                               onTap: () {
//                                 Get.to(() => OtherUserProfileView(list[i]));
//                               },
//                               child: Card(
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(22),
//                                 ),
//                                 color: Color(0x17000000),
//                                 elevation: 5,
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(22),
//                                       color: Colors.white),
//                                   child: Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 15, vertical: 15),
//                                     child: Column(
//                                       children: [
//                                         Stack(
//                                           overflow: Overflow.visible,
//                                           children: [
//                                             CircleAvatar(
//                                               radius: 40,
//                                               backgroundImage: NetworkImage(
//                                                   list[i].image.toString()),
//                                             ),
//                                             Positioned.fill(
//                                                 bottom: -15,
//                                                 child: Align(
//                                                     alignment:
//                                                         Alignment.bottomCenter,
//                                                     child: Container(
//                                                       decoration: BoxDecoration(
//                                                         color:
//                                                             Color(0xffE9DAFF),
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(22),
//                                                       ),
//                                                       child: Padding(
//                                                         padding:
//                                                             const EdgeInsets
//                                                                     .symmetric(
//                                                                 horizontal: 7,
//                                                                 vertical: 5),
//                                                         child: Booster
//                                                             .dynamicFontSize(
//                                                                 label: friendsList
//                                                                     .length
//                                                                     .toString(),
//                                                                 fontSize: 12,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .w700),
//                                                       ),
//                                                     ))),
//                                           ],
//                                         ),
//                                         Booster.verticalSpace(20),
//                                         Booster.dynamicFontSize(
//                                             label:
//                                                 list[i].firstName.toString() +
//                                                     " " +
//                                                     list[i].lastName.toString(),
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.w700),
//                                         Booster.verticalSpace(7),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             ...list[i].categories!.map((e) {
//                                               return StreamProvider.value(
//                                                 value: _categoryServices
//                                                     .streamCategoryByID(e),
//                                                 initialData: CategoryModel(),
//                                                 builder: (context, child) {
//                                                   return Booster.dynamicFontSize(
//                                                       label: " #" +
//                                                           context
//                                                               .watch<
//                                                                   CategoryModel>()
//                                                               .categoryName
//                                                               .toString(),
//                                                       fontSize: 12,
//                                                       fontWeight:
//                                                           FontWeight.w400,
//                                                       color: Color(0xff989898));
//                                                 },
//                                               );
//                                             }).toList(),
//                                           ],
//                                         ),
//                                         Booster.verticalSpace(7),
//                                         Booster.dynamicFontSize(
//                                             label: list[i].city.toString(),
//                                             fontSize: 13,
//                                             fontWeight: FontWeight.w400,
//                                             color: Color(0xff7A8FA6)),
//                                         Booster.verticalSpace(10),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             Expanded(
//                                               child: AppButtonIcon(
//                                                   onTap: () {
//                                                     _connectionServices
//                                                         .sendFriendRequest(
//                                                             otherID: list[i]
//                                                                 .docID
//                                                                 .toString(),
//                                                             myID: user
//                                                                 .getUserDetails()!
//                                                                 .docID
//                                                                 .toString());
//                                                   },
//                                                   Icons: Icons.add,
//                                                   backgroundcolor: Colors.white,
//                                                   shadowcolor:
//                                                       Color(0xffF1F1F1),
//                                                   textcolor: myList.contains(
//                                                           list[i]
//                                                               .docID
//                                                               .toString())
//                                                       ? Colors.grey
//                                                       : Colors.black),
//                                             ),
//                                             Booster.horizontalSpace(15),
//                                             Expanded(
//                                               child: AppButtonIcon(
//                                                   onTap: () {},
//                                                   Icons: Icons.mail,
//                                                   backgroundcolor: Colors.white,
//                                                   shadowcolor:
//                                                       Color(0xffF1F1F1),
//                                                   textcolor: Colors.black),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                       );
//                     });
//           },
//         );
//       },
//     );
//   }
// }
