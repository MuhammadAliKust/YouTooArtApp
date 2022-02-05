import 'package:booster/booster.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:otp_autofill/otp_autofill.dart';
import 'package:provider/provider.dart';
import 'package:you_2_art/application/user_provider.dart';
import 'package:you_2_art/configs/front_end_configs.dart';
import 'package:you_2_art/infrastrucuture/services/user.dart';
import 'package:you_2_art/presentations/elements/app_button.dart';
import 'package:you_2_art/presentations/elements/auth_text_field.dart';
import 'package:you_2_art/presentations/elements/flush_bar.dart';
import 'package:you_2_art/presentations/views/choose_category_view.dart';
import 'package:you_2_art/presentations/views/user_profile.dart';

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

  final scaffoldKey = GlobalKey();
  OTPTextEditController controller = OTPTextEditController(codeLength: 6);
  late OTPInteractor _otpInteractor;
  UserServices _userServices = UserServices();

  @override
  void initState() {
    super.initState();
    _otpInteractor = OTPInteractor();
    _otpInteractor
        .getAppSignature()
        //ignore: avoid_print
        .then((value) => print('signature - $value'));
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: isLoading,
      child: Scaffold(
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
        body: Form(
          key: _formKey,
          child: ColorfulSafeArea(
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
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
                                  validator: (val) => val.isEmpty
                                      ? "Field cannot be empty"
                                      : null,
                                  controller: _numberController,
                                  label: 'Email Mobile Number',
                                  number: 1)),
                        ],
                      ),
                      Booster.verticalSpace(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              if (_numberController.text.isEmpty) {
                                getFlushBar(context,
                                    title: 'Kindly provide mobile number');
                                return;
                              }
                              verifyPhoneNumber(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Booster.dynamicFontSize(
                                  label: 'Get OTP',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffE70B89)),
                            ),
                          ),
                        ],
                      ),
                      Booster.verticalSpace(20),
                      AuthTextFieldBorder(
                          validator: (val) =>
                              val.isEmpty ? "Field cannot be empty" : null,
                          controller: controller,
                          label: 'Enter OTP Code',
                          number: 1),
                      // Row(
                      //   children: [
                      //     Expanded(
                      //       child: OTPContainer(),
                      //     ),
                      //     Booster.horizontalSpace(10),
                      //     Expanded(
                      //       child: OTPContainer(),
                      //     ),
                      //     Booster.horizontalSpace(10),
                      //     Expanded(
                      //       child: OTPContainer(),
                      //     ),
                      //     Booster.horizontalSpace(10),
                      //     Expanded(
                      //       child: OTPContainer(),
                      //     ),
                      //   ],
                      // ),
                      Booster.verticalSpace(40),
                      AppButton(
                        onTap: () {
                          if (controller.text.isEmpty) {
                            getFlushBar(context,
                                title: 'Kindly provide otp code.');
                            return;
                          }
                          _userServices
                              .checkUserExists("+92" + _numberController.text)
                              .first
                              .then((value) {
                            if (value.isNotEmpty) {
                              login(controller.text);
                            } else {
                              register(controller.text);
                            }
                          });
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
        ),
      ),
    );
  }

  String otp = "", authStatus = "";

  Future<void> verifyPhoneNumber(BuildContext context) async {
    await FirebaseAuth.instance
        .verifyPhoneNumber(
      phoneNumber: "+92" + _numberController.text,
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
        controller = OTPTextEditController(
          codeLength: 6,
          //ignore: avoid_print
          onCodeReceive: (code) {
            print("Code Recieved : $code");
          },
          otpInteractor: _otpInteractor,
        )..startListenUserConsent(
            (code) {
              final exp = RegExp(r'(\d{5})');
              return exp.stringMatch(code ?? '') ?? '';
            },
            strategies: [
              SampleStrategy(),
            ],
          );
        isLoading = false;
        setState(() {});
      },
      codeAutoRetrievalTimeout: (String verId) {
        verificationId = verId;
        isLoading = false;
        setState(() {
          authStatus = "TIMEOUT";
        });
      },
    )
        .catchError((val) {
      print(val.toString());
      isLoading = false;
      setState(() {});
    });
  }

  Future<void> register(String otp) async {
    isLoading = true;
    setState(() {});
    await FirebaseAuth.instance
        .signInWithCredential(PhoneAuthProvider.credential(
      verificationId: verificationId!,
      smsCode: otp,
    ))
        .then((value) {
      isLoading = false;
      setState(() {});
      Get.to(() => ChooseCategory(
          '+92' + _numberController.text, value.user!.uid.toString()));
    });
  }

  Future<void> login(String otp) async {
    isLoading = true;
    setState(() {});
    await FirebaseAuth.instance
        .signInWithCredential(PhoneAuthProvider.credential(
      verificationId: verificationId!,
      smsCode: otp,
    ))
        .then((value) {
      isLoading = false;
      setState(() {});
      print(value.user!.uid);
      _userServices
          .fetchUserData(value.user!.uid.toString())
          .first
          .then((value) {
        Provider.of<UserProvider>(context, listen: false)
            .saveUserDetails(value);
        Get.to(() => UserProfile());
      });
    });
  }

  Future<void> phoneSignIn({required String phoneNumber}) async {
    FirebaseAuth.instance
        .verifyPhoneNumber(
            phoneNumber: '+92' + _numberController.text,
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

class SampleStrategy extends OTPStrategy {
  @override
  Future<String> listenForCode() {
    return Future.delayed(
      const Duration(seconds: 4),
      () => 'Your code is 54321',
    );
  }
}
