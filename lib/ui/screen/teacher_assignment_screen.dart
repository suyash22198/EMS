import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_boiler_plate/constants/colors.dart';
import 'package:flutter_boiler_plate/widgets/custom_button.dart';

class TeacherAssignmentScreen extends StatefulWidget {
  const TeacherAssignmentScreen({Key? key}) : super(key: key);

  @override
  State<TeacherAssignmentScreen> createState() => _TeacherAssignmentScreenState();
}

class _TeacherAssignmentScreenState extends State<TeacherAssignmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          title: Text("Assignment"),
          titleSpacing: 0,
        ),
        backgroundColor: AppColors.secondaryColor,
        body: Center(
          child: CustomButton(title: "Upload Assignment", onPress: () => print("object")),
        ),
    );
  }
}