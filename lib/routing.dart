import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/constants/classes.dart';
import 'package:flutter_boiler_plate/ui/demo_list.dart';
import 'package:flutter_boiler_plate/ui/screen/google_signin.dart';
import 'package:flutter_boiler_plate/ui/screen/otp_screen.dart';
import 'package:flutter_boiler_plate/ui/screen/phone_auth_screen.dart';
import 'package:flutter_boiler_plate/ui/screen/register_screen.dart';
import 'package:flutter_boiler_plate/ui/screen/splash_screen.dart';
import 'package:flutter_boiler_plate/ui/screen/student_attendance.dart';
import 'package:flutter_boiler_plate/ui/screen/student_list_screen.dart';
import 'package:flutter_boiler_plate/ui/screen/subject_list_screen.dart';
import 'package:flutter_boiler_plate/ui/screen/tab_screen.dart';
import 'package:flutter_boiler_plate/ui/screen/teacher_attendance_screen.dart';
import 'package:flutter_boiler_plate/ui/sign_up_screen.dart';

///Created by Naman Gupta on 19/4/21.
class Routing {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Classes.splashScreen:
        {
          return MaterialPageRoute(
              builder: (_) => SplashScreen(),
              settings: RouteSettings(name: settings.name));
        }
      case Classes.googleSignin:
        {
          return MaterialPageRoute(
              builder: (_) => GoogleSignIN(),
              settings: RouteSettings(name: settings.name));
        }
      case Classes.signUpScreen:
        {
          return MaterialPageRoute(
              builder: (_) => SignUpScreen(),
              settings: RouteSettings(name: settings.name));
        }

      case Classes.demoList:
        return MaterialPageRoute(
            builder: (_) => DemoList(),
            settings: RouteSettings(name: settings.name));
      
      case Classes.phoneAuth:
        return MaterialPageRoute(
            builder: (_) => PhoneAuthScreen(),
            settings: RouteSettings(name: settings.name));
      
      case Classes.otpScreen:
        return MaterialPageRoute(
            builder: (_) => OTPScreen(verificationId: settings.arguments as String,),
            settings: RouteSettings(name: settings.name));

      case Classes.tabScreen:
        return MaterialPageRoute(
            builder: (_) => TabScreen(),
            settings: RouteSettings(name: settings.name));
      
      case Classes.registerScreen:
        return MaterialPageRoute(
            builder: (_) => RegisterScreen(),
            settings: RouteSettings(name: settings.name));

      case Classes.teacherAttendance:
        return MaterialPageRoute(
            builder: (_) => TeacherAttendanceScreen(),
            settings: RouteSettings(name: settings.name));
      
      case Classes.studentListScreen:
        return MaterialPageRoute(
            builder: (_) => StudentListScreen(),
            settings: RouteSettings(name: settings.name));
      
      case Classes.subjectListScreen:
        return MaterialPageRoute(
            builder: (_) => SubjectListScreen(),
            settings: RouteSettings(name: settings.name));

      case Classes.studentAttendance:
        return MaterialPageRoute(
            builder: (_) => StudentAttendance(),
            settings: RouteSettings(name: settings.name));

      default:
        return MaterialPageRoute(
            builder: (_) => SplashScreen(), settings: settings);
    }
  }
}
