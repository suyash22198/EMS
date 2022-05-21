import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/base/scaling.dart';
import 'package:flutter_boiler_plate/constants/colors.dart';
import 'package:flutter_boiler_plate/store/attendance/attendance.dart';
import 'package:flutter_boiler_plate/widgets/custom_text.dart';
import 'package:flutter_boiler_plate/widgets/vertical_gap.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class StudentAttendance extends StatefulWidget {
  const StudentAttendance({Key? key}) : super(key: key);

  @override
  State<StudentAttendance> createState() => _StudentAttendanceState();
}

class _StudentAttendanceState extends State<StudentAttendance> {
  @override
  Widget build(BuildContext context) {
    Attendance attendance = Provider.of(context,listen: false);
    attendance.getStudentAttenance(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text('Attendance'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: Scaling.scaleByWidth(16), vertical: Scaling.scaleByHeight(12)),
        color: AppColors.secondaryColor,
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Observer(
          builder: (context) {
            return attendance.totals.isEmpty ? Container() : ListView.builder(
              itemCount: attendance.totals.length,
              shrinkWrap: true,
              itemBuilder: ((context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(attendance.subjects[index], TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold, fontSize: Scaling.scaleByHeight(22))),
                  VerticalGap(Scaling.scaleByHeight(12)),
                  CustomText("Present ::  " + attendance.counts[index].toString(), TextStyle(color: AppColors.white, fontWeight: FontWeight.w500, fontSize: Scaling.scaleByHeight(18))),
                  VerticalGap(Scaling.scaleByHeight(8)),
                  CustomText("Absent  ::  " + (attendance.totals[index] - attendance.counts[index]).toString(), TextStyle(color: AppColors.white, fontWeight: FontWeight.w500, fontSize: Scaling.scaleByHeight(18))),
                  VerticalGap(Scaling.scaleByHeight(8)),
                  CustomText("Total   ::  " + attendance.totals[index].toString(), TextStyle(color: AppColors.white, fontWeight: FontWeight.w500, fontSize: Scaling.scaleByHeight(18))),
                  VerticalGap(Scaling.scaleByHeight(12)),
                ],
              );
            }));
          }
        )
      ),
    );
  }
}
