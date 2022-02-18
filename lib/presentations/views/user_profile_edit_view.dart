import 'dart:io';

import 'package:booster/booster.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';
import 'package:you_2_art/application/upload_file_services.dart';
import 'package:you_2_art/application/user_provider.dart';
import 'package:you_2_art/configs/front_end_configs.dart';
import 'package:you_2_art/infrastrucuture/models/user.dart';
import 'package:you_2_art/infrastrucuture/services/user.dart';
import 'package:you_2_art/presentations/elements/app_button_shadow.dart';
import 'package:you_2_art/presentations/elements/auth_text_field.dart';
import 'package:you_2_art/presentations/elements/loading_widgets/loading_widget.dart';
import 'package:you_2_art/presentations/elements/navigation_dialog.dart';
import 'package:you_2_art/presentations/views/wrapper.dart';

class UserProfileEdit extends StatefulWidget {
  final bool fromLogin;

  UserProfileEdit(this.fromLogin);

  @override
  _UserProfileEditState createState() => _UserProfileEditState();
}

class _UserProfileEditState extends State<UserProfileEdit> {
  TextEditingController _firstNameController = TextEditingController();

  TextEditingController _lastNameController = TextEditingController();

  TextEditingController _cityController = TextEditingController();

  TextEditingController _stateController = TextEditingController();

  TextEditingController _shortBioController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  File? _image;

  bool isLoading = false;

  UploadFileServices _uploadFileServices = UploadFileServices();

  UserServices _userServices = UserServices();

  File? _image1;
  File? _image2;
  File? _image3;

