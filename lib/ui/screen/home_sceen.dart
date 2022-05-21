import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/base/scaling.dart';
import 'package:flutter_boiler_plate/constants/assets.dart';
import 'package:flutter_boiler_plate/constants/classes.dart';
import 'package:flutter_boiler_plate/constants/colors.dart';
import 'package:flutter_boiler_plate/store/login/login.dart';
import 'package:flutter_boiler_plate/ui/drawer/drawer_screen.dart';
import 'package:flutter_boiler_plate/widgets/dashboard_item.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
                Login login = Provider.of(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        elevation: 0, backgroundColor: AppColors.secondaryColor,),
      drawer: DrawerScreen(),
      body: Container(
        color: AppColors.secondaryColor,
        padding: EdgeInsets.symmetric(horizontal: Scaling.scaleByWidth(12)),
        height: double.infinity,
        child: GridView(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 18, mainAxisSpacing: 24),

          children: [
            InkWell(
              onTap: (){
                print(login.isStudent);
                if(login.isStudent){
                  Navigator.pushNamed(context, Classes.studentAttendance);
                } else{
                Navigator.pushNamed(context, Classes.teacherAttendance);
                }
              },
              child: DashBoardItem(image: Icon(Icons.person_pin_sharp, color: Colors.white, size: Scaling.scaleByHeight(60)), title: 'Attendance')),
            DashBoardItem(image: Icon(Icons.book_outlined, color: Colors.white, size: Scaling.scaleByHeight(50)), title: 'Notes'),
            DashBoardItem(image: Icon(Icons.feedback_outlined, color: Colors.white, size: Scaling.scaleByHeight(50)), title: 'Feedback'),
            DashBoardItem(image: Image.asset(Assets.HOLIDAY, width: Scaling.scaleByWidth(60), height: Scaling.scaleByHeight(50)), title: 'Planner'),
            DashBoardItem(image: Icon(Icons.note_add_rounded, color: Colors.white, size: Scaling.scaleByHeight(50)), title: 'Assignments'),
            DashBoardItem(image: Image.asset(Assets.DISCUSS, width: Scaling.scaleByWidth(60), height: Scaling.scaleByHeight(60),), title: 'Discuss'),
            DashBoardItem(image: Image.asset(Assets.FORM, width: Scaling.scaleByWidth(60), height: Scaling.scaleByHeight(60)), title: 'Exam Form'),
            DashBoardItem(image: Image.asset(Assets.FEEDBAC, width: Scaling.scaleByWidth(60), height: Scaling.scaleByHeight(60)), title: 'Feedback'),
            DashBoardItem(image: Image.asset(Assets.COMPLAINT, width: Scaling.scaleByWidth(60), height: Scaling.scaleByHeight(60)), title: 'Complaint'),
          ],
        )
      ),
    );
  }
}