import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/base/scaling.dart';
import 'package:flutter_boiler_plate/constants/colors.dart';
import 'package:flutter_boiler_plate/widgets/custom_row_data.dart';
import 'package:flutter_boiler_plate/widgets/vertical_gap.dart';

class SupportWidget extends StatefulWidget {
  const SupportWidget({ Key? key }) : super(key: key);

  @override
  State<SupportWidget> createState() => _SupportWidgetState();
}

class _SupportWidgetState extends State<SupportWidget> {
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
            'Support',
            style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w400,
                fontSize: Scaling.scaleByHeight(28)),
          ),
          VerticalGap(Scaling.scaleByHeight(16)),
          CustomRowData(
              title: 'FAQ',
              image: Icon(Icons.today_outlined, color: AppColors.primaryColor, size: 30,),
              value: ''),

            VerticalGap(Scaling.scaleByHeight(16)),

          CustomRowData(
              title: 'Feedback',
              image: Icon(Icons.fact_check_sharp, color: AppColors.primaryColor, size: 30,),
              value: ''),
          
        ],
      ),
    );
  }
}