import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/base/firebase_method.dart';
import 'package:flutter_boiler_plate/constants/classes.dart';
import 'package:flutter_boiler_plate/constants/colors.dart';
import 'package:flutter_boiler_plate/models/user_model.dart';
import 'package:flutter_boiler_plate/store/login/login.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:sms_otp_auto_verify/sms_otp_auto_verify.dart';

class OTPScreen extends StatefulWidget {
  final String verificationId;

  const OTPScreen(
      {Key? key,
      required this.verificationId,
      })
      : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  int _otpCodeLength = 6;
  bool _isLoadingButton = false;
  bool _enableButton = false;
  String _otpCode = "";
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final intRegex = RegExp(r'\d+', multiLine: true);
  TextEditingController textEditingController =
      new TextEditingController(text: "");
  Map<String, dynamic>? registerData;
  @override
  void initState() {
    super.initState();
    _getSignatureCode();
    _startListeningSms();
  }

  @override
  void dispose() {
    super.dispose();
    SmsVerification.stopListening();
    SmsAutoFill().unregisterListener();
  }

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: AppColors.primaryColor),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  /// get signature code
  _getSignatureCode() async {
    String? signature = await SmsVerification.getAppSignature();
    print("signature $signature");
  }

  /// listen sms
  _startListeningSms() {
    SmsVerification.startListeningSms().then((message) {
      print('message is here $message');
      setState(() {
        _otpCode = SmsVerification.getCode(message, intRegex);
        print('otp is $_otpCode');
        textEditingController.text = _otpCode;
        _onOtpCallBack(_otpCode, true);
      });
    }).onError((error, stackTrace) {
      print('errror $error');
    });
  }

  _onSubmitOtp() {
    setState(() {
      _isLoadingButton = !_isLoadingButton;
      _verifyOtpCode(false);
    });
  }

  _onClickRetry() {
    _startListeningSms();
  }

  _onOtpCallBack(String otpCode, bool isAutofill) {
    setState(() {
      this._otpCode = otpCode;
      if (otpCode.length == _otpCodeLength && isAutofill) {
        _enableButton = false;
        _isLoadingButton = true;
        _verifyOtpCode(isAutofill);
      } else if (otpCode.length == _otpCodeLength && !isAutofill) {
        _enableButton = true;
        _isLoadingButton = false;
      } else {
        _enableButton = false;
      }
    });
  }

  _verifyOtpCode(bool isAutoFill) async {
    try{
      print("otp $_otpCode");
      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
          verificationId: widget.verificationId, smsCode: _otpCode);
      await _signInWithPhoneNumber(phoneAuthCredential);

      print("phoneAuthCredential $phoneAuthCredential");
    } catch(e){
    print("error $e");
    }
    
  }

  _signInWithPhoneNumber(AuthCredential credential) async {
     FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((userCredential) async {
          Login login = context.read<Login>();
          UserModel? user = login.user;
          user?.setNumber(login.numberController.text);
          user!.uid = FirebaseAuth.instance.currentUser!.uid;
          login.setUser(user);
          String key = login.isStudent ? 'Student' : 'Teacher';
          SharedPreferences preferences =  await SharedPreferences.getInstance();
          preferences.setString('uid', login.user!.uid);
          FirebaseMethods().storeUserDetail(login.user!, key);
          Navigator.pushNamedAndRemoveUntil(context, Classes.registerScreen, ((route) => false));
          print('usercredential $userCredential');
          
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Observer(builder: (context) {
                  return TextFieldPin(
                      textController: textEditingController,
                      autoFocus: true,
                      codeLength: _otpCodeLength,
                      alignment: MainAxisAlignment.center,
                      defaultBoxSize: 28.0,
                      margin: 10,
                      selectedBoxSize: 30.0,
                      textStyle: TextStyle(fontSize: 16),
                      defaultDecoration: _pinPutDecoration.copyWith(
                          border: Border.all(color: AppColors.primaryColor)),
                      selectedDecoration: _pinPutDecoration,
                      onChange: (code) {
                        print('code $code');
                        _onOtpCallBack(code, false);
                      });
                }),
                SizedBox(
                  height: 32,
                ),
                Container(
                  width: double.maxFinite,
                  child: MaterialButton(
                    onPressed: _enableButton ? _onSubmitOtp : null,
                    child: _setUpButtonChild(),
                    color: AppColors.primaryColor,
                    disabledColor: Colors.grey[500],
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  child: TextButton(
                    onPressed: _onClickRetry,
                    child: Text(
                      "Resend OTP",
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _setUpButtonChild() {
    if (_isLoadingButton) {
      return Container(
        width: 19,
        height: 19,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    } else {
      return Text(
        "Verify",
        style: TextStyle(color: Colors.white),
      );
    }
  }
}

class OTPArguments {
  final String? otpCode;
  final bool? isRegister;
  final String? verificationId;

  OTPArguments(
      {required this.otpCode,
      required this.isRegister,
      required this.verificationId});
}
