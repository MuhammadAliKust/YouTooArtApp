import 'dart:io';

import 'package:booster/booster.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';
import 'package:you_2_art/application/app_state.dart';
import 'package:you_2_art/application/upload_file_services.dart';
import 'package:you_2_art/configs/front_end_configs.dart';
import 'package:you_2_art/infrastrucuture/models/user.dart';
import 'package:you_2_art/infrastrucuture/services/user.dart';
import 'package:you_2_art/presentations/elements/app_button_shadow.dart';
import 'package:you_2_art/presentations/elements/app_button_short.dart';
import 'package:you_2_art/presentations/elements/auth_text_field.dart';
import 'package:you_2_art/presentations/elements/flush_bar.dart';
import 'package:you_2_art/presentations/elements/navigation_dialog.dart';

class CreateProfile extends StatefulWidget {
  final List<String> categoryList;
  final String number;
  final String userID;

  CreateProfile(
      {required this.categoryList, required this.number, required this.userID});

  @override
  _CreateProfileState createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  TextEditingController _firstNameController = TextEditingController();

  TextEditingController _lastNameController = TextEditingController();

  TextEditingController _cityController = TextEditingController();

  TextEditingController _stateController = TextEditingController();

  TextEditingController _shortBioController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  File? _image;

  UploadFileServices _uploadFileServices = UploadFileServices();

  UserServices _userServices = UserServices();

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AppState>(context);
    return LoadingOverlay(
      isLoading: state.getStateStatus() == StateStatus.IsBusy,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Booster.verticalSpace(20),
                    Booster.dynamicFontSize(
                        label: 'Almost There...',
                        fontSize: 25,
                        fontWeight: FontWeight.w700),
                    Booster.verticalSpace(40),
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
                                  ? Image.asset(
                                      'assets/images/images.png',
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
                                validator: (val) => val.isEmpty
                                    ? "Field cannot be empty"
                                    : null,
                                controller: _firstNameController,
                                label: 'First Name',
                                number: 1)),
                        Booster.horizontalSpace(10),
                        Expanded(
                            child: AuthTextFieldBorder(
                                validator: (val) => val.isEmpty
                                    ? "Field cannot be empty"
                                    : null,
                                controller: _lastNameController,
                                label: 'Last Name',
                                number: 1)),
                      ],
                    ),
                    Booster.verticalSpace(20),
                    Row(
                      children: [
                        Expanded(
                            child: AuthTextFieldBorder(
                                validator: (val) => val.isEmpty
                                    ? "Field cannot be empty"
                                    : null,
                                controller: _cityController,
                                label: 'City',
                                number: 1)),
                        Booster.horizontalSpace(10),
                        Expanded(
                            child: AuthTextFieldBorder(
                                validator: (val) => val.isEmpty
                                    ? "Field cannot be empty"
                                    : null,
                                controller: _stateController,
                                label: 'State',
                                number: 1)),
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
                        validator: (val) =>
                            val.isEmpty ? "Field cannot be empty" : null,
                        controller: _shortBioController,
                        label:
                            'Ex. Software engineer by week,script writer by weekend.',
                        number: 4),
                    Booster.verticalSpace(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AppButtonShort(
                            onTap: () {
                              if (_image == null) {
                                getFlushBar(context,
                                    title: "Kindly select profile image.");
                                return;
                              }
                              if (!_formKey.currentState!.validate()) {
                                return;
                              }
                              _createProfile(context);
                            },
                            text: 'Done',
                            color: FrontEndConfigs.kPrimaryColor),
                      ],
                    ),
                    Booster.verticalSpace(20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
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

  _createProfile(BuildContext context) {
    Provider.of<AppState>(context, listen: false)
        .stateStatus(StateStatus.IsBusy);
    _uploadFileServices.getUrl(context, file: _image!).then((value) {
      _userServices
          .addUserData(UserModel(
              categories: widget.categoryList,
              image: value,
              phoneNumber: widget.number,
              firstName: _firstNameController.text,
              lastName: _lastNameController.text,
              city: _cityController.text,
              state: _stateController.text,
              shortBio: _shortBioController.text,
              docID: widget.userID))
          .then((value) {
        Provider.of<AppState>(context, listen: false)
            .stateStatus(StateStatus.IsFree);
        showNavigationDialog(context,
            message: 'Profile has been created successfully.',
            buttonText: 'Okay', navigation: () {
          // Get.offAll(() => BottomNavBar());
        }, secondButtonText: 'secondButtonText', showSecondButton: false);
      });
    });
  }
}
