import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/base/scaling.dart';
import 'package:flutter_boiler_plate/constants/colors.dart';
import 'package:flutter_boiler_plate/models/student.dart';
import 'package:flutter_boiler_plate/store/attendance/attendance.dart';
import 'package:flutter_boiler_plate/widgets/custom_button.dart';
import 'package:flutter_boiler_plate/widgets/custom_text.dart';
import 'package:flutter_boiler_plate/widgets/vertical_gap.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({Key? key}) : super(key: key);

  @override
  State<StudentListScreen> createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  List<bool> markAttendance = [];
  @override
  Widget build(BuildContext context) {
    Attendance attendance = Provider.of(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: Text('Student List'), backgroundColor: AppColors.primaryColor,),
      body: Observer(builder: (context) {
        return Container(
          color: AppColors.secondaryColor,
          child: attendance.studentList.isEmpty
              ? Container()
              : Column(
                children: [
                  VerticalGap(Scaling.scaleByHeight(28)),
                  Padding(padding: EdgeInsets.symmetric(horizontal: Scaling.scaleByWidth(12), vertical: Scaling.scaleByHeight(8)),
                  child: CustomText('Student List', TextStyle(
                    fontSize: Scaling.scaleByHeight(20),
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor
                  )),),
                  VerticalGap(Scaling.scaleByHeight(12)),
                  Expanded(
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: attendance.studentList.length,
                        itemBuilder: ((context, index) {
                          return Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.primaryColor, width: 1)),
                            padding: EdgeInsets.symmetric(horizontal: Scaling.scaleByWidth(6), vertical: Scaling.scaleByHeight(4)),
                            margin: EdgeInsets.symmetric(horizontal: Scaling.scaleByWidth(16), vertical: Scaling.scaleByWidth(16)),
                            child: Row(
                              children: [
                                Checkbox(
                                  checkColor: AppColors.white,
                                  fillColor: MaterialStateProperty.all(
                                      AppColors.primaryColor),
                                  value: attendance.studentList[index].isMarked,
                                  onChanged: (value) {
                                    attendance.studentList[index].isMarked = value!;
                                    if(value){
                                    attendance.studentList[index].attendance = attendance.studentList[index].attendance + 1;
                                    } else{
                                      attendance.studentList[index].attendance = attendance.studentList[index].attendance - 1;
                                    }
                                    List<Student> tempList = attendance.studentList;
                                    attendance.studentList = tempList;
                                    print(attendance.studentList[index].attendance);
                                  },
                                ),
                                CustomText(attendance.studentList[index].name,
                                    TextStyle(color: Colors.white)),
                              ],
                            ),
                          );
                        })),
                  ),
                  VerticalGap(Scaling.scaleByHeight(12)),
                  CustomButton(title: 'Submit', onPress: (){
                    // submit the attendance.
                    attendance.submitAttendance(context);
                  }),
                  VerticalGap(Scaling.scaleByHeight(18)),
                ],
              ),
        );
      }),
    );
  }
}
