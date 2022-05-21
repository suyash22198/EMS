import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/constants/classes.dart';
import 'package:flutter_boiler_plate/models/user_model.dart';
import 'package:flutter_boiler_plate/store/login/login.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

part "register.g.dart";

class Register = _RegisterStore with _$Register;

abstract class _RegisterStore with Store {
  @observable
  List<String> streamList = [];

  @observable
  List<String> classList = [];

  List<String> semesterList = [
    'Semester-1',
    'Semester-2',
    'Semester-3',
    'Semester-4',
    'Semester-5',
    'Semester-6',
    'Semester-7',
    'Semester-8'
  ];

  String fatherName = '';

  String motherName = '';

  @observable
  String stream = '';

  @observable
  String className = '';

  @observable
  String semester = 'Semester-1';

  @action
  getStreamFromFirebase() async {
    FirebaseDatabase.instance.databaseURL =
        'https://erp-system-ca10c-default-rtdb.asia-southeast1.firebasedatabase.app';
    DatabaseReference reference = FirebaseDatabase.instance.ref('Stream');
    DataSnapshot dataSnapshot = await reference.get();
    Map<dynamic, dynamic> data = dataSnapshot.value as Map;
    List<String> streams = [];

    for (var stream in data.keys) {
      streams.add(stream);
    }

    streamList = streams;
    stream = streamList[0];
    print(streamList);
  }

  @action
  getClassFromFirebase() async {
    FirebaseDatabase.instance.databaseURL =
        'https://erp-system-ca10c-default-rtdb.asia-southeast1.firebasedatabase.app';
    DatabaseReference reference = FirebaseDatabase.instance.ref('Class');
    DataSnapshot dataSnapshot = await reference.get();
    print("class list");
    List<String> classes = [];
    for (var item in dataSnapshot.value as List) {
      print(item);
      classes.add(item);
    }
    classList = classes;
    className = classList[0];
  }

  onSubmit(context) async {
    Login login = Provider.of(context, listen: false);
    UserModel user = login.user!;
    print("user ${user.isStudent}");
    FirebaseDatabase.instance.databaseURL =
        'https://erp-system-ca10c-default-rtdb.asia-southeast1.firebasedatabase.app';
        print(fatherName + " " + "mother");
    if (user.isStudent) {
      DatabaseReference reference = FirebaseDatabase.instance.ref('Student');
      Map<String, Map> data = {};
      data[user.uid] = {
        "name": user.name,
        "email": user.email,
        "photoUrl": user.imageUrl,
        "number": user.number,
        "father name": fatherName,
        "mother name": motherName,
        "stream": stream,
        "semester": semester,
        "class": className

      };

      await reference.update(data);

      
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Details are uploaded successfully.')));
      Navigator.pushNamedAndRemoveUntil(context, Classes.tabScreen, (route) => false);

    } else {
      DatabaseReference reference = FirebaseDatabase.instance.ref('Teacher');
      Map<String, Map> data = {};
      data[user.uid] = {
        "name": user.name,
        "email": user.email,
        "photoUrl": user.imageUrl,
        "number": user.number,
        "father name": fatherName,
        "mother name": motherName,
        "stream": stream,
        "semester": semester
      };

      await reference.update(data);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Details are uploaded successfully.')));
      Navigator.pushNamedAndRemoveUntil(context, Classes.tabScreen, (route) => false);
    }
  }
}
