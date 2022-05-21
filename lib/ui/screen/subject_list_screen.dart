import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/constants/classes.dart';
import 'package:flutter_boiler_plate/constants/colors.dart';
import 'package:flutter_boiler_plate/store/attendance/attendance.dart';
import 'package:flutter_boiler_plate/widgets/custom_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class SubjectListScreen extends StatefulWidget {
  const SubjectListScreen({ Key? key }) : super(key: key);

  @override
  State<SubjectListScreen> createState() => _SubjectListScreenState();
}

class _SubjectListScreenState extends State<SubjectListScreen> {
  @override
  Widget build(BuildContext context) {

    Attendance attendance = Provider.of(context, listen: false);

    return Scaffold(
      // list of class
      appBar: AppBar(title: Text('Subject'), backgroundColor: AppColors.primaryColor,),
      body: Container(
        color: AppColors.secondaryColor,
        padding: EdgeInsets.all(18),
        child: Observer(
          builder: (context) {
            return ListView.builder(
              itemCount: attendance.subjects.length,
              itemBuilder: ((context, index) {
              return InkWell(
                onTap: (){
                  attendance.selectedSubject = attendance.subjects[index];
                  Navigator.pushNamed(context, Classes.studentListScreen);
                },
                child: Container(
                  color: AppColors.primaryColor,
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(4),
                  child: CustomText(attendance.subjects[index], TextStyle(color: Colors.white))),
              );
            }));
          }
        ),
      ),
    );
  }
}