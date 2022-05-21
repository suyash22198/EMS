// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Register on _RegisterStore, Store {
  final _$streamListAtom = Atom(name: '_RegisterStore.streamList');

  @override
  List<String> get streamList {
    _$streamListAtom.reportRead();
    return super.streamList;
  }

  @override
  set streamList(List<String> value) {
    _$streamListAtom.reportWrite(value, super.streamList, () {
      super.streamList = value;
    });
  }

  final _$classListAtom = Atom(name: '_RegisterStore.classList');

  @override
  List<String> get classList {
    _$classListAtom.reportRead();
    return super.classList;
  }

  @override
  set classList(List<String> value) {
    _$classListAtom.reportWrite(value, super.classList, () {
      super.classList = value;
    });
  }

  final _$streamAtom = Atom(name: '_RegisterStore.stream');

  @override
  String get stream {
    _$streamAtom.reportRead();
    return super.stream;
  }

  @override
  set stream(String value) {
    _$streamAtom.reportWrite(value, super.stream, () {
      super.stream = value;
    });
  }

  final _$classNameAtom = Atom(name: '_RegisterStore.className');

  @override
  String get className {
    _$classNameAtom.reportRead();
    return super.className;
  }

  @override
  set className(String value) {
    _$classNameAtom.reportWrite(value, super.className, () {
      super.className = value;
    });
  }

  final _$semesterAtom = Atom(name: '_RegisterStore.semester');

  @override
  String get semester {
    _$semesterAtom.reportRead();
    return super.semester;
  }

  @override
  set semester(String value) {
    _$semesterAtom.reportWrite(value, super.semester, () {
      super.semester = value;
    });
  }

  final _$getStreamFromFirebaseAsyncAction =
      AsyncAction('_RegisterStore.getStreamFromFirebase');

  @override
  Future getStreamFromFirebase() {
    return _$getStreamFromFirebaseAsyncAction
        .run(() => super.getStreamFromFirebase());
  }

  final _$getClassFromFirebaseAsyncAction =
      AsyncAction('_RegisterStore.getClassFromFirebase');

  @override
  Future getClassFromFirebase() {
    return _$getClassFromFirebaseAsyncAction
        .run(() => super.getClassFromFirebase());
  }

  @override
  String toString() {
    return '''
streamList: ${streamList},
classList: ${classList},
stream: ${stream},
className: ${className},
semester: ${semester}
    ''';
  }
}
