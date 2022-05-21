import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/base/scaling.dart';
import 'package:flutter_boiler_plate/constants/assets.dart';
import 'package:flutter_boiler_plate/constants/colors.dart';
import 'package:flutter_boiler_plate/widgets/custom_row_data.dart';
import 'package:flutter_boiler_plate/widgets/horizontal_gap.dart';
import 'package:flutter_boiler_plate/widgets/vertical_gap.dart';

class Progress extends StatefulWidget {
  const Progress({Key? key}) : super(key: key);

  @override
  State<Progress> createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey, width: 1))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Progress',
            style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w400,
                fontSize: Scaling.scaleByHeight(28)),
          ),
          VerticalGap(Scaling.scaleByHeight(16)),
          CustomRowData(
              title: 'To do',
              image: Icon(Icons.today_outlined, color: AppColors.primaryColor, size: 30,),
              value: '3'),

            VerticalGap(Scaling.scaleByHeight(16)),

          CustomRowData(
              title: 'Submitted',
              image: Icon(Icons.fact_check_sharp, color: AppColors.primaryColor, size: 30,),
              value: '7'),
          
        ],
      ),
    );
  }
}
