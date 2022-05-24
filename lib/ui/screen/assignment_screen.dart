import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/constants/colors.dart';
import 'package:flutter_boiler_plate/store/assignment_upload/assignment_upload_screen_store.dart';
import 'package:flutter_boiler_plate/widgets/assignment_upload_view.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AssignmentScreen extends StatefulWidget {
  const AssignmentScreen({Key? key}) : super(key: key);

  @override
  State<AssignmentScreen> createState() => _AssignmentScreenState();
}

class _AssignmentScreenState extends State<AssignmentScreen> {
  late AssignmentUploadStore _assignmentUploadStore;

  @override
  void initState() {
    super.initState();

    _assignmentUploadStore = AssignmentUploadStore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          title: Text("Assignment"),
          titleSpacing: 0,
        ),
        backgroundColor: AppColors.secondaryColor,
        body: Observer(
          builder: (_) {
            return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 14,
                itemBuilder: (_, index) {
                  return AssignmentUploadView(
                    index: index,
                    assignmentUploadBtn: _assignmentUploadStore.pickAssignmentFile,
                    assignmentSubmitBtn: _assignmentUploadStore.submitAssignment,
                  );
                });
          }
        ));
  }
}
