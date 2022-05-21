import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/base/scaling.dart';
import 'package:flutter_boiler_plate/constants/colors.dart';
import 'package:flutter_boiler_plate/store/login/login.dart';
import 'package:flutter_boiler_plate/store/register/register.dart';
import 'package:flutter_boiler_plate/widgets/custom_button.dart';
import 'package:flutter_boiler_plate/widgets/custom_input_field.dart';
import 'package:flutter_boiler_plate/widgets/custom_text.dart';
import 'package:flutter_boiler_plate/widgets/project_dropdown.dart';
import 'package:flutter_boiler_plate/widgets/vertical_gap.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Register register = Provider.of(context, listen: false);
    Login login = Provider.of(context, listen: false);
    print("isstudent ${login.isStudent}");
    print("isteacher ${login.isTeacher}");
    register.getStreamFromFirebase();
    register.getClassFromFirebase();
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: Scaling.scaleByWidth(16)),
          width: double.infinity,
        color: AppColors.secondaryColor,
        child: SingleChildScrollView(
          child: Column(children: [
            VerticalGap(Scaling.scaleByHeight(12)),
            CustomText('Please fill your details here', TextStyle(color: AppColors.primaryColor, fontSize: Scaling.scaleByHeight(22))),
            VerticalGap(Scaling.scaleByHeight(14)),
            CustomInputField(labelText: 'Father name', controller: TextEditingController(),  onChanged: (){}, onTyping: (text){
              register.fatherName = text;
            },),
            VerticalGap(Scaling.scaleByHeight(14)),
            CustomInputField(labelText: 'Mother name', controller: TextEditingController(),  onChanged: (){}, onTyping: (text){
              register.motherName = text;
            },),
            VerticalGap(Scaling.scaleByHeight(14)),
             Observer(
              builder: (context) {
                return register.streamList.isEmpty ? Container() : ProjectDropDown(data: register.streamList, onChange: (value){
                  print("selected value $value");
                  register.stream = value;
                },);
              }
            ),
        
            VerticalGap(Scaling.scaleByHeight(14)),
             Observer(
              builder: (context) {
                return register.semesterList.isEmpty ? Container() : ProjectDropDown(data: register.semesterList, onChange: (value){
                  print("selected value $value");
                  register.semester = value;
                },);
              }
            ),
            VerticalGap(Scaling.scaleByHeight(14)),
            login.isStudent ?
             Observer(
              builder: (context) {
                return register.classList.isEmpty ? Container() : ProjectDropDown(data: register.classList, onChange: (value){
                  print("selected value $value");
                  register.className = value;
                },);
              }
            ) : Container(),
        
            VerticalGap(Scaling.scaleByHeight(14)),
        
            CustomButton(title: 'Submit', onPress: (){
              register.onSubmit(context);
            }),
            VerticalGap(Scaling.scaleByHeight(14)),
          ]),
        ),
          ),
      ),
    );
  }
}