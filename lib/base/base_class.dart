import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/constants/classes.dart';
import 'package:flutter_boiler_plate/constants/colors.dart';
import 'package:flutter_boiler_plate/constants/dimensions.dart';
import 'package:flutter_boiler_plate/data/shared_pref/my_shared_preference.dart';
import 'package:flutter_boiler_plate/routing.dart';
import 'package:flutter_boiler_plate/ui/drawer/drawer_screen.dart';
import 'package:flutter_boiler_plate/utils/device/logger.dart';
import 'package:flutter_boiler_plate/widgets/alert_layput_dialog.dart';

///Created by Naman Gupta on 19/4/21.

class BaseClass extends State {
  bool appBarVisibility = false;
  bool backButtonVisibility = false;
  Color backgroundColor = AppColors.white;
  bool isLoading = false;
  bool drawerVisibility = false;
  int drawerSeletedOptionIndex = 0;
  String appBarTitle = "";
  String appBarSubTitle = "";
  bool appBarLeadingIconVisibility = true;
  bool appBarTitleCenter = false;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void setIsLoading(bool isLoading) {
    setState(() {
      this.isLoading = isLoading;
    });
  }

  static void logout(context) {
    MySharedPreference.clearAllData();
    Navigator.pushNamedAndRemoveUntil(
        context, Classes.splashScreen, (route) => false);
  }

  void showInfoBar(String title) {
    scaffoldKey.currentState!.showSnackBar(SnackBar(
      duration: Duration(seconds: 3),
      backgroundColor: AppColors.secondaryColor,
      content: Text(
        title,
      ),
    ));
  }

  void setDrawerVisibility(bool drawerVisibility,
      {int? drawerSeletedOptionIndex}) {
    setState(() {
      this.drawerVisibility = drawerVisibility;
      this.drawerSeletedOptionIndex = drawerSeletedOptionIndex!;
    });
  }

  setAppBarVisibility(
    bool appBarVisibility, {
    bool backButtonVisibility = false,
    Color backgroundColor = Colors.transparent,
    String appBarTitle = "",
    appBarLeadingIconVisibility = true,
    appBarTitleCenter = false,
  }) {
    this.setState(() {
      this.appBarVisibility = appBarVisibility;
      this.backButtonVisibility = backButtonVisibility;
      this.backgroundColor = backgroundColor;
      this.appBarTitle = appBarTitle;
      this.appBarSubTitle = appBarSubTitle;
      this.appBarLeadingIconVisibility = appBarLeadingIconVisibility;
      this.appBarTitleCenter;
    });
  }

  Widget? setBody() {}

  void makeFavourite(String msg) {
    //setAppBarIcon(Assets.redStar);
  }

  void makeUnfavourite() {
    // setAppBarIcon(Assets.unfil_star);
  }

  PreferredSizeWidget getAppBar() {
    return AppBar(
      toolbarHeight: 80,
      title: !backButtonVisibility
          ? Text(
              "Flutter",
            )
          : Text(""),
      centerTitle: true,
      backgroundColor: backgroundColor,
      leading: backButtonVisibility
          ? GestureDetector(
              onTap: () {
                try {
                  if (Navigator.canPop(context)) {
                    Navigator.of(context).pop("result");
                  }
                } catch (error) {}
              },
              child: Container(
                  padding: EdgeInsets.all(Dimensions.size_4),
                  child: Icon(
                    Icons.keyboard_backspace,
                    color: AppColors.secondaryColor,
                    size: Dimensions.size_28,
                  )),
            )
          : Container(),
      elevation: 0,
    );
  }

  void showAlert(String title, String subTitle,
      {showIcon = true, showContactAdmin = true}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialogLayout(
          title,
          subTitle,
          showIcon: showIcon,
          showContactAdmin: showContactAdmin,
        );
      },
    );
  }

  void handleDrawerFunctionality() {
    if (scaffoldKey.currentState!.isDrawerOpen)
      scaffoldKey.currentState!.openEndDrawer();
    else
      scaffoldKey.currentState!.openDrawer();
  }

  bool getLoaderState() {
    return isLoading;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
          child: Stack(
        // overflow: Overflow.visible,
        children: [
          if (isLoading)
            Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.black12,
                        child: Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 3.0,
                          ),
                        ),
                      ),
                    ),
                  ]),
            )
          else
            setBody()!
        ],
      )),
      appBar: appBarVisibility ? getAppBar() : null,
      drawer: drawerVisibility
          ? DrawerScreen()
          : null,
    );
  }

  
}
