// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Attendance on _AttendanceStore, Store {
  final _$studentListAtom = Atom(name: '_AttendanceStore.studentList');

  @override
  List<Student> get studentList {
    _$studentListAtom.reportRead();
    return super.studentList;
  }

  @override
  set studentList(List<Student> value) {
    _$studentListAtom.reportWrite(value, super.studentList, () {
      super.studentList = value;
    });
  }

  final _$subjectsAtom = Atom(name: '_AttendanceStore.subjects');

  @override
  List<String> get subjects {
    _$subjectsAtom.reportRead();
    return super.subjects;
  }

  @override
  set subjects(List<String> value) {
    _$subjectsAtom.reportWrite(value, super.subjects, () {
      super.subjects = value;
    });
  }

  final _$attendanceListAtom = Atom(name: '_AttendanceStore.attendanceList');

  @override
  ObservableList<List<bool>> get attendanceList {
    _$attendanceListAtom.reportRead();
    return super.attendanceList;
  }

  @override
  set attendanceList(ObservableList<List<bool>> value) {
    _$attendanceListAtom.reportWrite(value, super.attendanceList, () {
      super.attendanceList = value;
    });
  }

  final _$selectedClassAtom = Atom(name: '_AttendanceStore.selectedClass');

  @override
  String get selectedClass {
    _$selectedClassAtom.reportRead();
    return super.selectedClass;
  }

  @override
  set selectedClass(String value) {
    _$selectedClassAtom.reportWrite(value, super.selectedClass, () {
      super.selectedClass = value;
    });
  }

  final _$selectedSubjectAtom = Atom(name: '_AttendanceStore.selectedSubject');

  @override
  String get selectedSubject {
    _$selectedSubjectAtom.reportRead();
    return super.selectedSubject;
  }

  @override
  set selectedSubject(String value) {
    _$selectedSubjectAtom.reportWrite(value, super.selectedSubject, () {
      super.selectedSubject = value;
    });
  }

  final _$totalsAtom = Atom(name: '_AttendanceStore.totals');

  @override
  List<int> get totals {
    _$totalsAtom.reportRead();
    return super.totals;
  }

  @override
  set totals(List<int> value) {
    _$totalsAtom.reportWrite(value, super.totals, () {
      super.totals = value;
    });
  }

  final _$countsAtom = Atom(name: '_AttendanceStore.counts');

  @override
  List<int> get counts {
    _$countsAtom.reportRead();
    return super.counts;
  }

  @override
  set counts(List<int> value) {
    _$countsAtom.reportWrite(value, super.counts, () {
      super.counts = value;
    });
  }

  final _$setStudentListAsyncAction =
      AsyncAction('_AttendanceStore.setStudentList');

  @override
  Future setStudentList(String selectedClass) {
    return _$setStudentListAsyncAction
        .run(() => super.setStudentList(selectedClass));
  }

  final _$submitAttendanceAsyncAction =
      AsyncAction('_AttendanceStore.submitAttendance');

  @override
  Future submitAttendance(dynamic context) {
    return _$submitAttendanceAsyncAction
        .run(() => super.submitAttendance(context));
  }

  @override
  String toString() {
    return '''
studentList: ${studentList},
subjects: ${subjects},
attendanceList: ${attendanceList},
selectedClass: ${selectedClass},
selectedSubject: ${selectedSubject},
totals: ${totals},
counts: ${counts}
    ''';
  }
}
