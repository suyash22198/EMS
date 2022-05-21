import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/base/scaling.dart';
import 'package:flutter_boiler_plate/constants/assets.dart';
import 'package:flutter_boiler_plate/constants/colors.dart';
import 'package:flutter_boiler_plate/store/login/login.dart';
import 'package:flutter_boiler_plate/widgets/horizontal_gap.dart';
import 'package:flutter_boiler_plate/widgets/progress.dart';
import 'package:flutter_boiler_plate/widgets/support_widget.dart';
import 'package:flutter_boiler_plate/widgets/vertical_gap.dart';
import 'package:provider/provider.dart';

///Created by Naman Gupta on 19/4/21.

class DrawerScreen extends StatefulWidget {
  DrawerScreen();

  @override
  State<StatefulWidget> createState() {
    return new DrawerScreenState();
  }
}

class DrawerScreenState extends State<DrawerScreen> {
  late Login login;

  @override
  void initState() {
    super.initState();
  }

  DrawerScreenState();

  @override
  Widget build(BuildContext context) {
    login = context.read<Login>();
    return Drawer(
      backgroundColor: AppColors.secondaryColor,
      shape: Border.all(color: Colors.white, width: 1),
      child: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              VerticalGap(MediaQuery.of(context).padding.top),
              Row(
                children: [
                  Container(
                      width: Scaling.scaleByWidth(70),
                      height: Scaling.scaleByHeight(70),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(login.user!.imageUrl)))),
                  HorizontalGap(Scaling.scaleByWidth(10)),
                  Text(
                    login.user!.name,
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: Scaling.scaleByHeight(18),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Container(
                child: Progress(),
              ),
              Container(),
              Container(
                child: SupportWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
