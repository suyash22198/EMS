import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/constants/classes.dart';
import 'package:flutter_boiler_plate/models/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseMethods {
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    print("credential $credential");

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future verifyNumber(String number, BuildContext context) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      timeout: Duration(seconds: 60),
      phoneNumber: '+91$number',
      verificationCompleted: (PhoneAuthCredential credential) {
        print('verficationComplete');
      },
      verificationFailed: (FirebaseAuthException e) {
        print('verificationFailed ${e.message}');
      },
      codeSent: (String verificationId, int? resendToken) {
        print('codeSent');
        Navigator.pushNamedAndRemoveUntil(
            context, Classes.otpScreen, (route) => false,
            arguments: verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print('codeAutoRetrievalTimeout');
      },
    );
  }

  Future storeUserDetail(UserModel user, String key) async {
    FirebaseDatabase database = FirebaseDatabase.instance;
    String url =
        'https://erp-system-ca10c-default-rtdb.asia-southeast1.firebasedatabase.app';
    database.databaseURL = url;
    DatabaseReference reference = database.ref(key);

    Map<String, Map> data = {};
    data[user.uid] = {
      "name": user.name,
      "email": user.email,
      "photoUrl": user.imageUrl,
      "number": user.number
    };

    await reference.update(data);
  }

  Future fetchStudentList() async {
    FirebaseDatabase.instance.databaseURL =
        'https://erp-system-ca10c-default-rtdb.asia-southeast1.firebasedatabase.app';
    DatabaseReference reference = FirebaseDatabase.instance.ref('Student');

    DataSnapshot snapshot = await reference.get();

    if (snapshot.value != null) {
      print(snapshot.value);
      return snapshot.value;
    }
  }
}
