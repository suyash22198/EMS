import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/base/firebase_method.dart';
import 'package:flutter_boiler_plate/base/scaling.dart';
import 'package:flutter_boiler_plate/constants/assets.dart';
import 'package:flutter_boiler_plate/constants/classes.dart';
import 'package:flutter_boiler_plate/constants/colors.dart';
import 'package:flutter_boiler_plate/constants/strings.dart';
import 'package:flutter_boiler_plate/models/user_model.dart';
import 'package:flutter_boiler_plate/store/login/login.dart';
import 'package:flutter_boiler_plate/widgets/custom_button.dart';
import 'package:flutter_boiler_plate/widgets/horizontal_gap.dart';
import 'package:flutter_boiler_plate/widgets/vertical_gap.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class GoogleSignIN extends StatefulWidget {
  const GoogleSignIN({ Key? key }) : super(key: key);

  @override
  State<GoogleSignIN> createState() => _GoogleSignINState();
}

class _GoogleSignINState extends State<GoogleSignIN> {

  Login? login;

  @override
  Widget build(BuildContext context) {

    login = context.watch<Login>();

    return Scaffold(
      body: Observer(
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: Scaling.scaleByWidth(32)),
            color: AppColors.secondaryColor,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Google Signin', 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Scaling.scaleByHeight(36),
                    fontWeight: FontWeight.bold
                  ),),
                  VerticalGap(Scaling.scaleByHeight(24)),
                  Text('Sign in with your acadamic email address only', 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Scaling.scaleByHeight(22)
                  ),),
                  VerticalGap(Scaling.scaleByHeight(6)),
                  Text('Select any one below', style: TextStyle(color: AppColors.primaryColor, fontSize: 18, fontWeight: FontWeight.w400),),
                  VerticalGap(Scaling.scaleByHeight(6)),
                  Row(
                    children: [
                      Observer(
                        builder: (context) {
                          return Checkbox(
                            checkColor: AppColors.white,
                             fillColor: MaterialStateProperty.all(AppColors.primaryColor),
                            value: login!.isStudent, onChanged: (value){
                              if(value!){
                                login!.isTeacher = false;
                              } else{
                                login!.isTeacher = true;
                              }
                            login!.isStudent = value;
                          });
                        }
                      ),
                      HorizontalGap(Scaling.scaleByHeight(6)),
                      Text('Student', style: TextStyle(color: AppColors.white),)
                    ],
                  ),

                  VerticalGap(Scaling.scaleByHeight(6)),

                  Row(
                    children: [
                      Observer(
                        builder: (context) {
                          return Checkbox(
                            checkColor: AppColors.white,
                            fillColor: MaterialStateProperty.all(AppColors.primaryColor),

                            value: login!.isTeacher, onChanged: (value){
                            if(value!){
                              login!.isStudent = false;
                            } else{
                              login!.isStudent = true;
                            }
                            login!.isTeacher = value;
                          });
                        }
                      ),
                      HorizontalGap(Scaling.scaleByHeight(6)),
                      Text('Teacher', style: TextStyle(color: AppColors.white),)
                    ],
                  ),
                  VerticalGap(Scaling.scaleByHeight(24)),
                  Image.asset(Assets.GOOGLE, width: Scaling.scaleByWidth(40), height: Scaling.scaleByWidth(40),),
                  VerticalGap(Scaling.scaleByHeight(20)),
                  CustomButton(
                    onPress: () async {
                      print(Strings.GOOGLE_SIGNIN);
                      // FirebaseAuth.instance.signOut();
                      //   GoogleSignIn().signOut();
                     UserCredential userCredential = await FirebaseMethods().signInWithGoogle();
                     print('userCredential ${userCredential}');
                     if(userCredential.user != null){
                       login!.setUser(UserModel(uid: userCredential.user!.uid, name: userCredential.user!.displayName!, email: userCredential.user!.email!, imageUrl: userCredential.user!.photoURL!, isStudent: login!.isStudent));
                       FirebaseAuth.instance.signOut();
                        GoogleSignIn().signOut();
                       Navigator.pushNamedAndRemoveUntil(context, Classes.phoneAuth, (route) => false);
                     }
                    //  if(userCredential.user!.email!.contains('poornima.org') == 0){
                    //  } else{
                    //    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please sign in with acadmic email Id')));
                    //     FirebaseAuth.instance.signOut();
                    //     GoogleSignIn().signOut();
                    //  }
                    
                    
                    
                    // move to phone auth screen
                    
                    },
                    title: Strings.GOOGLE_SIGNIN,
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}