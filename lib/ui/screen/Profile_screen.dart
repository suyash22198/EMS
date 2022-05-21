import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/base/scaling.dart';
import 'package:flutter_boiler_plate/constants/assets.dart';
import 'package:flutter_boiler_plate/constants/classes.dart';
import 'package:flutter_boiler_plate/constants/colors.dart';
import 'package:flutter_boiler_plate/store/login/login.dart';
import 'package:flutter_boiler_plate/ui/drawer/drawer_screen.dart';
import 'package:flutter_boiler_plate/widgets/custom_button.dart';
import 'package:flutter_boiler_plate/widgets/vertical_gap.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Login login = context.read<Login>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.secondaryColor,
      ),
      drawer: DrawerScreen(),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: Scaling.scaleByWidth(32),
            vertical: Scaling.scaleByHeight(14)),
        width: double.infinity,
        color: AppColors.secondaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: Scaling.scaleByWidth(100),
              height: Scaling.scaleByHeight(100),
              decoration: BoxDecoration(
                image:
                    DecorationImage(image: NetworkImage(login.user!.imageUrl)),
                shape: BoxShape.circle,
              ),
            ),
            SingleChildScrollView(
              child: Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    VerticalGap(Scaling.scaleByHeight(24)),
                    Text(
                      'Username',
                      style: TextStyle(color: Colors.grey),
                    ),
                    VerticalGap(Scaling.scaleByHeight(6)),
                    Text(
                      login.user!.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: Scaling.scaleByHeight(24),
                          fontWeight: FontWeight.bold),
                    ),
                    VerticalGap(Scaling.scaleByHeight(22)),
                    Text(
                      'E-mail',
                      style: TextStyle(color: Colors.grey),
                    ),
                    VerticalGap(Scaling.scaleByHeight(6)),
                    Text(
                      login.user!.email,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: Scaling.scaleByHeight(24),
                          fontWeight: FontWeight.bold),
                    ),
                    VerticalGap(Scaling.scaleByHeight(22)),
                    Text(
                      'Phone Number',
                      style: TextStyle(color: Colors.grey),
                    ),
                    VerticalGap(Scaling.scaleByHeight(6)),
                    Text(
                      login.user!.number.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: Scaling.scaleByHeight(24),
                          fontWeight: FontWeight.bold),
                    ),
                    VerticalGap(Scaling.scaleByHeight(32)),
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: CustomButton(
                          title: 'Logout',
                          onPress: () async {
                            print('logout');
                            SharedPreferences preferences = await SharedPreferences.getInstance();
                            preferences.clear();
                            FirebaseAuth.instance.signOut();
                            Navigator.pushNamedAndRemoveUntil(context, Classes.googleSignin, (route) => false);
                          }),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
