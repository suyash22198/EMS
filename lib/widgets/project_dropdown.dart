import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/constants/colors.dart';
import 'package:flutter_boiler_plate/widgets/custom_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ProjectDropDown extends StatefulWidget {
  final List<String> data;
  final Function onChange;
  const ProjectDropDown({ Key? key, required this.data, required this.onChange }) : super(key: key);

  @override
  State<ProjectDropDown> createState() => _ProjectDropDownState();
}

class _ProjectDropDownState extends State<ProjectDropDown> {
    String? dropdownValue;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child:  DropdownButton<String>(
            value: dropdownValue ?? widget.data[0],
            icon: const Icon(Icons.arrow_drop_down_outlined),
            isExpanded: true,
            hint:CustomText('Select Project', TextStyle()),
            elevation: 16,
            underline: Container(
              height: 1,
              color: AppColors.primaryColor,
            ),
            onChanged: (String? newValue) {
              setState(() {
              dropdownValue = newValue!;
              });
              widget.onChange(newValue);
            },
            dropdownColor: AppColors.primaryColor,
            items: widget.data
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: CustomText(value, TextStyle(color: Colors.white)),
              );
            }).toList(),
          )
    );
  }
}