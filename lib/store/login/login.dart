import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/models/user_model.dart';
import 'package:mobx/mobx.dart';

part "login.g.dart";

class Login = _LoginStore with _$Login;

abstract class _LoginStore with Store {

  @observable 
  UserModel? user;

  @observable
  bool isStudent = true;

  @observable
  bool isTeacher = false;

  @observable
  TextEditingController numberController = TextEditingController();

  void setUser(UserModel tempUser){
    user = tempUser;
  }

}