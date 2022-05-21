import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/base/scaling.dart';
import 'package:flutter_boiler_plate/constants/assets.dart';
import 'package:flutter_boiler_plate/widgets/horizontal_gap.dart';

class CustomRowData extends StatefulWidget {
  final String title;
  final Widget image;
  final String value;
  const CustomRowData(
      {Key? key, required this.title, required this.image, required this.value})
      : super(key: key);

  @override
  State<CustomRowData> createState() => _CustomRowDataState();
}

class _CustomRowDataState extends State<CustomRowData> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            widget.image,
            HorizontalGap(Scaling.scaleByWidth(12)),
            Text(
              widget.title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Scaling.scaleByHeight(18),
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
        Text(
          widget.value,
          style: TextStyle(
              color: Colors.grey,
              fontSize: Scaling.scaleByHeight(18),
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
