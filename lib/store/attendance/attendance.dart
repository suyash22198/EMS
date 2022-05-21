import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/base/firebase_method.dart';
import 'package:flutter_boiler_plate/constants/classes.dart';
import 'package:flutter_boiler_plate/models/student.dart';
import 'package:flutter_boiler_plate/models/user_model.dart';
import 'package:flutter_boiler_plate/store/login/login.dart';
import 'package:flutter_boiler_plate/store/register/register.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

part "attendance.g.dart";

class Attendance = _AttendanceStore with _$Attendance;

abstract class _AttendanceStore with Store {
  @observable
  List<Student> studentList = [];

  @observable
  List<String> subjects = [];

  @observable
  ObservableList<List<bool>> attendanceList = ObservableList();

  @observable
  String selectedClass = '';

  @observable
  String selectedSubject = '';

  @observable
  List<int> totals = [];

  @observable
  List<int> counts = [];

  @action
  setStudentList(String selectedClass) async {
    print(selectedClass);
    Map result = await FirebaseMethods().fetchStudentList();
    List<Student> students = [];

    for (int i = 0; i < result.values.length; i++) {
      Map student = result.values.elementAt(i) as Map;
      if (student['class'].toString().compareTo(selectedClass) == 0) {
        students.add(Student(
            fatherName: student['father name'],
            motherName: student['mother name'],
            number: student['number'],
            photoUrl: student['photoUrl'],
            semester: student['semester'],
            stream: student['stream'],
            name: student['name'],
            uid: result.keys.elementAt(i),
            email: student['email'],
            attendance:
                student.containsKey('attendance') ? student['attendance'] : 0,
            isMarked: false));
      }
    }

    result.values.forEach((element) {});

    studentList = students;
    print(studentList.length);
  }

  getSubjectFromFirebase(String classname) async {
    FirebaseDatabase.instance.databaseURL =
        'https://erp-system-ca10c-default-rtdb.asia-southeast1.firebasedatabase.app';
    DatabaseReference reference = FirebaseDatabase.instance.ref('Subjects');
    DataSnapshot dataSnapshot = await reference.child(classname).get();
    print('subjects');
    print(dataSnapshot.value);
    List temp = dataSnapshot.value as List;
    List<String> subjectList = [];
    for (var item in temp) {
      subjectList.add(item);
    }

    subjects = subjectList;
  }

  @action
  submitAttendance(context) async {
    FirebaseDatabase.instance.databaseURL =
        'https://erp-system-ca10c-default-rtdb.asia-southeast1.firebasedatabase.app';
    DatabaseReference reference = FirebaseDatabase.instance
        .ref('Attendance')
        .child(selectedClass)
        .child(selectedSubject);

    print(studentList[0].uid);
    print(selectedClass);
    print(selectedSubject);

    DataSnapshot snapshot = await reference.get();
    print(snapshot.value);

    if (snapshot.value == null) {
      reference.update({'total': 1});
      for (var student in studentList) {
        Map<String, dynamic> data = {};
        print(student.uid);
        data = {
          student.uid: {'count': student.isMarked ? 1 : 0}
        };

        await reference.update(data);
      }
    } else {
      print(snapshot.value);
      Map attendanceValue = snapshot.value as Map;
      if (attendanceValue.containsKey('total')) {
        reference.update({'total': attendanceValue['total'] + 1});
      }
      for (var student in studentList) {
        Map<String, Map> data = {};

        if (attendanceValue.containsKey(student.uid)) {
          Map values = attendanceValue[student.uid] as Map;
          data[student.uid] = {
            'count': student.isMarked ? values['count'] + 1 : values['count']
          };
        } else {
          data[student.uid] = {'count': student.isMarked ? 1 : 0};
        }

        await reference.update(data);
      }
    }
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Attendance Submmited.')));
     
     Navigator.pushNamedAndRemoveUntil(context, Classes.tabScreen, (route) => false);
  }

  getStudentAttenance(context) async {
    Login login = Provider.of(context, listen: false);
    UserModel user = login.user!;
    print(user.uid);

    FirebaseDatabase.instance.databaseURL =
        'https://erp-system-ca10c-default-rtdb.asia-southeast1.firebasedatabase.app';
    DatabaseReference reference = FirebaseDatabase.instance
        .ref('Student').child(user.uid).child('class');
       DataSnapshot snapshot = await reference.get();
       print(snapshot.value);

       reference = FirebaseDatabase.instance
        .ref('Attendance').child(snapshot.value.toString());

        DataSnapshot attendanceData = await reference.get();
        Map attendanceMap = attendanceData.value as Map;
        List<String> subjectList = [];
        List<int> presentList = [];
        List<int> totalList = [];
       attendanceMap.keys.forEach((element) {
        subjectList.add(element);
        Map keyMap = attendanceMap[element] as Map;
       print(keyMap);
        if(keyMap.containsKey(user.uid)){
          Map countMap = keyMap[user.uid] as Map;
        presentList.add(countMap['count']); 
        totalList.add(keyMap['total']);
        } else{
          presentList.add(0);
        }
       });

       subjects = subjectList;
       totals = totalList;
       counts = presentList;

       print(subjects);
       print(presentList);
       print(totalList);
  }
}
