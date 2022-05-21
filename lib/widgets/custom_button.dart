import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/base/scaling.dart';
import 'package:flutter_boiler_plate/constants/colors.dart';

class CustomButton extends StatelessWidget {
  final Function onPress;
  final String title;
  const CustomButton({ Key? key, required this.title, required this.onPress }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPress(),
      child: Container(
        decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(8)
        ),
        padding: EdgeInsets.symmetric(vertical: Scaling.scaleByHeight(14), horizontal: Scaling.scaleByWidth(28)),
        child: Text(title, style: TextStyle(
          color: Colors.white
        ),),
      ),
    );
  }
}