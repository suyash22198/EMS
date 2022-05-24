// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assignment_upload_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AssignmentUploadStore on _AssignmentUploadStore, Store {
  final _$assignmentFileNameAtom =
      Atom(name: '_AssignmentUploadStore.assignmentFileName');

  @override
  String get assignmentFileName {
    _$assignmentFileNameAtom.reportRead();
    return super.assignmentFileName;
  }

  @override
  set assignmentFileName(String value) {
    _$assignmentFileNameAtom.reportWrite(value, super.assignmentFileName, () {
      super.assignmentFileName = value;
    });
  }

  @override
  String toString() {
    return '''
assignmentFileName: ${assignmentFileName}
    ''';
  }
}
