import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/base/firebase_method.dart';
import 'package:flutter_boiler_plate/base/scaling.dart';
import 'package:flutter_boiler_plate/constants/colors.dart';
import 'package:flutter_boiler_plate/store/login/login.dart';
import 'package:flutter_boiler_plate/widgets/custom_button.dart';
import 'package:flutter_boiler_plate/widgets/custom_input_field.dart';
import 'package:flutter_boiler_plate/widgets/vertical_gap.dart';
import 'package:provider/provider.dart';

class PhoneAuthScreen extends StatelessWidget {

  const PhoneAuthScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Login login = context.watch<Login>();

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: Scaling.scaleByWidth(24)),
        color: AppColors.secondaryColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Phone Verification', 
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: Scaling.scaleByHeight(36),
                fontWeight: FontWeight.bold
              ),),
              VerticalGap(Scaling.scaleByHeight(24)),
              Text('Verify your Number for completing your registeration process', 
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: Scaling.scaleByHeight(22)
              ),),
              VerticalGap(Scaling.scaleByHeight(44)),
              CustomInputField(labelText: 'Enter phone number', controller: login.numberController, textInputType: TextInputType.number, onChanged: (){}, onTyping: (text){},),
              VerticalGap(Scaling.scaleByHeight(24)),
              CustomButton(title: 'Send Otp', onPress: (){
                print('send otp');
                FirebaseMethods().verifyNumber(login.numberController.text, context);
              })
              
            ],
          ),
        ),
      ),
    );
  }
}