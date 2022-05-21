import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/base/scaling.dart';
import 'package:flutter_boiler_plate/constants/classes.dart';
import 'package:flutter_boiler_plate/constants/colors.dart';
import 'package:flutter_boiler_plate/constants/strings.dart';
import 'package:flutter_boiler_plate/models/user_model.dart';
import 'package:flutter_boiler_plate/store/login/login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), () async {
      print('current user');
      if(FirebaseAuth.instance.currentUser != null){
        SharedPreferences preferences = await SharedPreferences.getInstance();
        String? uid = preferences.getString('uid');
        FirebaseDatabase.instance.databaseURL = 'https://erp-system-ca10c-default-rtdb.asia-southeast1.firebasedatabase.app';
        DatabaseReference reference = FirebaseDatabase.instance.ref('Teacher');
        DataSnapshot dataSnapshot =  await reference.get();
        print(dataSnapshot);
        Map<dynamic, dynamic> data = dataSnapshot.value as Map;
        print('user data :: $data');

        if(data != null && data.containsKey(uid)){
          // teacher
        Login login = context.read<Login>();
        UserModel user = UserModel(uid: uid!, name: data[uid]['name'], email: data[uid]['email'], imageUrl: data[uid]['photoUrl'], isStudent: false);
        user.setNumber(data[uid]['number']);
        login.setUser(user);
        login.isStudent = false;
        login.isTeacher = true;
        Navigator.pushNamedAndRemoveUntil(context, Classes.tabScreen, (route) => false);
        } else{
          // student
           DatabaseReference reference = FirebaseDatabase.instance.ref('Student');
        DataSnapshot dataSnapshot =  await reference.get();
        Map<dynamic, dynamic> data = dataSnapshot.value as Map;

        Login login = context.read<Login>();
        UserModel user = UserModel(uid: uid!, name: data[uid]['name'], email: data[uid]['email'], imageUrl: data[uid]['photoUrl'], isStudent: true);
        user.setNumber(data[uid]['number']);
        login.setUser(user);
        login.isStudent = true;
        login.isTeacher = false;
        Navigator.pushNamedAndRemoveUntil(context, Classes.tabScreen, (route) => false);
        }
      } else{
      Navigator.pushNamedAndRemoveUntil(context, Classes.googleSignin, (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Scaling.getHeight(context);
    Scaling.getWidth(context);
    return Scaffold(
      body: Container(
        color: AppColors.secondaryColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Strings.EDUCATION,
                style: TextStyle(
                    fontSize: Scaling.scaleByHeight(36),
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                Strings.EDUCATION_TAGLINE,
                style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontStyle: FontStyle.italic),
              )
            ],
          ),
        ),
      ),
    );
  }
}
