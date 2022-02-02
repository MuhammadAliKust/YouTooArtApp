// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:booster/booster.dart';
// import 'package:you_2_art/presentations/elements/app_button_shadow.dart';
// import 'package:you_2_art/presentations/elements/app_button_short.dart';
// import 'package:you_2_art/presentations/elements/auth_text_field.dart';
//
// class UserProfileEdit extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         actions: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Row(
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Color(0xffFFF6E0),
//                     borderRadius: BorderRadius.circular(22),
//                   ),
//                   child: Padding(
//                     padding:
//                     const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
//                     child: Row(
//                       children: [
//                         Icon(
//                           CupertinoIcons.bell_fill,
//                           size: 17,
//                           color: Color(0xffFEB400),
//                         ),
//                         Booster.dynamicFontSize(
//                             label: '9+',
//                             fontSize: 12,
//                             color: Colors.black,
//                             fontWeight: FontWeight.w700),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Booster.horizontalSpace(7),
//                 Icon(Icons.menu, size: 22, color: Colors.black)
//               ],
//             ),
//           )
//         ],
//       ),
//       bottomNavigationBar:  Container(
//         height: 65,
//         width: MediaQuery.of(context).size.width,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.only(
//               topRight: Radius.circular(22),
//               topLeft: Radius.circular(22),
//             ),
//             color: Color(0xffFEB400)
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 30),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Booster.dynamicFontSize(
//                   label: 'Back',
//                   fontSize: 18,
//                   color: Colors.white,
//                   fontWeight: FontWeight.w700),
//               Booster.dynamicFontSize(
//                   label: 'Save',
//                   fontSize: 18,
//                   color: Colors.white,
//                   fontWeight: FontWeight.w700),
//             ],
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Booster.verticalSpace(10),
//               CircleAvatar(
//                 radius: 55,
//                 backgroundImage: AssetImage('assets/images/person.jpg'),
//               ),
//               Booster.verticalSpace(15),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   AppButtonLarge(onTap: (){},
//                       text: 'Change Picture',
//                       backgroundcolor: Colors.white,
//                       shadowcolor: Color(0xffF1F1F1),
//                       textcolor: Colors.black),
//                 ],
//               ),
//               Booster.verticalSpace(45),
//               Row(
//                 children: [
//                   Expanded(child: AuthTextFieldBorder(label: 'Pawan', number: 1)),
//                   Booster.horizontalSpace(10),
//                   Expanded(child: AuthTextFieldBorder(label: 'Kalyan', number: 1)),
//                 ],
//               ),
//               Booster.verticalSpace(20),
//               Row(
//                 children: [
//                   Expanded(child: AuthTextFieldBorder(label: 'Hyderabad', number: 1)),
//                   Booster.horizontalSpace(10),
//                   Expanded(child: AuthTextFieldBorder(label: 'Telangana', number: 1)),
//                 ],
//               ),
//               Booster.verticalSpace(20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Booster.dynamicFontSize(
//                       label: 'Enter a short bio.',
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500),
//                 ],
//               ),
//               Booster.verticalSpace(30),
//               AuthTextFieldBorder(label: 'Ex. Software engineer by week,script writer by weekend.', number: 4),
//               Booster.verticalSpace(20),
//               Row(
//                 children: [
//                   Column(
//                     children: [
//                       Stack(
//                         children: [
//                           Container(
//                             height: 108,
//                             width: 108,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(5),
//                                 image: DecorationImage(
//                                   fit: BoxFit.fill,
//                                   image: AssetImage('assets/images/post.png'),
//                                 )),
//                           ),
//                           Positioned.fill(
//                               bottom: 3,
//                               child: Align(
//                                   alignment: Alignment.bottomRight,
//                                   child: Padding(
//                                     padding: const EdgeInsets.symmetric(horizontal: 5),
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                         color: Color(0x66FFFFFF),
//                                         borderRadius: BorderRadius.circular(14),
//                                       ),
//                                       child: Padding(
//                                         padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
//                                         child: Booster.dynamicFontSize(
//                                             label: 'Edit',
//                                             fontSize: 16,
//                                             color: Colors.white,
//                                             fontWeight: FontWeight.w700),
//                                       ),
//                                     ),
//                                   ))),
//                         ],
//                       ),
//                       Booster.verticalSpace(10),
//                       Stack(
//                         children: [
//                           Container(
//                             height: 108,
//                             width: 108,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(5),
//                                 image: DecorationImage(
//                                   fit: BoxFit.fill,
//                                   image: AssetImage('assets/images/post.png'),
//                                 )),
//                           ),
//                           Positioned.fill(
//                               bottom: 3,
//                               child: Align(
//                                   alignment: Alignment.bottomRight,
//                                   child: Padding(
//                                     padding: const EdgeInsets.symmetric(horizontal: 5),
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                         color: Color(0x66FFFFFF),
//                                         borderRadius: BorderRadius.circular(14),
//                                       ),
//                                       child: Padding(
//                                         padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
//                                         child: Booster.dynamicFontSize(
//                                             label: 'Edit',
//                                             fontSize: 16,
//                                             color: Colors.white,
//                                             fontWeight: FontWeight.w700),
//                                       ),
//                                     ),
//                                   ))),
//                         ],
//                       ),
//                     ],
//                   ),
//                   Booster.horizontalSpace(10),
//                   Expanded(
//                     child: Stack(
//                       children: [
//                         Container(
//                           height: 225,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(5),
//                               image: DecorationImage(
//                                 fit: BoxFit.fill,
//                                 image: AssetImage('assets/images/post.png'),
//                               )),
//                         ),
//                         Positioned.fill(
//                             bottom: 3,
//                             child: Align(
//                                 alignment: Alignment.bottomRight,
//                                 child: Padding(
//                                   padding: const EdgeInsets.symmetric(horizontal: 5),
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                       color: Color(0x66FFFFFF),
//                                       borderRadius: BorderRadius.circular(14),
//                                     ),
//                                     child: Padding(
//                                       padding: const EdgeInsets.symmetric(horizontal: 13,vertical: 8),
//                                       child: Booster.dynamicFontSize(
//                                           label: 'Edit',
//                                           fontSize: 18,
//                                           color: Colors.white,
//                                           fontWeight: FontWeight.w700),
//                                     ),
//                                   ),
//                                 ))),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               Booster.verticalSpace(25),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Booster.dynamicFontSize(
//                       label: 'My work',
//                       fontSize: 21,
//                       fontWeight: FontWeight.w700),
//                 ],
//               ),
//               Booster.verticalSpace(10),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       Booster.dynamicFontSize(
//                           label: 'Video :',
//                           fontSize: 16,
//                           fontWeight: FontWeight.w400,
//                           color: Color(0xff707070)),
//                       Booster.horizontalSpace(40),
//                       Booster.dynamicFontSize(
//                           label: 'My First Action Film',
//                           fontSize: 16,
//                           fontWeight: FontWeight.w400),
//                     ],
//                   ),
//                   Card(
//                     elevation: 5,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(22),
//                     ),
//                     shadowColor: Color(0xffF1F1F1),
//                     child: Container(
//                       height: 35,
//                       width: 38,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(22),
//                       ),
//                       child: Center(child: Icon(Icons.edit,color: Colors.black,size: 17,)),
//                     ),
//                   )
//                 ],
//               ),
//               Booster.verticalSpace(7),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       Booster.dynamicFontSize(
//                           label: 'Photos :',
//                           fontSize: 16,
//                           fontWeight: FontWeight.w400,
//                           color: Color(0xff707070)),
//                       Booster.horizontalSpace(30),
//                       Booster.dynamicFontSize(
//                           label: 'Photoshoot Drive',
//                           fontSize: 16,
//                           fontWeight: FontWeight.w400),
//                     ],
//                   ),
//                   Card(
//                     elevation: 5,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(22),
//                     ),
//                     shadowColor: Color(0xffF1F1F1),
//                     child: Container(
//                       height: 35,
//                       width: 38,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(22),
//                       ),
//                       child: Center(child: Icon(Icons.edit,color: Colors.black,size: 17,)),
//                     ),
//                   )
//                 ],
//               ),
//               Booster.verticalSpace(10),
//               Row(
//                 children: [
//                   Booster.dynamicFontSize(
//                       label: 'Photos',
//                       fontSize: 16,
//                       fontWeight: FontWeight.w400,
//                       color: Color(0xff707070)),
//                   Icon(Icons.arrow_drop_down,color: Color(0xff707070)),
//                   Booster.horizontalSpace(13),
//                   Expanded(child: AuthTextFieldBorder(label: 'Enter Title', number: 1)),
//                 ],
//               ),
//               Booster.verticalSpace(15),
//               Padding(
//                 padding: const EdgeInsets.only(left: 90),
//                 child: AuthTextFieldBorder(label: 'Enter Link', number: 1),
//               ),
//               Booster.verticalSpace(15),
//               Padding(
//                 padding: const EdgeInsets.only(left: 90),
//                 child: AuthTextFieldBorder(label: 'Brief Description (optional)', number: 1),
//               ),
//               Booster.verticalSpace(20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   AppButtonShort(onTap: (){}, text: 'Save', color: Color(0xffFEB400)),
//                 ],
//               ),
//               Booster.verticalSpace(40),
//               Card(
//                 elevation: 5,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(22),
//                 ),
//                 shadowColor: Color(0xffF1F1F1),
//                 child: Container(
//                   height: 35,
//                   width: 38,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(22),
//                   ),
//                   child: Center(child: Icon(Icons.add,color: Colors.black,size: 17,)),
//                 ),
//               ),
//               Booster.verticalSpace(50),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
