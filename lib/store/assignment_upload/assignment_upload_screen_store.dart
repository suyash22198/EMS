import 'dart:async';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mobx/mobx.dart';
import 'package:file_picker/file_picker.dart';

part 'assignment_upload_screen_store.g.dart';

class AssignmentUploadStore = _AssignmentUploadStore with _$AssignmentUploadStore;

abstract class _AssignmentUploadStore with Store {

  String destination = "";

/**********************************************************************************/
  ///OBSERVER
   
  @observable
  String assignmentFileName = "";

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

  Future<void> submitAssignment(int index) async {
    destination = "";
    print(index);
  }
}
