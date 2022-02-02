import 'package:booster/booster.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:you_2_art/configs/front_end_configs.dart';
import 'package:you_2_art/presentations/elements/app_button.dart';
import 'package:you_2_art/presentations/elements/auth_text_field.dart';
import 'package:you_2_art/presentations/elements/login_view_container_otp.dart';
import 'package:you_2_art/presentations/views/choose_category_view.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController _numberController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController otpCode = TextEditingController();

  bool isLoading = false;

  String? verificationId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Booster.dynamicFontSize(
                label: 'By signing in, you are agree with our',
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: Color(0xff000000)),
            Booster.dynamicFontSize(
                label: ' Terms & Conditions',
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: Color(0xffE70B89),
                isUnderline: true),
          ],
        ),
      ),
      body: ColorfulSafeArea(
        color: FrontEndConfigs.kPrimaryColor,
        child: SingleChildScrollView(
          child: Column(children: [
            Material(
              elevation: 7,
              color: Color(0x0D6200EE),
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: FrontEndConfigs.kPrimaryColor,
                child: Column(
                  children: [
                    Booster.verticalSpace(70),
                    Image.asset('assets/images/logo.png',
                        height: 140, width: 230),
                    Booster.verticalSpace(90),
                    Booster.dynamicFontSize(
                        label: 'Connect. Collaborate. Create.',
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff8B6300)),
                    Booster.verticalSpace(10),
                  ],
                ),
              ),
            ),
            Booster.verticalSpace(35),
            Booster.dynamicFontSize(
                label: 'Enter mobile number and verify',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff000000)),
            Booster.verticalSpace(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                          boxShadow: FrontEndConfigs.boxShadow,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Booster.dynamicFontSize(
                                label: '+91',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff707070),
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: Color(0xff707070),
                                size: 30,
                              )
                            ],
                          ),
                        ),
                      ),
                      Booster.horizontalSpace(10),
                      Expanded(
                          child: AuthTextFieldBorder(
                              controller: _numberController,
                              label: 'Email Mobile Number',
                              number: 1)),
                    ],
                  ),
                  Booster.verticalSpace(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Booster.dynamicFontSize(
                          label: 'Get OTP',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffE70B89)),
                    ],
                  ),
                  Booster.verticalSpace(20),
                  Row(
                    children: [
                      Expanded(
                        child: OTPContainer(),
                      ),
                      Booster.horizontalSpace(10),
                      Expanded(
                        child: OTPContainer(),
                      ),
                      Booster.horizontalSpace(10),
                      Expanded(
                        child: OTPContainer(),
                      ),
                      Booster.horizontalSpace(10),
                      Expanded(
                        child: OTPContainer(),
                      ),
                    ],
                  ),
                  Booster.verticalSpace(40),
                  AppButton(
                    onTap: () {
                      // Get.to(() => ChooseCategory('123456', 'sdfjl32489kla'));
                      verifyPhoneNumber(context);
                    },
                    text: 'LOGIN',
                    color: FrontEndConfigs.kPrimaryColor,
                  ),
                  Booster.verticalSpace(10),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  String otp = "", authStatus = "";

  Future<void> verifyPhoneNumber(BuildContext context) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+923419527440",
      timeout: const Duration(seconds: 15),
      verificationCompleted: (AuthCredential authCredential) {
        setState(() {
          authStatus = "Your account is successfully verified";
        });
      },
      verificationFailed: (FirebaseAuthException authException) {
        setState(() {
          authStatus = "Authentication failed";
        });
      },
      codeSent: (String verId, int? forceCodeResent) {
        verificationId = verId;
        setState(() {
          authStatus = "OTP has been successfully send";
        });
        otpDialogBox(context).then((value) {});
      },
      codeAutoRetrievalTimeout: (String verId) {
        verificationId = verId;
        setState(() {
          authStatus = "TIMEOUT";
        });
      },
    );
  }

  // Future<void> verifyPhoneNumber(BuildContext context) async {
  //   await FirebaseAuth.instance.verifyPhoneNumber(
  //     phoneNumber: phoneNumber,
  //     timeout: const Duration(seconds: 15),
  //     verificationCompleted: (AuthCredential authCredential) {
  //       setState(() {
  //         authStatus = "Your account is successfully verified";
  //       });
  //     },
  //     verificationFailed: (FirebaseAuthException authException) {
  //       setState(() {
  //         authStatus = "Authentication failed";
  //       });
  //     },
  //     codeSent: (String verId, [int forceCodeResent]) {
  //       verificationId = verId;
  //       setState(() {
  //         authStatus = "OTP has been successfully send";
  //       });
  //       otpDialogBox(context).then((value) {});
  //     },
  //     codeAutoRetrievalTimeout: (String verId) {
  //       verificationId = verId;
  //       setState(() {
  //         authStatus = "TIMEOUT";
  //       });
  //     },
  //   );
  // }

  otpDialogBox(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: Text('Enter your OTP'),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(30),
                    ),
                  ),
                ),
                onChanged: (value) {
                  otp = value;
                },
              ),
            ),
            contentPadding: EdgeInsets.all(10.0),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  signIn(otp);
                },
                child: Text(
                  'Submit',
                ),
              ),
            ],
          );
        });
  }

  Future<void> signIn(String otp) async {
    await FirebaseAuth.instance
        .signInWithCredential(PhoneAuthProvider.credential(
      verificationId: verificationId!,
      smsCode: otp,
    ))
        .then((value) {
      Get.to(() => ChooseCategory('+923419527440', value.user!.uid.toString()));
    });
  }

  Future<void> phoneSignIn({required String phoneNumber}) async {
    FirebaseAuth.instance
        .verifyPhoneNumber(
            phoneNumber: "+923419527440",
            verificationCompleted: _onVerificationCompleted,
            verificationFailed: _onVerificationFailed,
            codeSent: _onCodeSent,
            codeAutoRetrievalTimeout: _onCodeTimeout)
        .catchError((e) {
      print(e.toString());
    });
  }

  _onVerificationCompleted(PhoneAuthCredential authCredential) async {
    print("verification completed ${authCredential.smsCode}");
    User? user = FirebaseAuth.instance.currentUser;
    setState(() {
      this.otpCode.text = authCredential.smsCode!;
    });
    if (authCredential.smsCode != null) {
      try {
        UserCredential credential =
            await user!.linkWithCredential(authCredential);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'provider-already-linked') {
          await FirebaseAuth.instance.signInWithCredential(authCredential);
        }
      }
      setState(() {
        isLoading = false;
      });
      // Navigator.pushNamedAndRemoveUntil(
      //     context, Constants.homeNavigate, (route) => false);
    }
  }

  _onVerificationFailed(FirebaseAuthException exception) {
    if (exception.code == 'invalid-phone-number') {
      showMessage("The phone number entered is invalid!");
    }
  }

  _onCodeSent(String verificationId, int? forceResendingToken) {
    this.verificationId = verificationId;
    print(forceResendingToken);
    print("code sent");
  }

  _onCodeTimeout(String timeout) {
    return null;
  }

  void showMessage(String errorMessage) {
    showDialog(
        context: context,
        builder: (BuildContext builderContext) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(errorMessage),
            actions: [
              TextButton(
                child: Text("Ok"),
                onPressed: () async {
                  Navigator.of(builderContext).pop();
                },
              )
            ],
          );
        }).then((value) {
      setState(() {
        isLoading = false;
      });
    });
  }
}
