import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/constants/colors.dart';
import 'package:flutter_boiler_plate/constants/dimensions.dart';
import 'package:flutter_boiler_plate/constants/styling/button_styles/button_styles.dart';
import 'package:flutter_boiler_plate/utils/device/device_utils.dart';
import 'package:flutter_boiler_plate/widgets/custom_text.dart';

///Created by Naman Gupta on 21/4/21.

// this class returns button with an icon

class CustomIconButton extends StatelessWidget {
  final Function _onPressed;
  final String _text;
  final EdgeInsetsGeometry padding;
  final IconData _icon;
  final Color iconColor;
  final double iconSize;

  CustomIconButton(this._text, this._onPressed, this._icon,
      {this.padding = const EdgeInsets.all(0),
      this.iconColor = AppColors.white,
      this.iconSize = Dimensions.size_24});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DeviceUtils.getScreenWidtht(context),
      child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              padding: padding,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(Dimensions.size_10),
                ),
              )),
          onPressed: () => _onPressed(context),
          icon: Icon(
            _icon,
            color: iconColor,
            size: iconSize,
          ),
          label: Container(
            child: CustomText(
              _text,
              ButtonStyles.getButtonTextStyle(),
              textAlign: TextAlign.center,
            ),
          )),
    );
  }
}