  @override
  void initState() {
    var user = Provider.of<UserProvider>(context, listen: false);
    _firstNameController = TextEditingController(
        text: user.getUserDetails()!.firstName.toString());
    _lastNameController =
        TextEditingController(text: user.getUserDetails()!.lastName.toString());
    _cityController =
        TextEditingController(text: user.getUserDetails()!.city.toString());
    _stateController =
        TextEditingController(text: user.getUserDetails()!.state.toString());
    _shortBioController =
        TextEditingController(text: user.getUserDetails()!.shortBio.toString());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context, listen: false);
    return LoadingOverlay(
      isLoading: isLoading,
      color: FrontEndConfigs.kPrimaryColor.withOpacity(0.7),
      progressIndicator: LoadingWidget(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Text(
            "Edit Profile",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 21),
          ),
          actions: [
            if (!widget.fromLogin)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
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
              )
          ],
        ),
        bottomNavigationBar: Container(
          height: 65,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(22),
                topLeft: Radius.circular(22),
              ),
              color: Color(0xffFEB400)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (!widget.fromLogin) ...[
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Booster.dynamicFontSize(
                          label: 'Back',
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ] else ...[
                  Container()
                ],
                InkWell(
                  onTap: () {
                    // if (!_formKey.currentState!.validate()) {
                    //   return;
                    // }
                    isLoading = true;
                    setState(() {});
                    if (_image == null) {
                      if (_image1 == null &&
                          _image2 == null &&
                          _image3 == null) {
                        _updateData(UserModel(
                          city: _cityController.text,
                          isProfileCompleted: true,
                          docID: user.getUserDetails()!.docID.toString(),
                          shortBio: _shortBioController.text,
                          firstName: _firstNameController.text,
                          lastName: _lastNameController.text,
                          state: _stateController.text,
                          image: user.getUserDetails()!.image.toString(),
                          image1: user.getUserDetails()!.image1.toString(),
                          image2: user.getUserDetails()!.image2.toString(),
                          image3: user.getUserDetails()!.image3.toString(),
                        ));
                      } else if (_image1 != null &&
                          _image2 == null &&
                          _image3 == null) {
                        _uploadFileServices
                            .getUrl(context, file: _image1!)
                            .then((value) {
                          _updateData(UserModel(
                            city: _cityController.text,
                            isProfileCompleted: true,
                            shortBio: _shortBioController.text,
                            docID: user.getUserDetails()!.docID.toString(),
                            firstName: _firstNameController.text,
                            lastName: _lastNameController.text,
                            state: _stateController.text,
                            image: user.getUserDetails()!.image.toString(),
                            image1: value,
                            image2: user.getUserDetails()!.image2.toString(),
                            image3: user.getUserDetails()!.image3.toString(),
                          ));
                        });
                      } else if (_image1 == null &&
                          _image2 != null &&
                          _image3 == null) {
                        _uploadFileServices
                            .getUrl(context, file: _image2!)
                            .then((value) {
                          _updateData(UserModel(
                            city: _cityController.text,
                            isProfileCompleted: true,
                            shortBio: _shortBioController.text,
                            docID: user.getUserDetails()!.docID.toString(),
                            firstName: _firstNameController.text,
                            lastName: _lastNameController.text,
                            state: _stateController.text,
                            image: user.getUserDetails()!.image.toString(),
                            image1: user.getUserDetails()!.image1.toString(),
                            image2: value,
                            image3: user.getUserDetails()!.image3.toString(),
                          ));
                        });
                      } else if (_image1 == null &&
                          _image2 == null &&
                          _image3 != null) {
                        _uploadFileServices
                            .getUrl(context, file: _image3!)
                            .then((value) {
                          _updateData(UserModel(
                            city: _cityController.text,
                            isProfileCompleted: true,
                            shortBio: _shortBioController.text,
                            docID: user.getUserDetails()!.docID.toString(),
                            firstName: _firstNameController.text,
                            lastName: _lastNameController.text,
                            state: _stateController.text,
                            image: user.getUserDetails()!.image.toString(),
                            image1: user.getUserDetails()!.image1.toString(),
                            image2: user.getUserDetails()!.image2.toString(),
                            image3: value,
                          ));
                        });
                      } else if (_image1 != null &&
                          _image2 != null &&
                          _image3 != null) {
                        print("Called");
                        _uploadFileServices
                            .getUrl(context, file: _image1!)
                            .then((value1) {
                          _uploadFileServices
                              .getUrl(context, file: _image2!)
                              .then((value2) {
                            _uploadFileServices
                                .getUrl(context, file: _image3!)
                                .then((value3) {
                              _updateData(UserModel(
                                city: _cityController.text,
                                shortBio: _shortBioController.text,
                                isProfileCompleted: true,
                                docID: user.getUserDetails()!.docID.toString(),
                                firstName: _firstNameController.text,
                                lastName: _lastNameController.text,
                                state: _stateController.text,
                                image: user.getUserDetails()!.image.toString(),
                                image1: value1,
                                image2: value2,
                                image3: value3,
                              ));
                            });
                          });
                        });
                      } else {
                        print("Called");
                        if (_image1 == null &&
                            _image2 == null &&
                            _image3 == null) {
                          _uploadFileServices
                              .getUrl(context, file: _image!)
                              .then((value) {
                            _updateData(UserModel(
                              city: _cityController.text,
                              shortBio: _shortBioController.text,
                              firstName: _firstNameController.text,
                              isProfileCompleted: true,
                              lastName: _lastNameController.text,
                              state: _stateController.text,
                              image: value,
                              image1: user.getUserDetails()!.image1.toString(),
                              image2: user.getUserDetails()!.image2.toString(),
                              image3: user.getUserDetails()!.image3.toString(),
                            ));
                          });
                        } else if (_image1 != null &&
                            _image2 == null &&
                            _image3 == null) {
                          _uploadFileServices
                              .getUrl(context, file: _image1!)
                              .then((value) {
                            _updateData(UserModel(
                              city: _cityController.text,
                              shortBio: _shortBioController.text,
                              isProfileCompleted: true,
                              firstName: _firstNameController.text,
                              lastName: _lastNameController.text,
                              state: _stateController.text,
                              image: user.getUserDetails()!.image.toString(),
                              image1: value,
                              image2: user.getUserDetails()!.image2.toString(),
                              image3: user.getUserDetails()!.image3.toString(),
                            ));
                          });
                        } else if (_image1 == null &&
                            _image2 != null &&
                            _image3 == null) {
                          _uploadFileServices
                              .getUrl(context, file: _image2!)
                              .then((value) {
                            _updateData(UserModel(
                              city: _cityController.text,
                              shortBio: _shortBioController.text,
                              isProfileCompleted: true,
                              firstName: _firstNameController.text,
                              lastName: _lastNameController.text,
                              state: _stateController.text,
                              image: user.getUserDetails()!.image.toString(),
                              image1: user.getUserDetails()!.image1.toString(),
                              image2: value,
                              image3: user.getUserDetails()!.image3.toString(),
                            ));
                          });
                        } else if (_image1 == null &&
                            _image2 == null &&
                            _image3 != null) {
                          _uploadFileServices
                              .getUrl(context, file: _image3!)
                              .then((value) {
                            _updateData(UserModel(
                              city: _cityController.text,
                              shortBio: _shortBioController.text,
                              firstName: _firstNameController.text,
                              isProfileCompleted: true,
                              lastName: _lastNameController.text,
                              state: _stateController.text,
                              image: user.getUserDetails()!.image.toString(),
                              image1: user.getUserDetails()!.image1.toString(),
                              image2: user.getUserDetails()!.image2.toString(),
                              image3: value,
                            ));
                          });
                        } else if (_image1 != null &&
                            _image2 != null &&
                            _image3 != null) {
                          print("Called");
                          _uploadFileServices
                              .getUrl(context, file: _image1!)
                              .then((value1) {
                            _uploadFileServices
                                .getUrl(context, file: _image2!)
                                .then((value2) {
                              _uploadFileServices
                                  .getUrl(context, file: _image3!)
                                  .then((value3) {
                                _updateData(UserModel(
                                  city: _cityController.text,
                                  shortBio: _shortBioController.text,
                                  isProfileCompleted: true,
                                  firstName: _firstNameController.text,
                                  lastName: _lastNameController.text,
                                  state: _stateController.text,
                                  image:
                                      user.getUserDetails()!.image.toString(),
                                  image1: value1,
                                  image2: value2,
                                  image3: value3,
                                ));
                              });
                            });
                          });
                        }
                      }
                    }
                  },
                  child: Booster.dynamicFontSize(
                      label: 'Save',
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Booster.verticalSpace(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => getProfileImage(),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          height: 125,
                          width: 125,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.blue),
                          child: _image == null
                              ? Image.network(
                                  user.getUserDetails()!.image.toString(),
                                  fit: BoxFit.fill,
                                )
                              : Image.file(
                                  _image!,
                                  fit: BoxFit.fill,
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
                Booster.verticalSpace(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppButtonLarge(
                        onTap: () {
                          getProfileImage();
                        },
                        text: 'Upload Picture',
                        backgroundcolor: Colors.white,
                        shadowcolor: Color(0xffF1F1F1),
                        textcolor: Colors.black),
                  ],
                ),
                Booster.verticalSpace(45),
                Row(
                  children: [
                    Expanded(
                        child: AuthTextFieldBorder(
                      label: 'First Name',
                      number: 1,
                      validator: (val) =>
                          val.isEmpty ? "Field cannot be empty" : null,
                      controller: _firstNameController,
                    )),
                    Booster.horizontalSpace(10),
                    Expanded(
                        child: AuthTextFieldBorder(
                      label: 'Last Name',
                      number: 1,
                      controller: _lastNameController,
                      validator: (val) =>
                          val.isEmpty ? "Field cannot be empty" : null,
                    )),
                  ],
                ),
                Booster.verticalSpace(20),
                Row(
                  children: [
                    Expanded(
                        child: AuthTextFieldBorder(
                      label: 'City',
                      number: 1,
                      controller: _cityController,
                      validator: (val) =>
                          val.isEmpty ? "Field cannot be empty" : null,
                    )),
                    Booster.horizontalSpace(10),
                    Expanded(
                        child: AuthTextFieldBorder(
                      label: 'State',
                      number: 1,
                      controller: _stateController,
                      validator: (val) =>
                          val.isEmpty ? "Field cannot be empty" : null,
                    )),
                  ],
                ),
                Booster.verticalSpace(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Booster.dynamicFontSize(
                        label: 'Enter a short bio.',
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ],
                ),
                Booster.verticalSpace(30),
                AuthTextFieldBorder(
                    controller: _shortBioController,
                    validator: (val) =>
                        val.isEmpty ? "Field cannot be empty" : null,
                    label: 'Short Bio..',
                    number: 4),
                Booster.verticalSpace(20),
                Row(
                  children: [
                    Column(
                      children: [
                        Stack(
                          children: [
                            if (_image1 == null)
                              Container(
                                height: 108,
                                width: 108,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      user.getUserDetails()!.image1.toString(),
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.fill,
                                          colorFilter: ColorFilter.mode(
                                              Colors.red, BlendMode.colorBurn)),
                                    ),
                                  ),
                                  placeholder: (context, url) =>
                                      LoadingWidget(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ),
                            if ((user.getUserDetails()!.image1 == null))
                              Container(
                                height: 108,
                                width: 108,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image:
                                          AssetImage('assets/images/post.png'),
                                    )),
                              ),
                            if (_image1 != null)
                              Container(
                                height: 108,
                                width: 108,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: FileImage(_image1!),
                                    )),
                              ),
                            Positioned.fill(
                                bottom: 3,
                                child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: InkWell(
                                        onTap: () {
                                          getCoverImage1();
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Color(0x66FFFFFF),
                                            borderRadius:
                                                BorderRadius.circular(14),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 8),
                                            child: Booster.dynamicFontSize(
                                                label: 'Edit',
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                      ),
                                    ))),
                          ],
                        ),
                        Booster.verticalSpace(10),
                        Stack(
                          children: [
                            if (_image2 == null)
                              Container(
                                height: 108,
                                width: 108,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      user.getUserDetails()!.image2.toString(),
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.fill,
                                          colorFilter: ColorFilter.mode(
                                              Colors.red, BlendMode.colorBurn)),
                                    ),
                                  ),
                                  placeholder: (context, url) =>
                                      LoadingWidget(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ),
                            if ((user.getUserDetails()!.image2 == null))
                              Container(
                                height: 108,
                                width: 108,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image:
                                          AssetImage('assets/images/post.png'),
                                    )),
                              ),
                            if (_image2 != null)
                              Container(
                                height: 108,
                                width: 108,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: FileImage(_image2!),
                                    )),
                              ),
                            Positioned.fill(
                                bottom: 3,
                                child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: InkWell(
                                        onTap: () {
                                          getCoverImage2();
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Color(0x66FFFFFF),
                                            borderRadius:
                                                BorderRadius.circular(14),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 8),
                                            child: Booster.dynamicFontSize(
                                                label: 'Edit',
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                      ),
                                    ))),
                          ],
                        ),
                      ],
                    ),
                    Booster.horizontalSpace(10),
                    Expanded(
                      child: Stack(
                        children: [
                          if (_image3 == null)
                            Container(
                              height: 225,
                              child: CachedNetworkImage(
                                imageUrl:
                                    user.getUserDetails()!.image3.toString(),
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.fill,
                                        colorFilter: ColorFilter.mode(
                                            Colors.red, BlendMode.colorBurn)),
                                  ),
                                ),
                                placeholder: (context, url) => LoadingWidget(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          if ((user.getUserDetails()!.image3 == null))
                            Container(
                              height: 225,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage('assets/images/post.png'),
                                  )),
                            ),
                          if (_image3 != null)
                            Container(
                              height: 225,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: FileImage(_image3!),
                                  )),
                            ),
                          Positioned.fill(
                              bottom: 3,
                              child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: InkWell(
                                      onTap: () {
                                        getCoverImage3();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0x66FFFFFF),
                                          borderRadius:
                                              BorderRadius.circular(14),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 13, vertical: 8),
                                          child: Booster.dynamicFontSize(
                                              label: 'Edit',
                                              fontSize: 18,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ),
                                  ))),
                        ],
                      ),
                    ),
                  ],
                ),
                Booster.verticalSpace(25),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     Booster.dynamicFontSize(
                //         label: 'My work',
                //         fontSize: 21,
                //         fontWeight: FontWeight.w700),
                //   ],
                // ),
                // Booster.verticalSpace(10),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Row(
                //       children: [
                //         Booster.dynamicFontSize(
                //             label: 'Video :',
                //             fontSize: 16,
                //             fontWeight: FontWeight.w400,
                //             color: Color(0xff707070)),
                //         Booster.horizontalSpace(40),
                //         Booster.dynamicFontSize(
                //             label: 'My First Action Film',
                //             fontSize: 16,
                //             fontWeight: FontWeight.w400),
                //       ],
                //     ),
                //     Card(
                //       elevation: 5,
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(22),
                //       ),
                //       shadowColor: Color(0xffF1F1F1),
                //       child: Container(
                //         height: 35,
                //         width: 38,
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(22),
                //         ),
                //         child: Center(
                //             child: Icon(
                //           Icons.edit,
                //           color: Colors.black,
                //           size: 17,
                //         )),
                //       ),
                //     )
                //   ],
                // ),
                // Booster.verticalSpace(7),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Row(
                //       children: [
                //         Booster.dynamicFontSize(
                //             label: 'Photos :',
                //             fontSize: 16,
                //             fontWeight: FontWeight.w400,
                //             color: Color(0xff707070)),
                //         Booster.horizontalSpace(30),
                //         Booster.dynamicFontSize(
                //             label: 'Photoshoot Drive',
                //             fontSize: 16,
                //             fontWeight: FontWeight.w400),
                //       ],
                //     ),
                //     Card(
                //       elevation: 5,
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(22),
                //       ),
                //       shadowColor: Color(0xffF1F1F1),
                //       child: Container(
                //         height: 35,
                //         width: 38,
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(22),
                //         ),
                //         child: Center(
                //             child: Icon(
                //           Icons.edit,
                //           color: Colors.black,
                //           size: 17,
                //         )),
                //       ),
                //     )
                //   ],
                // ),
                // Booster.verticalSpace(10),
                // Row(
                //   children: [
                //     Booster.dynamicFontSize(
                //         label: 'Photos',
                //         fontSize: 16,
                //         fontWeight: FontWeight.w400,
                //         color: Color(0xff707070)),
                //     Icon(Icons.arrow_drop_down, color: Color(0xff707070)),
                //     Booster.horizontalSpace(13),
                //     Expanded(
                //         child: AuthTextFieldBorder(
                //       label: 'Enter Title',
                //       number: 1,
                //       controller: controller,
                //       validator: (val) =>
                //           val.isEmpty ? "Field cannot be empty" : null,
                //     )),
                //   ],
                // ),
                // Booster.verticalSpace(15),
                // Padding(
                //   padding: const EdgeInsets.only(left: 90),
                //   child: AuthTextFieldBorder(
                //     label: 'Enter Link',
                //     number: 1,
                //     controller: controller,
                //     validator: (val) =>
                //         val.isEmpty ? "Field cannot be empty" : null,
                //   ),
                // ),
                // Booster.verticalSpace(15),
                // Padding(
                //   padding: const EdgeInsets.only(left: 90),
                //   child: AuthTextFieldBorder(
                //     label: 'Brief Description (optional)',
                //     number: 1,
                //     controller: controller,
                //     validator: (val) =>
                //         val.isEmpty ? "Field cannot be empty" : null,
                //   ),
                // ),
                // Booster.verticalSpace(20),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     AppButtonShort(
                //         onTap: () {
                //           // if (!_formKey.currentState!.validate()) {
                //           //   return;
                //           // }
                //           if (_image == null) {
                //             if (_image1 == null &&
                //                 _image2 == null &&
                //                 _image3 == null) {
                //               _updateData(UserModel(
                //                 city: _cityController.text,
                //                 docID: user.getUserDetails()!.docID.toString(),
                //                 shortBio: _shortBioController.text,
                //                 firstName: _firstNameController.text,
                //                 lastName: _lastNameController.text,
                //                 state: _stateController.text,
                //                 image: user.getUserDetails()!.image.toString(),
                //                 image1:
                //                     user.getUserDetails()!.image1.toString(),
                //                 image2:
                //                     user.getUserDetails()!.image2.toString(),
                //                 image3:
                //                     user.getUserDetails()!.image3.toString(),
                //               ));
                //             } else if (_image1 != null &&
                //                 _image2 == null &&
                //                 _image3 == null) {
                //               _uploadFileServices
                //                   .getUrl(context, file: _image1!)
                //                   .then((value) {
                //                 _updateData(UserModel(
                //                   city: _cityController.text,
                //                   shortBio: _shortBioController.text,
                //                   docID:
                //                       user.getUserDetails()!.docID.toString(),
                //                   firstName: _firstNameController.text,
                //                   lastName: _lastNameController.text,
                //                   state: _stateController.text,
                //                   image:
                //                       user.getUserDetails()!.image.toString(),
                //                   image1: value,
                //                   image2:
                //                       user.getUserDetails()!.image2.toString(),
                //                   image3:
                //                       user.getUserDetails()!.image3.toString(),
                //                 ));
                //               });
                //             } else if (_image1 == null &&
                //                 _image2 != null &&
                //                 _image3 == null) {
                //               _uploadFileServices
                //                   .getUrl(context, file: _image2!)
                //                   .then((value) {
                //                 _updateData(UserModel(
                //                   city: _cityController.text,
                //                   shortBio: _shortBioController.text,
                //                   docID:
                //                       user.getUserDetails()!.docID.toString(),
                //                   firstName: _firstNameController.text,
                //                   lastName: _lastNameController.text,
                //                   state: _stateController.text,
                //                   image:
                //                       user.getUserDetails()!.image.toString(),
                //                   image1:
                //                       user.getUserDetails()!.image1.toString(),
                //                   image2: value,
                //                   image3:
                //                       user.getUserDetails()!.image3.toString(),
                //                 ));
                //               });
                //             } else if (_image1 == null &&
                //                 _image2 == null &&
                //                 _image3 != null) {
                //               _uploadFileServices
                //                   .getUrl(context, file: _image3!)
                //                   .then((value) {
                //                 _updateData(UserModel(
                //                   city: _cityController.text,
                //                   shortBio: _shortBioController.text,
                //                   docID:
                //                       user.getUserDetails()!.docID.toString(),
                //                   firstName: _firstNameController.text,
                //                   lastName: _lastNameController.text,
                //                   state: _stateController.text,
                //                   image:
                //                       user.getUserDetails()!.image.toString(),
                //                   image1:
                //                       user.getUserDetails()!.image1.toString(),
                //                   image2:
                //                       user.getUserDetails()!.image2.toString(),
                //                   image3: value,
                //                 ));
                //               });
                //             } else if (_image1 != null &&
                //                 _image2 != null &&
                //                 _image3 != null) {
                //               print("Called");
                //               _uploadFileServices
                //                   .getUrl(context, file: _image1!)
                //                   .then((value1) {
                //                 _uploadFileServices
                //                     .getUrl(context, file: _image2!)
                //                     .then((value2) {
                //                   _uploadFileServices
                //                       .getUrl(context, file: _image3!)
                //                       .then((value3) {
                //                     _updateData(UserModel(
                //                       city: _cityController.text,
                //                       shortBio: _shortBioController.text,
                //                       docID: user
                //                           .getUserDetails()!
                //                           .docID
                //                           .toString(),
                //                       firstName: _firstNameController.text,
                //                       lastName: _lastNameController.text,
                //                       state: _stateController.text,
                //                       image: user
                //                           .getUserDetails()!
                //                           .image
                //                           .toString(),
                //                       image1: value1,
                //                       image2: value2,
                //                       image3: value3,
                //                     ));
                //                   });
                //                 });
                //               });
                //             } else {
                //               print("Called");
                //               if (_image1 == null &&
                //                   _image2 == null &&
                //                   _image3 == null) {
                //                 _uploadFileServices
                //                     .getUrl(context, file: _image!)
                //                     .then((value) {
                //                   _updateData(UserModel(
                //                     city: _cityController.text,
                //                     shortBio: _shortBioController.text,
                //                     firstName: _firstNameController.text,
                //                     lastName: _lastNameController.text,
                //                     state: _stateController.text,
                //                     image: value,
                //                     image1: user
                //                         .getUserDetails()!
                //                         .image1
                //                         .toString(),
                //                     image2: user
                //                         .getUserDetails()!
                //                         .image2
                //                         .toString(),
                //                     image3: user
                //                         .getUserDetails()!
                //                         .image3
                //                         .toString(),
                //                   ));
                //                 });
                //               } else if (_image1 != null &&
                //                   _image2 == null &&
                //                   _image3 == null) {
                //                 _uploadFileServices
                //                     .getUrl(context, file: _image1!)
                //                     .then((value) {
                //                   _updateData(UserModel(
                //                     city: _cityController.text,
                //                     shortBio: _shortBioController.text,
                //                     firstName: _firstNameController.text,
                //                     lastName: _lastNameController.text,
                //                     state: _stateController.text,
                //                     image:
                //                         user.getUserDetails()!.image.toString(),
                //                     image1: value,
                //                     image2: user
                //                         .getUserDetails()!
                //                         .image2
                //                         .toString(),
                //                     image3: user
                //                         .getUserDetails()!
                //                         .image3
                //                         .toString(),
                //                   ));
                //                 });
                //               } else if (_image1 == null &&
                //                   _image2 != null &&
                //                   _image3 == null) {
                //                 _uploadFileServices
                //                     .getUrl(context, file: _image2!)
                //                     .then((value) {
                //                   _updateData(UserModel(
                //                     city: _cityController.text,
                //                     shortBio: _shortBioController.text,
                //                     firstName: _firstNameController.text,
                //                     lastName: _lastNameController.text,
                //                     state: _stateController.text,
                //                     image:
                //                         user.getUserDetails()!.image.toString(),
                //                     image1: user
                //                         .getUserDetails()!
                //                         .image1
                //                         .toString(),
                //                     image2: value,
                //                     image3: user
                //                         .getUserDetails()!
                //                         .image3
                //                         .toString(),
                //                   ));
                //                 });
                //               } else if (_image1 == null &&
                //                   _image2 == null &&
                //                   _image3 != null) {
                //                 _uploadFileServices
                //                     .getUrl(context, file: _image3!)
                //                     .then((value) {
                //                   _updateData(UserModel(
                //                     city: _cityController.text,
                //                     shortBio: _shortBioController.text,
                //                     firstName: _firstNameController.text,
                //                     lastName: _lastNameController.text,
                //                     state: _stateController.text,
                //                     image:
                //                         user.getUserDetails()!.image.toString(),
                //                     image1: user
                //                         .getUserDetails()!
                //                         .image1
                //                         .toString(),
                //                     image2: user
                //                         .getUserDetails()!
                //                         .image2
                //                         .toString(),
                //                     image3: value,
                //                   ));
                //                 });
                //               } else if (_image1 != null &&
                //                   _image2 != null &&
                //                   _image3 != null) {
                //                 print("Called");
                //                 _uploadFileServices
                //                     .getUrl(context, file: _image1!)
                //                     .then((value1) {
                //                   _uploadFileServices
                //                       .getUrl(context, file: _image2!)
                //                       .then((value2) {
                //                     _uploadFileServices
                //                         .getUrl(context, file: _image3!)
                //                         .then((value3) {
                //                       _updateData(UserModel(
                //                         city: _cityController.text,
                //                         shortBio: _shortBioController.text,
                //                         firstName: _firstNameController.text,
                //                         lastName: _lastNameController.text,
                //                         state: _stateController.text,
                //                         image: user
                //                             .getUserDetails()!
                //                             .image
                //                             .toString(),
                //                         image1: value1,
                //                         image2: value2,
                //                         image3: value3,
                //                       ));
                //                     });
                //                   });
                //                 });
                //               }
                //             }
                //           }
                //         },
                //         text: 'Save',
                //         color: Color(0xffFEB400)),
                //   ],
                // ),
                // Booster.verticalSpace(40),
                // Card(
                //   elevation: 5,
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(22),
                //   ),
                //   shadowColor: Color(0xffF1F1F1),
                //   child: Container(
                //     height: 35,
                //     width: 38,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(22),
                //     ),
                //     child: Center(
                //         child: Icon(
                //       Icons.add,
                //       color: Colors.black,
                //       size: 17,
                //     )),
                //   ),
                // ),
                Booster.verticalSpace(50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _updateData(UserModel userModel) {
    var user = Provider.of<UserProvider>(context, listen: false);
    _userServices.updateUserData(userModel).then((value) {
      isLoading = false;
      setState(() {});
      showNavigationDialog(context,
          message: 'Profile updated successfully.',
          buttonText: 'Okay', navigation: () {
        _userServices
            .fetchUserData(userModel.docID.toString())
            .first
            .then((value) {
          user.saveUserDetails(value);
        });
        Get.offAll(() => WrapperView());
      }, secondButtonText: 'secondButtonText', showSecondButton: false);
    });
  }

  Future getProfileImage() async {
    ImagePicker picker = ImagePicker();
    PickedFile? pickedFile;
    pickedFile = await picker.getImage(
      imageQuality: 20,
      source: ImageSource.gallery,
    );

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getCoverImage1() async {
    ImagePicker picker = ImagePicker();
    PickedFile? pickedFile;
    pickedFile = await picker.getImage(
      imageQuality: 20,
      source: ImageSource.gallery,
    );

    setState(() {
      if (pickedFile != null) {
        _image1 = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getCoverImage2() async {
    ImagePicker picker = ImagePicker();
    PickedFile? pickedFile;
    pickedFile = await picker.getImage(
      imageQuality: 20,
      source: ImageSource.gallery,
    );

    setState(() {
      if (pickedFile != null) {
        _image2 = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getCoverImage3() async {
    ImagePicker picker = ImagePicker();
    PickedFile? pickedFile;
    pickedFile = await picker.getImage(
      imageQuality: 20,
      source: ImageSource.gallery,
    );

    setState(() {
      if (pickedFile != null) {
        _image3 = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
}
