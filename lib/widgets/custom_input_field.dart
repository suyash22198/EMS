import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/base/scaling.dart';
import 'package:flutter_boiler_plate/constants/colors.dart';

class CustomInputField extends StatefulWidget {
  final String labelText;
  final bool isPassword;
  final Widget? icon;
  final TextEditingController controller;
  final Function? onChanged;
  final TextInputType? textInputType;
  final int? maxLength;
  final String? hintText;
  final Function? onTyping;
  const CustomInputField(
      {Key? key,
      this.onTyping,
      this.maxLength,
      this.hintText,
      required this.labelText,
      this.textInputType,
      required this.controller,
      this.onChanged,
      this.isPassword = false,
      this.icon})
      : super(key: key);

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
    int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        if (!hasFocus) {
          widget.onChanged!();
        }
      },
      child: TextField(
        onEditingComplete: () {
          if (widget.onChanged != null) {
            widget.onChanged!();
          }
        },
        controller: widget.controller,
        obscureText: widget.isPassword,
        keyboardType: widget.textInputType,
        cursorColor: AppColors.white,
        maxLength: widget.maxLength,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor, width: 1)
          ),
          // counterText: '$counter/10',
          counterStyle: TextStyle(color: Colors.white),
          floatingLabelStyle: TextStyle(color: AppColors.white.withOpacity(0.7)),
          suffixIcon: widget.icon,
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1)),
          contentPadding: EdgeInsets.zero,
          labelText: widget.labelText,
          labelStyle: TextStyle(
            color: AppColors.primaryColor,
              fontSize: Scaling.scaleByHeight(14)),
          hintText: widget.hintText,
        ),
        onChanged: (text) {
          widget.onTyping!(text);
        },
      ),
    );
  }
}
