// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Login on _LoginStore, Store {
  final _$userAtom = Atom(name: '_LoginStore.user');

  @override
  UserModel? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$isStudentAtom = Atom(name: '_LoginStore.isStudent');

  @override
  bool get isStudent {
    _$isStudentAtom.reportRead();
    return super.isStudent;
  }

  @override
  set isStudent(bool value) {
    _$isStudentAtom.reportWrite(value, super.isStudent, () {
      super.isStudent = value;
    });
  }

  final _$isTeacherAtom = Atom(name: '_LoginStore.isTeacher');

  @override
  bool get isTeacher {
    _$isTeacherAtom.reportRead();
    return super.isTeacher;
  }

  @override
  set isTeacher(bool value) {
    _$isTeacherAtom.reportWrite(value, super.isTeacher, () {
      super.isTeacher = value;
    });
  }

  final _$numberControllerAtom = Atom(name: '_LoginStore.numberController');

  @override
  TextEditingController get numberController {
    _$numberControllerAtom.reportRead();
    return super.numberController;
  }

  @override
  set numberController(TextEditingController value) {
    _$numberControllerAtom.reportWrite(value, super.numberController, () {
      super.numberController = value;
    });
  }

  @override
  String toString() {
    return '''
user: ${user},
isStudent: ${isStudent},
isTeacher: ${isTeacher},
numberController: ${numberController}
    ''';
  }
}
