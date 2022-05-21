import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/base/firebase_method.dart';
import 'package:flutter_boiler_plate/constants/classes.dart';
import 'package:flutter_boiler_plate/constants/colors.dart';
import 'package:flutter_boiler_plate/store/attendance/attendance.dart';
import 'package:flutter_boiler_plate/store/register/register.dart';
import 'package:flutter_boiler_plate/widgets/custom_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class TeacherAttendanceScreen extends StatefulWidget {
  const TeacherAttendanceScreen({ Key? key }) : super(key: key);

  @override
  State<TeacherAttendanceScreen> createState() => _TeacherAttendanceScreenState();
}

class _TeacherAttendanceScreenState extends State<TeacherAttendanceScreen> {
  @override
  Widget build(BuildContext context) {
    Register register = Provider.of(context, listen: false);
    Attendance attendance = Provider.of(context, listen: false);
    register.getClassFromFirebase();
    return Scaffold(
      // list of class
      appBar: AppBar(title: Text('Class List'), backgroundColor: AppColors.primaryColor,),
      body: Container(
        color: AppColors.secondaryColor,
        padding: EdgeInsets.all(18),
        child: Observer(
          builder: (context) {
            return ListView.builder(
              itemCount: register.classList.length,
              itemBuilder: ((context, index) {
              return InkWell(
                onTap: (){
                  attendance.setStudentList(register.classList[index]);
                  attendance.getSubjectFromFirebase(register.classList[index]);
                  attendance.selectedClass = register.classList[index];
                  Navigator.pushNamed(context, Classes.subjectListScreen);
                },
                child: Container(
                  color: AppColors.primaryColor,
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(4),
                  child: CustomText(register.classList[index], TextStyle(color: Colors.white))),
              );
            }));
          }
        ),
      ),
    );
  }
}