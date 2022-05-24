import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mobx/mobx.dart';

part 'teacher_assignment_upload.g.dart';

class TeacherAssignmentUploadStore = _TeacherAssignmentUploadStore with _$TeacherAssignmentUploadStore;

abstract class _TeacherAssignmentUploadStore with Store { 

/**********************************************************************************/
///OBSERVER
/**********************************************************************************/
///ACTIONS
/**********************************************************************************/
///HELPER METHODS

  Future<void> pickAssignmentFile(int index) async {
    print(index);
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      Uint8List? fileBytes = result.files.first.bytes;
      String fileName = result.files.first.name;
      // Upload file
      await FirebaseStorage.instance.ref('uploads/$fileName').putData(fileBytes!);
    }
  }
}