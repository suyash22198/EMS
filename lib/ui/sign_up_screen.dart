import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/constants/assets.dart';
import 'package:flutter_boiler_plate/constants/classes.dart';
import 'package:flutter_boiler_plate/constants/dimensions.dart';
import 'package:flutter_boiler_plate/constants/styling/button_styles/button_styles.dart';
import 'package:flutter_boiler_plate/constants/styling/container_styles/container_style.dart';
import 'package:flutter_boiler_plate/constants/styling/text_field_styles/auth_styles.dart';
import 'package:flutter_boiler_plate/widgets/border_container.dart';
import 'package:flutter_boiler_plate/widgets/custom_icon_button.dart';
import 'package:flutter_boiler_plate/widgets/custom_image_button.dart';
import 'package:flutter_boiler_plate/widgets/custom_text_field.dart';
import 'package:flutter_boiler_plate/widgets/vertical_gap.dart';

///Created by Naman Gupta on 20/4/21.

class SignUpScreen extends StatelessWidget {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: Dimensions.size_48,
                        horizontal: Dimensions.size_40),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            child: Icon(
                              Icons.supervised_user_circle_rounded,
                              size: 50,
                            ),
                          ),
                          VerticalGap(Dimensions.size_24),
                          BorderContainer(
                            CustomTextField(
                              _controller,
                              TextInputType.text,
                              AuthStyles.inputDecoration(
                                  hintText: "Please enter email id"),
                              AuthStyles.textStyle(),
                              onChanged: onChanged,
                            ),
                            ContainerStyle.getBorderContainerStyle(),
                          ),
                          VerticalGap(Dimensions.size_24),
                          BorderContainer(
                            CustomTextField(
                              _controller,
                              TextInputType.text,
                              AuthStyles.inputDecoration(
                                  hintText: "Please enter email id"),
                              AuthStyles.textStyle(),
                              onChanged: onChanged,
                            ),
                            ContainerStyle.getBorderContainerStyle(),
                          ),
                          VerticalGap(Dimensions.size_24),
                          BorderContainer(
                            CustomTextField(
                              _controller,
                              TextInputType.text,
                              AuthStyles.inputDecoration(
                                  hintText: "Please enter email id"),
                              AuthStyles.textStyle(),
                              onChanged: onChanged,
                            ),
                            ContainerStyle.getBorderContainerStyle(),
                          ),
                          VerticalGap(Dimensions.size_24),
                          BorderContainer(
                            CustomTextField(
                              _controller,
                              TextInputType.text,
                              AuthStyles.inputDecoration(
                                  hintText: "Please enter email id"),
                              AuthStyles.textStyle(),
                            ),
                            ContainerStyle.getBorderContainerStyle(),
                          ),
                          Spacer(),
                          /*CustomIconButton(
                            "Go back",
                            onLogin,
                            Icons.backspace_outlined,
                          )*/
                          CustomImageButton(
                              ButtonStyles.getImageButtonBoxDecoration(),
                              "Okay",
                              Assets.DEMO,
                              onLogin)
                        ])))));
  }

  void onChanged(String value) {}

  void onLogin(BuildContext context) {
    Navigator.popAndPushNamed(context, Classes.demoList);
  }
}
