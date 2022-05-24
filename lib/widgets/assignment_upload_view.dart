import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/widgets/custom_button.dart';

class AssignmentUploadView extends StatefulWidget {
  int index;
  String? selectedFile;
  String? title;
  Function assignmentUploadBtn;
  Function assignmentSubmitBtn;

  AssignmentUploadView({Key? key, required this.index, this.title, this.selectedFile, required this.assignmentSubmitBtn, required this.assignmentUploadBtn}) : super(key: key);

  @override
  State<AssignmentUploadView> createState() => _AssignmentUploadViewState();
}

class _AssignmentUploadViewState extends State<AssignmentUploadView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      width: double.maxFinite,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.white24,))
      ),
      child: Column(
        children: [

          Row(
            children: [
              Text(
                "Title: ",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18
                ),
              ),

              Text(
                widget.title ?? "",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                  fontSize: 18
                ),
              )
            ],
          ),

          SizedBox(height: 10,),

          Row(
            children: [
              Text(
                "Selected File: ",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18
                ),
              ),

              Text(
                widget.selectedFile ?? "No File is Selected",
                style: TextStyle(
                  color: widget.selectedFile == null ? Colors.amber : Colors.red,
                  fontWeight: FontWeight.w500,
                  fontSize: 18
                ),
              )
            ],
          ),

          SizedBox(height: 20,),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButton(title: "Upload", onPress: () => widget.assignmentUploadBtn(widget.index)),
              SizedBox(width: 10,),
              CustomButton(title: "Submit", onPress: () => widget.assignmentSubmitBtn(widget.index)),
            ],
          )
        ],
      ),
    );
  }
}