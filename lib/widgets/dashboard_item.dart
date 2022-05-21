import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/base/scaling.dart';
import 'package:flutter_boiler_plate/widgets/vertical_gap.dart';

class DashBoardItem extends StatefulWidget {
  final Widget image;
  final String title;
  const DashBoardItem({ Key? key, required this.image, required this.title }) : super(key: key);

  @override
  State<DashBoardItem> createState() => _DashBoardItemState();
}

class _DashBoardItemState extends State<DashBoardItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.black.withOpacity(0.6)),
      padding: EdgeInsets.symmetric(vertical: Scaling.scaleByHeight(8), horizontal: Scaling.scaleByWidth(12)),
      child: Column(
        children: [
          widget.image,
          VerticalGap(Scaling.scaleByHeight(8)),
          Text(widget.title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: Scaling.scaleByHeight(14)),)
        ],
      ),
    );
  }
}